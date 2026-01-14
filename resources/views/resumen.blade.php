<!DOCTYPE html>
<html lang="es">
<x-head />
<link rel="stylesheet" href="/assets/resumen.css">

<body>

	<style>
		#mainNav .capturar {
			display: none !important;
		}
	</style>

	<x-header-resumen />

	<div class="general-background">
		<div class="seccion-casa">
			<div class="subtitulo">La casa de tus sueños hecha realidad</div>
			<div class="texto-fondo">1 Recámara</div>
			<div id="principalRender" class="imagen-casa animar-subida"></div>
		</div>
	</div>


	<div class="container mt-4 white-background">

		<h2 class="text-center fw-bold">Resumen</h2>
		<p class="text-center text-muted">#000</p>
		<hr>
		<div id="selecciones"></div>
	</div>
	<div class="container mt-4">
		<div class="row">
			<div class="col-md-12 text-center">

				<div class="title-sub">¡Listo! Tu casa personalizada está configurada</div>

				<p class="text col-md-10 mx-auto">
					Ahora que has creado la casa de tus sueños, podrás verla siempre que quieras desde tu perfil.
					Nosotros prepararemos una cotización a la medida y te contactaremos con la mejor propuesta
					para hacerla realidad.
				</p>
				<div class="mb-3">
					<button class="btn btn-primary me-2" onclick="guardarFlujo()">Guardar</button>
					<a href="/" class="btn btn-outline-primary">Crear otra</a>
				</div>
			</div>
		</div>
		<hr>
		<div class="row resumen-layout">

			<!-- COLUMNA IZQUIERDA -->
			<div class="col-md-5 resumen-info" style="margin-top: 20px">

				<div class="info-row">
					<span class="label">Estilo</span>
					<span id="estilotabla"></span>
				</div>

				<div class="info-row">
					<span class="label">Recámaras</span>
					<span id="recamarastabla"></span>
				</div>

				<div class="info-row">
					<span class="label">Fachada</span>
					<span id="fachadatabla"></span>
				</div>

				<!-- LOTE -->
				<div id="loteResumen" class="info-row d-none">
					<span class="label">Lote</span>
					<span id="lotePrecio"></span>
				</div>

				<!-- CASA -->
				<div class="info-row">
					<span class="label">Casa</span>
					<span id="precioCasa"></span>
				</div>

				<div class="total-row">
					<span>Total:</span>
					<strong id="totalResumenTop">$0</strong>
				</div>

				<div class="apartado-row">
					<span>Aparta hoy con:</span>
					<strong>$5,000.00</strong>
					<button class="btn btn-primary ms-3" data-bs-toggle="modal" data-bs-target="#modalAsesor">
						Apartar ▶
					</button>

				</div>

				<div class="text-resumen-note">
					* Los precios aquí establecidos son en pesos mexicanos e incluyen Impuesto al Valor Agregado (I.V.A) e Impuesto sobre Adquisición de Propiedad (I.S.A.N. cuando aplique). Para mayor información sobre la disponibilidad, versiones, equipamientos y precios, se recomienda consultar con su Distribuidor autorizado EME DOS. Precios de accesorios Tequipment vigentes 1º de enero al 31 de diciembre 2024. El apartado es 100% reembolsable. 
				</div>

			</div>

			<!-- COLUMNA DERECHA -->
			<div class="col-md-7 resumen-planos">
				<div class="container" style="text-align: right;">
					<img src="/img/1.png" alt="" srcset="" class="img-resumen-plano imagen-recamaras" width="550px">
				</div>
			</div>
		</div>

		<br><br>
		<h2 style="text-align: center;">Galería</h2>
		<hr>
		<div class="gallery-wrapper">
			<div id="miniaturasResumen" class="gallery-wrapper"></div>
		</div>
		<br><br>
		<h2 style="text-align:center;">Configuración</h2>
		<table id="tablaResumen" class="table options-table">
			<thead>
				<tr>
					<th>Categoría</th>
					<th>Opción</th>
					<th>Código</th>
					<th>Imagen</th>
					<th>Precio</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
		<h3 class="text-end mt-3">Total: <span id="totalResumen">$0</span></h3>

	</div>

	<br><br>

	<x-modal-asesor />


	<div id="galleryLightbox" class="gallery-lightbox d-none">
		<div class="gallery-overlay"></div>

		<div class="gallery-content">
			<button class="gallery-close">&times;</button>

			<button class="gallery-nav prev">&#10094;</button>
			<button class="gallery-nav next">&#10095;</button>

			<div id="galleryRender"></div>
		</div>
	</div>

	<x-footer />
	<x-scripts />

	<script>
		function guardarFlujo() {

			const isLoggedIn = {{ Auth::check() ? 'true' : 'false' }};

			if (!isLoggedIn) {
				// Redirige a login con parámetro de retorno
				window.location.href = "/inicio-sesion?redirect=guardar";
				return;
			}

			// Si ya está logueado, guardar normalmente
			saveConfiguration();
		}
	</script>

	<script>
		document.addEventListener("DOMContentLoaded", () => {
			@if(request('autoguardar') == 1)
				saveConfiguration();
			@endif
		});
	</script>

	
</body>

</html>