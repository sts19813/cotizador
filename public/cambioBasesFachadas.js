let slug = window.location.pathname.split("/").filter(Boolean).pop() || "home";
console.log(slug);

$(document).ready(function () {
    // Cuando eligen una habitación
    $("#opciones-habitaciones .option-card").on("click", function () {
        let habitacionId = $(this).data("id"); // ej. "1Recamara", "2Recamaras", etc.

        // Ocultamos todas las fachadas
        $("#opciones-fachada .option-card").parent().hide();

        let fachadaA = null;

        // Mostramos solo las que corresponden
        if (habitacionId === "1Recamara") {
            $('#opciones-fachada .option-card[data-pre_code="FAC01"]').parent().show();
            fachadaA = $('#opciones-fachada .option-card[data-pre_code="FAC01"][data-valor="Fachada A"]');
        }
        if (habitacionId === "2Recamaras") {
            $('#opciones-fachada .option-card[data-pre_code="FAC02"]').parent().show();
            fachadaA = $('#opciones-fachada .option-card[data-pre_code="FAC02"][data-valor="Fachada 2A"]');
        }
        if (habitacionId === "3Recamaras") {
            $('#opciones-fachada .option-card[data-pre_code="FAC03"]').parent().show();
            fachadaA = $('#opciones-fachada .option-card[data-pre_code="FAC03"][data-valor="Fachada 3A"]');
        }
        if (habitacionId === "4Recamaras") {
            $('#opciones-fachada .option-card[data-pre_code="FAC04"]').parent().show();
            fachadaA = $('#opciones-fachada .option-card[data-pre_code="FAC04"][data-valor="Fachada 4A"]');
        }

        // Seleccionar automáticamente la fachada A
        if (fachadaA && fachadaA.length) {
            fachadaA.trigger("click");
        }
    });

    // Opcional: al inicio ocultamos todas y mostramos solo las de 1 recámara
    $("#opciones-fachada .option-card").parent().hide();
    $('#opciones-fachada .option-card[data-pre_code="FAC01"]').parent().show();
});

