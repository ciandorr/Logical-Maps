/* Apply before paint; share the preference between every map and write-up. */
(() => {
  const key = 'pmap-theme';
  const paletteKey = 'pmap-palette';
  const system = window.matchMedia?.('(prefers-color-scheme: dark)');
  let preference;
  let palette;
  try { preference = localStorage.getItem(key); } catch (_) {}
  try { palette = localStorage.getItem(paletteKey); } catch (_) {}
  if (!['light', 'dark'].includes(preference)) preference = null;
  if (palette !== 'colourblind') palette = 'default';
  function apply(theme) {
    document.documentElement.dataset.theme = theme;
    document.querySelectorAll('[data-theme-toggle]').forEach(button => {
      button.textContent = theme === 'dark' ? '[Light mode]' : '[Dark mode]';
      button.setAttribute('aria-label', `Switch to ${theme === 'dark' ? 'light' : 'dark'} mode`);
    });
  }
  function applyPalette() {
    document.documentElement.dataset.palette = palette;
    document.querySelectorAll('[data-colourblind-toggle]').forEach(button => {
      button.setAttribute('aria-pressed', String(palette === 'colourblind'));
      button.textContent = `[Colourblind mode: ${palette === 'colourblind' ? 'on' : 'off'}]`;
    });
  }
  const initial = () => preference || (system?.matches ? 'dark' : 'light');
  apply(initial());
  applyPalette();
  document.addEventListener('DOMContentLoaded', () => {
    apply(initial());
    applyPalette();
    document.querySelectorAll('[data-theme-toggle]').forEach(button => {
      button.addEventListener('click', () => {
        preference = document.documentElement.dataset.theme === 'dark' ? 'light' : 'dark';
        apply(preference);
        try { localStorage.setItem(key, preference); } catch (_) {}
      });
    });
    document.querySelectorAll('[data-colourblind-toggle]').forEach(button => {
      button.addEventListener('click', () => {
        palette = palette === 'colourblind' ? 'default' : 'colourblind';
        applyPalette();
        try { localStorage.setItem(paletteKey, palette); } catch (_) {}
      });
    });
  });
  system?.addEventListener('change', () => { if (!preference) apply(initial()); });
  window.addEventListener('storage', event => {
    if (event.key === key || event.key === null) {
      preference = ['light', 'dark'].includes(event.newValue) ? event.newValue : null;
      apply(initial());
    }
    if (event.key === paletteKey || event.key === null) {
      palette = event.newValue === 'colourblind' ? 'colourblind' : 'default';
      applyPalette();
    }
  });
})();
