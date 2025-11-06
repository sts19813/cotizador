document.addEventListener("DOMContentLoaded", () => {

    const loader = document.getElementById('loaderOverlay');
    const form = document.getElementById('massUpdateForm');
    const exportBtn = document.getElementById('exportBtn');
    const importBtn = document.getElementById('importBtn');
    const importFile = document.getElementById('importFile');
    const table = document.getElementById('pricesTable');

    // ===============================
    // EXPORTAR EXCEL
    // ===============================
    exportBtn.addEventListener('click', () => {
        const wb = XLSX.utils.table_to_book(table, { sheet: "Precios" });
        XLSX.writeFile(wb, `plantilla_precios_${styleName()}.xlsx`);
    });

    // ===============================
    // IMPORTAR EXCEL
    // ===============================
    importBtn.addEventListener('click', () => {
        if (!importFile.files.length) {
            Swal.fire("Selecciona un archivo primero", "", "warning");
            return;
        }

        const file = importFile.files[0];
        const reader = new FileReader();
        reader.onload = (e) => {
            const data = new Uint8Array(e.target.result);
            const wb = XLSX.read(data, { type: 'array' });
            const ws = wb.Sheets[wb.SheetNames[0]];
            const json = XLSX.utils.sheet_to_json(ws, { header: 1 });

            for (let i = 1; i < json.length; i++) {
                const row = json[i];
                const id = row[0];
                if (!id) continue;

                const inputs = document.querySelectorAll(`#pricesTable tbody tr td input[name^="products[${id}]"]`);
                for (let j = 0; j < inputs.length; j++) {
                    if (row[j + 4] !== undefined) {
                        inputs[j].value = row[j + 4]; // ajustado porque agregamos "Categoría"
                    }
                }
            }

            Swal.fire({
                icon: 'success',
                title: 'Datos importados',
                text: 'Los valores se cargaron en la tabla.',
                timer: 2000,
                showConfirmButton: false
            });
        };
        reader.readAsArrayBuffer(file);
    });

    // ===============================
    // ENVÍO AJAX CON LOADER + ALERTA
    // ===============================
    form.addEventListener('submit', (e) => {
        e.preventDefault();

        Swal.fire({
            title: '¿Guardar los cambios?',
            text: "Se actualizarán todos los precios.",
            icon: 'question',
            showCancelButton: true,
            confirmButtonText: 'Sí, guardar',
            cancelButtonText: 'Cancelar'
        }).then(result => {
            if (!result.isConfirmed) return;

            loader.style.display = "flex"; // mostrar loader

            fetch(form.action, {
                method: 'POST',
                body: new FormData(form)
            })
            .then(res => {
                debugger
                loader.style.display = "none";

                if (!res.ok) throw new Error('Error en la actualización.');

                Swal.fire({
                    icon: 'success',
                    title: 'Precios actualizados ✅',
                    text: 'Los cambios se guardaron correctamente.',
                    timer: 2000,
                    showConfirmButton: false
                });

                setTimeout(() => location.reload(), 2000);
            })
            .catch(() => {
                debugger
                loader.style.display = "none";
                Swal.fire("Error", "Hubo un problema al guardar los cambios.", "error");
            });
        });
    });

    // ===============================
    // Helper para el nombre del estilo
    // ===============================
    function styleName() {
        const title = document.querySelector('h3.mb-4');
        return title ? title.textContent.replace("Precios - ", "").trim() : "estilo";
    }

});
