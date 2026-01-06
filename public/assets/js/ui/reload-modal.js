document.addEventListener('DOMContentLoaded', () => {

    const modal = document.getElementById('reloadModal');
    if (!modal) return;

    const openBtn = document.querySelector('.modal-reload');
    const closeBtn = modal.querySelector('.uondr-close');
    const acceptBtn = document.getElementById('btnReloadAccept');
    const cancelBtn = document.getElementById('btnReloadCancel');

    const open = () => modal.classList.add('show');
    const close = () => modal.classList.remove('show');

    openBtn?.addEventListener('click', e => {
        e.preventDefault();
        open();
    });

    acceptBtn?.addEventListener('click', () => location.reload());
    cancelBtn?.addEventListener('click', close);
    closeBtn?.addEventListener('click', close);

    modal.addEventListener('click', e => {
        if (e.target === modal) close();
    });

});
