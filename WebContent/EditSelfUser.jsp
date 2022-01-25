<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="entidades.*, datos.*, vistas.*,  java.util.*;"%>
<%
	response.setHeader( "Pragma", "no-cache" );
	response.setHeader( "Cache-Control", "no-store" );
	response.setDateHeader( "Expires", 0 );
	response.setDateHeader( "Expires", -1 );
	
	VW_RolUsuario vru = new VW_RolUsuario();
	Dt_RolUsuario dtru = new Dt_RolUsuario();
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
<meta charset="ISO-8859-1">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>PWACP - Portal Web Arboreto Carmelo Palma</title>
<meta content="" name="description">

<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/logo.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
	
<!-- jAlert css  -->
<link rel="stylesheet" href="jAlert/dist/jAlert.css" />

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/aos/aos.css" rel="stylesheet">
<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">

<!-- DATATABLE -->
<link href="DataTables/DataTables-1.10.21/css/jquery.dataTables.min.css"
	rel="stylesheet">
<!-- DATATABLE buttons -->
<link href="DataTables/Buttons-1.6.3/css/buttons.dataTables.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<%
                 String us = "";
				 us = request.getParameter("UsuarioID")==null?"0":request.getParameter("UsuarioID");
														
				 Usuario user = new Usuario();
				 Dt_Usuario dtu = new Dt_Usuario();
				 user = dtu.getUsuario(Integer.parseInt(us));
            %>

