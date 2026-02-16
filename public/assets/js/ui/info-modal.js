document.addEventListener('DOMContentLoaded', () => {

    const modal = document.getElementById('uondrModal');
    if (!modal) return;

    const openBtn = document.querySelector('.modal-info');
    const closeBtn = modal.querySelector('.uondr-close');

    const open = () => modal.classList.add('show');
    const close = () => modal.classList.remove('show');

    // Fecha actual en formato YYYY-MM-DD
    const today = new Date().toISOString().split('T')[0];

    // Clave única para el modal
    const storageKey = 'uondrModalLastShown';

    // Revisar si ya se mostró hoy
    const lastShown = localStorage.getItem(storageKey);

    if (lastShown !== today) {
        open();
        localStorage.setItem(storageKey, today);
    }

    // Botón manual (siempre permite abrir)
    openBtn?.addEventListener('click', e => {
        e.preventDefault();
        open();
    });

    closeBtn?.addEventListener('click', close);

    modal.addEventListener('click', e => {
        if (e.target === modal) close();
    });

});
