<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="vistas.VW_RolUsuario, datos.Dt_RolOpciones, java.util.*;"%>
<%
	response.setHeader( "Pragma", "no-cache" );
	response.setHeader( "Cache-Control", "no-store" );
	response.setDateHeader( "Expires", 0 );
	response.setDateHeader( "Expires", -1 );
	
	VW_RolUsuario vru = new VW_RolUsuario();
	Dt_RolOpciones dtro = new Dt_RolOpciones();
	ArrayList<VW_RolOpciones> listRolOpc = new ArrayList<VW_RolOpciones>();
	
	//OBTENEMOS LA SESION
	vru = (VW_RolUsuario) session.getAttribute("acceso");
	if(vru==null){
		response.sendRedirect("inicioSesion.jsp?msj=401");
	}
	else{
		//OBTENEMOS LA LISTA DE OPCIONES ASIGNADAS AL ROL
		listRolOpc = dtro.listaRolOpc2(vru.getRolid());
		//listOpc = dtro.listaRolOpc(vru.getIdrol());
		
		//RECUPERAMOS LA URL = MI OPCION ACTUAL
		int index = request.getRequestURL().lastIndexOf("/");
		String miPagina = request.getRequestURL().substring(index+1);
		boolean permiso = false; //VARIABLE DE CONTROL
		
		//VALIDAR SI EL ROL CONTIENE LA OPCION ACTUAL DENTRO DE LA MATRIZ DE OPCIONES
		for(VW_RolOpciones vrop : listRolOpc){
			if(vrop.getOpcion().trim().equals(miPagina.trim())){
				permiso = true; //ACCESO CONCEDIDO
				break;
			}
		}
		
		if(!permiso){
			response.sendRedirect("401.jsp");
		}	
	}
%>
<%
    //Variable de control de mensajes
	String varMsj = request.getParameter("msj")==null?"":request.getParameter("msj");
%>

<!DOCTYPE html>
<html>
<head>
		<%@ include file="/utils/head.jsp"%>
</head>
<body>

	<!-- ======= Header ======= -->
	<%@ include file="/menu/header.jsp"%>
	<!-- End Header -->

	<main id="main">
		<!-- Empty seccion for space-->
		<div id="empty" class="empty"></div>
		<!-- End Empty Section -->

		<!-- ======= Inicio Section ======= -->
		<section id="about" class="about">

			<div class="container" data-aos="fade-up">

				<h2 class="form-header" style="color: black;">Registrar Nueva
					Visita Guiada</h2>
				<br>

				<form class="user" method="post" action="./Sl_GestionVisitas">
					<!-- El valor de este input es para el Servlet opcion guardar -->
					<input name="opcion" type="hidden" value="1" />
					<div class="row gy-4">
						<div class="col-sm-12 mb-3 mb-sm-0">
							<input type="text" class="form-control form-control-user"
								name="txtTitulo" id="txtTitulo"
								placeholder="Título de visita" required>
						</div>
						<div class="col-sm-12 mb-3 mb-sm-0">
							<textarea class="form-control form-control-user"
								name="txtDescrip" id="txtDescrip" placeholder="Descripción" required></textarea>
						</div>
						
					</div>
					<br>

					<!-- Botones -->
	                <div class="button-formulario">
	                    <button>Guardar</button>
	                    <a href="javascript:history.go(-1)" class="button">Regresar </a>
	                </div>

				</form>
			</div>

		</section>
		<!-- End Inicio Section -->

	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<%@ include file="/menu/footer.jsp"%>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="assets/vendor/aos/aos.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>
	<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="assets/vendor/purecounter/purecounter.js"></script>
	<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>

	<!-- Bootstrap core JavaScript-->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="assets/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- DATATABLE -->
	<script src="DataTables/DataTables-1.10.21/js/jquery.dataTables.js"></script>

	<!-- DATATABLE buttons -->
	<script src="DataTables/Buttons-1.6.3/js/dataTables.buttons.min.js"></script>

	<!-- js Datatable buttons print -->
	<script src="DataTables/Buttons-1.6.3/js/buttons.html5.min.js"></script>
	<script src="DataTables/Buttons-1.6.3/js/buttons.print.min.js"></script>

	<!-- js Datatable buttons pdf -->
	<script src="DataTables/pdfmake-0.1.36/pdfmake.min.js"></script>
	<script src="DataTables/pdfmake-0.1.36/vfs_fonts.js"></script>

	<!-- js Datatable buttons excel -->
	<script src="DataTables/JSZip-2.5.0/jszip.min.js"></script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


	<!-- jAlert js -->
	<script src="jAlert/dist/jAlert.min.js"></script>
	<script src="jAlert/dist/jAlert-functions.min.js"> //optional!!</script>

	<script type="text/javascript">
	
	    $(document).ready(function ()
	    {
			/////////// VARIABLE DE CONTROL MSJ ///////////
	        var mensaje = "";
	        mensaje = "<%=varMsj%>
		";

							if (mensaje == "existe") {
								errorAlert(
										'Error',
										'El título que esta intentando registrar ya existe en la base de datos!');
							}

						});
	</script>

</body>
</html>