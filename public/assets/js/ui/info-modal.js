document.addEventListener('DOMContentLoaded', () => {

    const modal = document.getElementById('uondrModal');
    if (!modal) return;

    const openBtn = document.querySelector('.modal-info');
    const closeBtn = modal.querySelector('.uondr-close');

    const open = () => modal.classList.add('show');
    const close = () => modal.classList.remove('show');

    openBtn?.addEventListener('click', e => {
        e.preventDefault();
        open();
    });

    closeBtn?.addEventListener('click', close);

    modal.addEventListener('click', e => {
        if (e.target === modal) close();
    });

    // auto-open primera vez
    open();
});