<!-- =======================================================
    * Template Name: FlexStart - v1.1.1
    * Template URL: https://bootstrapmade.com/flexstart-bootstrap-startup-template/
    * Author: BootstrapMade.com
    * License: https://bootstrapmade.com/license/
    ======================================================== -->
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

				<h2 class="form-header" style="color: black;">Editar Datos</h2>
				<br>

				

				<form class="user row" method="post" action="./Sl_GestionUsuario">
					<!-- El valor de este input es para el Servlet opcion guardar -->
					<input name="userid" type="hidden"
						value="<%=user.getUsuarioID()%>" /> <input name="opcion"
						type="hidden" value="3" />
					<div class="form-group col-sm-6">
						<div class="col-sm-12 mb-3 mb-sm-0">
							<input type="text" class="form-control form-control-user"
								name="txtUserName" id="txtUserName"
								placeholder="Nombre de Usuario" title="Nombre de Usuario" required>
						</div>
						<br>
						<div class="col-sm-12 mb-3 mb-sm-0">
							<input type="text" class="form-control form-control-user"
								name="txtNombres" id="txtNombres" placeholder="Nombres" title="Nombres" required>
						</div>
						<br>
						<div class="col-sm-12">
							<input type="text" class="form-control form-control-user"
								name="txtApellidos" id="txtApellidos" placeholder="Apellidos"
								title="Apellidos" required>
						</div>
						<br>
						<div class="col-sm-12">
							<input type="Tel" class="form-control form-control-user"
								name="txttel" id="txttel" placeholder="Ingrese 0 si no posee numero de contacto" title="Teléfono" required>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="col-sm-12">
							<input type="email" class="form-control form-control-user"
								name="txtEmail" id="txtEmail" placeholder="Email" title="Correo" required>
						</div>
						<br>
						<div class="col-sm-8">
						<a target="_blank" href="editPwd.jsp?UsuarioID=<%=user.getUsuarioID()%>">
							<input id="show_pwds" class="btn btn-primary" type="button"
									value="Editar contraseña" >
						</a>
						</div>
						<!--  <br>
						<div id="myDIV" style="display: none;">
						 <div class="col-sm-10 mb-3 mb-sm-3 input-group">
							<input type="password" class="form-control form-control-user"
								name="txtPwdO" id="txtPwdO" placeholder="Contraseña actual" title="Contraseña actual" >
							<div class="input-group-append">
								<button id="show_passwordA" class="btn btn-primary" type="button"
									onclick="mostrarPasswordA(); pwdsVoid()">
									<span class="fa fa-eye-slash icona"></span>
								</button>
							</div>
						</div>
						<div class="col-sm-10 mb-3 mb-sm-3 input-group">
							<input type="password" class="form-control form-control-user"
								name="txtPwd" id="txtPwd" placeholder="Nueva Contraseña" title="Nueva contraseña" minlength="8" maxlength="32" required>
							<div class="input-group-append">
								<button id="show_password" class="btn btn-primary" type="button"
									onclick="mostrarPassword()">
									<span class="fa fa-eye-slash iconm"></span>
								</button>
							</div>
						</div>
						<div class="col-sm-12">
							<input type="password" class="form-control form-control-user"
								name="txtPwd2" id="txtPwd2" placeholder="Repetir Nueva Contraseña" title="Repetir Nueva contraseña" minlength="8" maxlength="32" required>
						</div>
						</div>-->
						
					</div>


					<br>

					<!-- Botones -->
					<!-- Botones -->
					<div class="button-formulario">
						<input class="btn-user button button-formulario" type="submit"
							value="Actualizar" /> <a href="javascript:history.go(-1)"
							style="padding: 13px 35px"
							class="btn-user button button-formulario ">Regresar</a>
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
	

	<script> 
	
	//Funcion para mostrar o desaparacer el div de contraseñas
	
   $(document).ready(function()
	{

		$("#txtUserName").val("<%=user.getUsuario()%>");
		$("#txtNombres").val("<%=user.getNombres()%>");
		$("#txtApellidos").val("<%=user.getApellidos()%>");
		$("#txtEmail").val("<%=user.getEmail()%>");
		$("#txttel").val("<%=user.getTelefono()%>");
		
		
        /////////// VARIABLE DE CONTROL MSJ ///////////
		var mensaje = "";
		mensaje = "<%=varMsj%>";

		if (mensaje == "existe") {
			//errorAlert('Error','El nombre de usuario que esta intentando registrar ya existe en la base de datos!');
			$.jAlert({
                'title': 'Error',
                'content': 'El nombre de usuario que esta intentando registrar ya existe en la base de datos!',
                'theme': 'red',
                'onClose': function(OnClose) {               
                    window.location = "EditSelfUser.jsp?UsuarioID=<%=user.getUsuarioID() %>";
                }
              });
		}
		if(mensaje == "1")
        {
            //successAlert('Éxito', 'Los datos han sido actualizados exitosamente!');
            $.jAlert({
                'title': 'Éxito',
                'content': 'Los datos han sido actualizados exitosamente!',
                'theme': 'green',
                'onClose': function(OnClose) {               
                    window.location = "EditSelfUser.jsp?UsuarioID=<%=user.getUsuarioID()%>";
                }
              });
        }
        if(mensaje == "2")
        {
            //errorAlert('Error', 'Revise los datos e intente nuevamente!!!');
        	$.jAlert({
                'title': 'Error',
                'content': 'Revise los datos e intente nuevamente!!!',
                'theme': 'red',
                'onClose': function(OnClose) {               
                    window.location = "EditSelfUser.jsp?UsuarioID=<%=user.getUsuarioID()%>";
                }
              });
        }
	});
    
   
	   
</script>

<!-- <script type="text/javascript">

//Verifica si la contraseña actual es correcta
/*$("#txtPwdO").change(
		function() {
			var clave = "";
			var clave2 = "";
			clave = $("#txtPwdO").val();
			clave2 = $("#txtPwd").val("<%=user.getContrasenia()%>");
			if (clave != clave2) {
				errorAlert('Error','Las contraseñas no coinciden');
				$("#txtPwdO").val();
				
				}
			});*/

$("#txtPwd").change(
		function() {
			var clave = "";
			var clave2 = "";
			clave = $("#txtPwd").val();
			clave2 = $("#txtPwd2").val();
			if (clave != clave2) {
				errorAlert('Error','Las contraseñas no coinciden');
				$("#txtPwd").val(user.getContrasenia());
				$("#txtPwd2").val("");
				}
			});
$("#txtPwd2").change(
		function() {
			var clave = "";
			var clave2 = "";
			clave = $("#txtPwd").val();
			clave2 = $("#txtPwd2").val();
			if (clave != clave2) {
				errorAlert('Error','Las contraseñas no coinciden');
				$("#txtPwd").val(user.getContrasenia());
				$("#txtPwd2").val("");
				}
			});
});


</script> -->



</body>
</html>