/* Apply before paint; share the preference between every map and write-up. */
(() => {
  const key = 'pmap-theme';
  const system = window.matchMedia?.('(prefers-color-scheme: dark)');
  let preference;
  try { preference = localStorage.getItem(key); } catch (_) {}
  if (!['light', 'dark'].includes(preference)) preference = null;
  function apply(theme) {
    document.documentElement.dataset.theme = theme;
    document.querySelectorAll('[data-theme-toggle]').forEach(button => {
      button.textContent = theme === 'dark' ? '[Light mode]' : '[Dark mode]';
      button.setAttribute('aria-label', `Switch to ${theme === 'dark' ? 'light' : 'dark'} mode`);
    });
  }
  const initial = () => preference || (system?.matches ? 'dark' : 'light');
  apply(initial());
  document.addEventListener('DOMContentLoaded', () => {
    apply(initial());
    document.querySelectorAll('[data-theme-toggle]').forEach(button => {
      button.addEventListener('click', () => {
        preference = document.documentElement.dataset.theme === 'dark' ? 'light' : 'dark';
        apply(preference);
        try { localStorage.setItem(key, preference); } catch (_) {}
      });
    });
  });
  system?.addEventListener('change', () => { if (!preference) apply(initial()); });
  window.addEventListener('storage', event => {
    if (event.key !== key && event.key !== null) return;
    preference = ['light', 'dark'].includes(event.newValue) ? event.newValue : null;
    apply(initial());
  });
})();
