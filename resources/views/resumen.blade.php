<!DOCTYPE html>
<html lang="es">
<x-head />
<link rel="stylesheet" href="/assets/resumen.css">

<body>

				<x-header />

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
																				@auth
																								<button class="btn btn-primary me-2" onclick="saveConfiguration()">Guardar</button>
																								<a href="/" class="btn btn-outline-primary">Crear otra</a>
																				@else
																								<a href="/registro?redirect=/resumen" class="btn btn-primary me-2">Iniciar sesión para guardar</a>
																				@endauth

																</div>

												</div>


								</div>
								<br>
								<hr>
								<br>
								<div class="row">
												<div class="col-md-12">
																<div class="custom-layout">
																				<div class="info-column col-12 info-box">

																								<div class="info-row"><span class="label">Estilo:</span> <span id="estilotabla"></span>
																								</div>
																								<div class="info-row"><span class="label">Recámaras:</span> <span id="recamarastabla">2</span>
																								</div>
																								<div class="info-row"><span class="label">Fachada:</span> <span id="fachadatabla">A</span>
																								</div>

																				</div>



																</div>

												</div>

												<div class="container" style="text-align: center; margin-top: 20px;">
																<br><br>
																<img src="/img/1.png" alt="" srcset="" width="500px">
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
																</tr>
												</thead>
												<tbody></tbody>
								</table>
				</div>

				<br><br>
				<x-footer />
				<x-scripts />


</body>

</html>
