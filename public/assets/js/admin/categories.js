/**
 * ============================================================
 *  ADMIN - CATEGORÍAS
 *  Archivo JS para manejar:
 *  - Ordenamiento Drag & Drop
 *  - Guardado de orden
 *  - Edición por AJAX
 * ============================================================
 */

document.addEventListener('DOMContentLoaded', function() {

    /**
     * ============================================================
     * 1️⃣ ACTIVAR DRAG & DROP EN CADA TABLA
     * ============================================================
     */
    document.querySelectorAll('.sortable').forEach(tbody => {
        new Sortable(tbody, {
            animation: 150,
            handle: 'tr',
            ghostClass: 'bg-light',
        });
    });

    /**
     * ============================================================
     * 2️⃣ GUARDAR EL NUEVO ORDEN DE CATEGORÍAS
     * ============================================================
     */
    document.querySelectorAll('.save-order').forEach(button => {
        button.addEventListener('click', function() {
            const style = this.dataset.style;
            const tbody = document.querySelector(`.sortable-table[data-style="${style}"] tbody`);
            const order = Array.from(tbody.querySelectorAll('tr')).map(tr => tr.dataset.id);

            fetch('/admin/categories/reorder', {
                method: 'POST',
                headers: {
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content,
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ order })
            })
            .then(res => res.json())
            .then(data => {
                if (data.success) {
                   Swal.fire({
                        title: 'Orden actualizado',
                        text: `El orden de "${style}" se guardó correctamente ✅`,
                        icon: 'success',
                        showConfirmButton: false,
                        timer: 1500, // duración total del mensaje (1.5 s)
                        timerProgressBar: true
                    });

                    setTimeout(() => {
                        location.reload();
                    }, 1500);
                } else {
                    Swal.fire({
                        title: 'Error',
                        text: 'Hubo un problema al guardar el orden.',
                        icon: 'error',
                        confirmButtonColor: '#dc3545',
                        confirmButtonText: 'Cerrar'
                    });
                }
            })
            .catch(err => {
                console.error('Error al guardar el orden:', err);
            });
        });
    });

    /**
     * ============================================================
     * 3️⃣ MODAL DE EDICIÓN: CARGAR DATOS DINÁMICAMENTE
     * ============================================================
     */
    const editModal = document.getElementById('editCategoryModal');
    const editForm = document.getElementById('editCategoryForm');

    document.querySelectorAll('.btn-edit-category').forEach(button => {
        button.addEventListener('click', function () {
            const { id, name, orden, style, active } = this.dataset;

            editForm.dataset.id = id;
            editForm.querySelector('[name="name"]').value = name;
            editForm.querySelector('[name="orden"]').value = orden;
            editForm.querySelector('[name="style"]').value = style;
            editForm.querySelector('[name="is_active"]').checked = active == 1;
        });
    });

    /**
     * ============================================================
     * 4️⃣ ENVÍO DEL FORMULARIO DE EDICIÓN POR AJAX
     * ============================================================
     */
    editForm.addEventListener('submit', function(e) {
        e.preventDefault();

        const id = this.dataset.id;
        const formData = new FormData(editForm);

        fetch(`/admin/categories/${id}`, {
            method: 'POST', // Laravel maneja _method=PUT
            headers: {
                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content,
                'Accept': 'application/json'
            },
            body: formData
        })
        .then(async res => {
            if (!res.ok) {
                const errorData = await res.json();
                let msg = 'Errores:\n';
                for (const key in errorData.errors) {
                    msg += `${key}: ${errorData.errors[key].join(', ')}\n`;
                }
                throw new Error(msg);
            }
            return res.json();
        })
        .then(data => {
            if (data.success) {
               Swal.fire({
                title: 'Categoría actualizada',
                text: 'La categoría se actualizó correctamente ✅',
                icon: 'success',
                showConfirmButton: false,
                timer: 1500, // duración total del mensaje (1.5 s)
                timerProgressBar: true
            });

            setTimeout(() => {
                location.reload();
            }, 1500);
            }
        })
        .catch(err => {
            console.error(err);
            alert(err.message);
        });
    });

    /**
     * ============================================================
     * 5️⃣ LIMPIAR EL MODAL CUANDO SE CIERRA
     * ============================================================
     */
    editModal.addEventListener('hidden.bs.modal', function () {
        editForm.reset();
        delete editForm.dataset.id;
    });

});
