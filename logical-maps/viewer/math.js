/* Shared KaTeX rendering for static pages and dynamically inserted map prose. */
(() => {
  'use strict';
  const options = {
    delimiters: [
      {left: '$$', right: '$$', display: true},
      {left: '\\[', right: '\\]', display: true},
      {left: '\\(', right: '\\)', display: false},
      {left: '$', right: '$', display: false}
    ],
    ignoredTags: ['script', 'noscript', 'style', 'textarea', 'pre', 'code', 'option', 'svg', 'math'],
    ignoredClasses: ['katex', 'katex-error', 'no-math', 'file'],
    output: 'htmlAndMathml', throwOnError: false, trust: false,
    strict: 'warn'
  };
  window.renderMapMath = root => {
    if (!root || root.closest?.('svg, math, .katex, pre, code, .no-math')) return;
    const formulas = [...root.querySelectorAll('.math')];
    if (root.matches?.('.math')) formulas.unshift(root);
    for (const formula of formulas) {
      if (formula.querySelector('.katex, .katex-error') || formula.closest('pre, code, svg, math')) continue;
      window.katex.render(formula.textContent, formula, {...options, displayMode: formula.classList.contains('display')});
    }
    window.renderMathInElement(root, options);
  };
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', () => window.renderMapMath(document.body), {once: true});
  } else window.renderMapMath(document.body);
})();
