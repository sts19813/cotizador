document.addEventListener('DOMContentLoaded', () => {

    document.querySelectorAll('.capturar').forEach(btn => {
        btn.addEventListener('click', () => {

            const wrappers = document.querySelectorAll('.thumb-wrapper');

            const miniaturasData = Array.from(wrappers).map(wrapper => ({
                base: wrapper.querySelector('img.tumb-original')?.src || '',
                overlays: Array.from(
                    wrapper.querySelectorAll('.overlay-container img')
                ).map(img => img.src)
            }));

            localStorage.setItem(
                'miniaturasData',
                JSON.stringify(miniaturasData)
            );

            window.location.href = '/resumen';
        });
    });

});
