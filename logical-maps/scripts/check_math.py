#!/usr/bin/env python3
"""Check authored TeX, both Markdown paths, and offline KaTeX assets (needs Node)."""
from html.parser import HTMLParser
import json
from pathlib import Path
import re
import subprocess

import pmap


class Formulas(HTMLParser):
    def __init__(self):
        super().__init__()
        self.formulas = []
        self.current = None

    def handle_starttag(self, tag, attrs):
        classes = dict(attrs).get('class', '').split()
        if tag == 'span' and 'math' in classes:
            self.current = {'math': '', 'display': 'display' in classes}

    def handle_data(self, data):
        if self.current is not None:
            self.current['math'] += data

    def handle_endtag(self, tag):
        if tag == 'span' and self.current is not None:
            self.formulas.append(self.current)
            self.current = None


def formulas(html):
    parser = Formulas()
    parser.feed(html)
    return parser.formulas


def main():
    sample = r'''Inline $x_{n+1}^2$, \(\frac{a}{b}\), and escaped dollar \$5.

$$
\begin{aligned}
a&=\frac{1}{2}\\
b&=\sum_{n=1}^{\infty}2^{-n}
\end{aligned}
$$

\[P(X>t)\le 1\]

`$literal_{code}$`

```tex
\[literal^2\]
```

    $indented_code$

| Formula | Text |
| --- | --- |
| $A\land B$ | conjunction |
'''
    standard = formulas(pmap._md_to_html(sample))
    fallback = formulas(pmap._markdown_fallback(sample))
    assert standard == fallback, (standard, fallback)
    assert len(standard) == 5, standard
    assert 'literal_{code}' in pmap._markdown_fallback(sample)
    assert 'PMAPMATHTOKEN0ENDTOKEN' in pmap._markdown_fallback('PMAPMATHTOKEN0ENDTOKEN $x^2$')

    all_math = []
    for topic in sorted(pmap.TOPICS.iterdir()):
        if not (topic / 'topic.yaml').exists():
            continue
        data = pmap.load_topic(topic.name)
        for kind in ['principles', 'results', 'models']:
            for item in data[kind]:
                for field in ['statement', 'formal', 'proof', 'description', 'notes']:
                    source = item.get(field)
                    if not source:
                        continue
                    # Treat YAML prose like browser text, with explicit delimiters.
                    for f in formulas(pmap._markdown_fallback(source)):
                        all_math.append({**f, 'where': f'{topic.name}/{item["id"]}:{field}'})
        for path in [*topic.glob('*.md'), *(topic / 'writeups').glob('*.md')]:
            md = path.read_text()
            a, b = formulas(pmap._md_to_html(md)), formulas(pmap._markdown_fallback(md))
            assert a == b, f'Math differs with/without Pandoc: {path}'
            for f in a:
                all_math.append({**f, 'where': str(path.relative_to(pmap.ROOT))})
    check = r'''
const fs = require('node:fs'), katex = require('./viewer/vendor/katex/katex.min.js');
const formulas = JSON.parse(fs.readFileSync(0, 'utf8'));
const errors = [];
for (const f of formulas) {
  try { katex.renderToString(f.math, {displayMode:f.display, throwOnError:true, strict:'error'}); }
  catch (e) { errors.push(f.where + ': ' + e.message); }
}
if (errors.length) { console.error(errors.join('\n')); process.exit(1); }
console.log(`PASS: ${formulas.length} authored formulas render with KaTeX.`);
'''
    subprocess.run(['node', '-e', check], input=json.dumps(all_math), text=True, cwd=pmap.ROOT, check=True)
    assets = pmap.math_assets()
    css = assets['katex.min.css'].decode()
    fonts = re.findall(r'url\(([^)]+)\)', css)
    assert fonts and all(font in assets for font in fonts), fonts
    assert all(font.endswith('.woff2') for font in fonts)
    inline = pmap.math_head(None)
    assert '<script defer src=' not in inline and 'url(fonts/' not in inline
    assert 'data:font/woff2;base64,' in inline
    assert 'Permission is hereby granted' in inline
    assert '0.18.7' == assets['VERSION'].decode().strip()
    assert b'MIT License' in assets['LICENSE']
    print('PASS: Markdown math agrees with/without Pandoc; offline fonts, scripts and licence are complete.')


if __name__ == '__main__':
    main()
