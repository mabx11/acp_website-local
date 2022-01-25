<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="datos.Dt_RolOpciones, vistas.VW_RolUsuario, java.util.*;"%>
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
<meta charset="ISO-8859-1">

<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>PWACP - Portal Web Arboreto Carmelo Palma</title>
<meta content="" name="description">

<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/logo.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="assets/vendor/aos/aos.css" rel="stylesheet">
<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">

<!-- jAlert css  -->
<link rel="stylesheet" href="jAlert/dist/jAlert.css" />

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

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

			<h2 class="form-header" style="color: black;">Registrar Nuevo
				Usuario</h2>
			<br>

			<form class="user" method="post" action="./Sl_GestionUsuario">
				<!-- El valor de este input es para el Servlet opcion guardar -->
				<input name="opcion" type="hidden" value="1" />
				
				<div class="row">
				
					<div class="form-group col-sm-6">
						<div class="col-sm-12">
							Nombre de usuario:
							<input type="text" class="form-control form-control-user"
								name="txtUserName" id="txtUserName"
								placeholder="Nombre de Usuario" required>
						</div>
						<div class="col-sm-12">
							Nombres:
							<input type="text" class="form-control form-control-user"
								name="txtNombres" id="txtNombres" placeholder="Nombres" required>
						</div>
						<div class="col-sm-12">
							Apellidos:
							<input type="text" class="form-control form-control-user"
								name="txtApellidos" id="txtApellidos" placeholder="Apellidos"
								required>
						</div>
					</div>
					
					<div class="form-group col-sm-6">
						<div class="col-sm-12">
							Teléfono:
							<input type="Tel" class="form-control form-control-user"
								name="txttel" id="txttel" placeholder="Ingrese 0 si no posee número de contacto" required>
						</div>
						<div class="col-sm-12">
							Correo electrónico:
							<input type="email" class="form-control form-control-user"
								name="txtEmail" id="txtEmail" placeholder="Correo electrónico" required>
						</div>
						&nbsp;&nbsp;&nbsp;Contraseña:
						<div class="col-sm-10 mb-3 mb-sm-3 input-group">
							<input type="password" class="form-control form-control-user"
								name="txtPwd" id="txtPwd" placeholder="Contraseña" minlength="8" maxlength="32" required>
							<div class="input-group-append">
								<button id="show_password" class="btn btn-primary" type="button"
									onclick="mostrarPassword()">
									<span class="fa fa-eye-slash icon"></span>
								</button>
							</div>
						</div>
						<div class="col-sm-12 mb-3 mb-sm-0">
							<input type="password" class="form-control form-control-user"
								name="txtPwd2" id="txtPwd2" placeholder="Repetir contraseña" minlength="8" maxlength="32"
								required>
						</div>
					</div>
				</div>

				<!-- Botones -->
                <div class="button-formulario" style="padding: 15px">
                    <button> Guardar</button>
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- jAlert js -->
<script src="jAlert/dist/jAlert.min.js"></script>
<script src="jAlert/dist/jAlert-functions.min.js"> //optional!!</script>

<script type="text/javascript">

	function mostrarPassword() {
		var cambio = document.getElementById("txtPwd");
		if (cambio.type == "password") {
			cambio.type = "text";
			$('.icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
		} else {
			cambio.type = "password";
			$('.icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
		}
	}

    $(document).ready(function ()
    {
		/////////// VARIABLE DE CONTROL MSJ ///////////
        var mensaje = "";
        mensaje = "<%=varMsj%>";

		if (mensaje == "existe") {
			//errorAlert('Error','El nombre de usuario que esta intentando registrar ya existe en la base de datos');
			$.jAlert({
                'title': 'Error',
                'content': 'El nombre de usuario que está intentando registrar ya existe en la base de datos',
                'theme': 'red',
                'onClose': function(OnClose) {               
                    window.location = "NuevoUsuario.jsp";
                }
           });
		}

		$("#txtPwd2").change(
			function() {
				var clave = "";
				var clave2 = "";
				clave = $("#txtPwd").val();
				clave2 = $("#txtPwd2").val();
				if (clave != clave2) {
					errorAlert('Error','Las contraseñas no coinciden');
					$("#txtPwd").val("");
					$("#txtPwd2").val("");
					}
			});
	});
</script>

</body>
</html>