function CambioBases(items, valor) {

	if(slug == "home"){
		if (valor === 'Fachada A') {
			items[0].src = '/bases/minimalista/min01-01-A.webp';
			items[1].src = '/bases/minimalista/min01-02-A.webp';
			items[2].src = '/bases/minimalista/min01-03-A.webp';
			items[3].src = '/bases/minimalista/min01-04-A.webp';
		}

		if (valor === 'Fachada B') {
			items[0].src = '/bases/minimalista/min01-01-B.webp';
			items[1].src = '/bases/minimalista/min01-02-B.webp';
			items[2].src = '/bases/minimalista/min01-03-B.webp';
			items[3].src = '/bases/minimalista/min01-04-B.webp';
		}


		if (valor === 'Fachada 2A') {
			items[0].src = '/bases/minimalista/min02-01-A.webp';
			items[1].src = '/bases/minimalista/min02-02-A.webp';
			items[2].src = '/bases/minimalista/min02-03-A.webp';
			items[3].src = '/bases/minimalista/min02-04-A.webp';
		}

		if (valor === 'Fachada 2B') {
			items[0].src = '/bases/minimalista/min02-01-B.webp';
			items[1].src = '/bases/minimalista/min02-02-B.webp';
			items[2].src = '/bases/minimalista/min02-03-B.webp';
			items[3].src = '/bases/minimalista/min02-04-B.webp';
		}

		if (valor === 'Fachada 3A') {
			items[0].src = '/bases/minimalista/min03-01-A.webp';
			items[1].src = '/bases/minimalista/min03-02-A.webp';
			items[2].src = '/bases/minimalista/min03-03-A.webp';
			items[3].src = '/bases/minimalista/min03-04-A.webp';
		}

		if (valor === 'Fachada 3B') {
			items[0].src = '/bases/minimalista/min03-01-B.webp';
			items[1].src = '/bases/minimalista/min03-02-B.webp';
			items[2].src = '/bases/minimalista/min03-03-B.webp';
			items[3].src = '/bases/minimalista/min03-04-B.webp';
		}

		if (valor === 'Fachada 4A') {
			items[0].src = '/bases/minimalista/min04-01-A.webp';
			items[1].src = '/bases/minimalista/min04-02-A.webp';
			items[2].src = '/bases/minimalista/min04-03-A.webp';
			items[3].src = '/bases/minimalista/min04-04-A.webp';
		}
	}

	if(slug == "tulum"){
		if (valor === 'Fachada A') {
			items[0].src = '/bases/tulum/min01-01-A.webp';
			items[1].src = '/bases/tulum/min01-02-A.webp';
			items[2].src = '/bases/tulum/min01-03-A.webp';
			items[3].src = '/bases/tulum/min01-04-A.webp';
		}

		if (valor === 'Fachada B') {
			items[0].src = '/bases/tulum/min01-01-B.webp';
			items[1].src = '/bases/tulum/min01-02-B.webp';
			items[2].src = '/bases/tulum/min01-03-B.webp';
			items[3].src = '/bases/tulum/min01-04-B.webp';
		}


		if (valor === 'Fachada 2A') {
			items[0].src = '/bases/tulum/min02-01-A.webp';
			items[1].src = '/bases/tulum/min02-02-A.webp';
			items[2].src = '/bases/tulum/min02-03-A.webp';
			items[3].src = '/bases/tulum/min02-04-A.webp';
		}

		if (valor === 'Fachada 2B') {
			items[0].src = '/bases/tulum/min02-01-B.webp';
			items[1].src = '/bases/tulum/min02-02-B.webp';
			items[2].src = '/bases/tulum/min02-03-B.webp';
			items[3].src = '/bases/tulum/min02-04-B.webp';
		}

		if (valor === 'Fachada 3A') {
			items[0].src = '/bases/tulum/min03-01-A.webp';
			items[1].src = '/bases/tulum/min03-02-A.webp';
			items[2].src = '/bases/tulum/min03-03-A.webp';
			items[3].src = '/bases/tulum/min03-04-A.webp';
		}

		if (valor === 'Fachada 3B') {
			items[0].src = '/bases/tulum/min03-01-B.webp';
			items[1].src = '/bases/tulum/min03-02-B.webp';
			items[2].src = '/bases/tulum/min03-03-B.webp';
			items[3].src = '/bases/tulum/min03-04-B.webp';
		}

		if (valor === 'Fachada 4A') {
			items[0].src = '/bases/tulum/min04-01-A.webp';
			items[1].src = '/bases/tulum/min04-02-A.webp';
			items[2].src = '/bases/tulum/min04-03-A.webp';
			items[3].src = '/bases/tulum/min04-04-A.webp';
		}
	}
	if(slug == "mexicano"){
		if (valor === 'Fachada A') {
			items[0].src = '/bases/mexicano/min01-01-A.webp';
			items[1].src = '/bases/mexicano/min01-02-A.webp';
			items[2].src = '/bases/mexicano/min01-03-A.webp';
			items[3].src = '/bases/mexicano/min01-04-A.webp';
		}

		if (valor === 'Fachada B') {
			items[0].src = '/bases/mexicano/min01-01-B.webp';
			items[1].src = '/bases/mexicano/min01-02-B.webp';
			items[2].src = '/bases/mexicano/min01-03-B.webp';
			items[3].src = '/bases/mexicano/min01-04-B.webp';
		}


		if (valor === 'Fachada 2A') {
			items[0].src = '/bases/mexicano/min02-01-A.webp';
			items[1].src = '/bases/mexicano/min02-02-A.webp';
			items[2].src = '/bases/mexicano/min02-03-A.webp';
			items[3].src = '/bases/mexicano/min02-04-A.webp';
		}

		if (valor === 'Fachada 2B') {
			items[0].src = '/bases/mexicano/min02-01-B.webp';
			items[1].src = '/bases/mexicano/min02-02-B.webp';
			items[2].src = '/bases/mexicano/min02-03-B.webp';
			items[3].src = '/bases/mexicano/min02-04-B.webp';
		}

		if (valor === 'Fachada 3A') {
			items[0].src = '/bases/mexicano/min03-01-A.webp';
			items[1].src = '/bases/mexicano/min03-02-A.webp';
			items[2].src = '/bases/mexicano/min03-03-A.webp';
			items[3].src = '/bases/mexicano/min03-04-A.webp';
		}

		if (valor === 'Fachada 3B') {
			items[0].src = '/bases/mexicano/min03-01-B.webp';
			items[1].src = '/bases/mexicano/min03-02-B.webp';
			items[2].src = '/bases/mexicano/min03-03-B.webp';
			items[3].src = '/bases/mexicano/min03-04-B.webp';
		}

		if (valor === 'Fachada 4A') {
			items[0].src = '/bases/mexicano/min04-01-A.webp';
			items[1].src = '/bases/mexicano/min04-02-A.webp';
			items[2].src = '/bases/mexicano/min04-03-A.webp';
			items[3].src = '/bases/mexicano/min04-04-A.webp';
		}
	}
	cambiarImagen(0);
}