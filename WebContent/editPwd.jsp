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

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<body>

	<%
                 String us = "";
				 us = request.getParameter("UsuarioID")==null?"0":request.getParameter("UsuarioID");
														
				 Usuario user = new Usuario();
				 Dt_Usuario dtu = new Dt_Usuario();
				 user = dtu.getUsuario(Integer.parseInt(us));
				 
				 Usuario user2 = new Usuario();
				 
            %>

	<main id="main">

		<!-- Inicio de sesion -->
		<div id="section-login" class="section-login row">

			<!-- Seccion del banner -->
			<%@ include file="/menu/banner.jsp"%>
			<!-- Finaliza seccion del banner -->

			<!-- Formulario de inicio de sesion -->
			<div id="formulario" class="formulario col user">
				<form method="post" action="./Sl_GestionUsuario" class="col">
					<h2>Cambio de contraseña</h2>

					<div class="input-group form-group">
						<input type="hidden" name="opcion" value="4"> <input
							type="hidden" id="usuario" name="usuario"
							value="<%=user.getUsuario()%>"> <input type="password"
							class="form-control form-control-user" id="PwdO" name="PwdO"
							title="Ingrese su contraseña actual"
							placeholder="Ingrese su contraseña actual">
						<div class="input-group-append">
							<button id="show_passwordO" class="btn btn-primary" type="button"
								onclick="mostrarPasswordO()">
								<span class="fa fa-eye-slash icono"></span>
							</button>
						</div>
					</div>

					<div class="input-group form-group">
						<input type="password" class="form-control form-control-user"
							id="Pwd" name="Pwd" title="Ingrese su nueva contraseña"
							placeholder="Ingrese su nueva contraseña">
						<div class="input-group-append">
							<button id="show_password" class="btn btn-primary" type="button"
								onclick="mostrarPassword()">
								<span class="fa fa-eye-slash icon"></span>
							</button>
						</div>
					</div>
					<div class="form-group">
						<input type="password" class="form-control form-control-user"
							id="Pwd2" name="Pwd2"
							placeholder="Ingrese nuevamente la contraseña"
							title="Ingrese nuevamente la contraseña">
					</div>

					<div class="button-iniciar">

						<button>&nbsp;&nbsp;&nbsp;&nbsp;Confirmar&nbsp;&nbsp;&nbsp;&nbsp;</button>

					</div>

					<!-- <br><br><br><h4><strong>Seguimos trabajando, <br> para mejorar su servicio</strong></h4>
              <img style="width: 120px; align-items: center;" src="https://www.movilring.com/wp-content/uploads/2018/07/1.png"> -->
				</form>

			</div>
			<!-- Finaliza formulario de inicio de sesion -->
		</div>
		<!-- Finaliza inicio de sesion -->
	</main>

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

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<!-- jAlert js -->
	<script src="jAlert/dist/jAlert.min.js"></script>
	<script src="jAlert/dist/jAlert-functions.min.js"> //optional!!</script>

	<script type="text/javascript">

	function mostrarPassword() {
		var cambio = document.getElementById("Pwd");
		if (cambio.type == "password") {
			cambio.type = "text";
			$('.icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
		} else {
			cambio.type = "password";
			$('.icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
		}
	}
	
	function mostrarPasswordO() {
		var cambio = document.getElementById("PwdO");
		if (cambio.type == "password") {
			cambio.type = "text";
			$('.icono').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
		} else {
			cambio.type = "password";
			$('.icono').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
		}
	}
	
       
</script>
				
<script type="text/javascript">
    $(document).ready(function()
    {
        
        var mensaje = "";
		mensaje = "<%=varMsj%>";

		if(mensaje == "1")
	    {
	        //successAlert('Éxito', 'Los datos han sido actualizados exitosamente!');
	        $.jAlert({
	            'title': 'Éxito',
	            'content': 'La contraseña se actualizó correctamente!',
	            'theme': 'green',
	            'onClose': function(OnClose) {               
	                window.location = "javascript:history.go(-1)";
	            }
	          });
	    }
		
		if(mensaje == "2")
	    {
	         //errorAlert('Error', 'Revise los datos e intente nuevamente!!!');
	     	$.jAlert({
	             'title': 'Error',
	             'content': 'No se pudo actualizar la contraseña, vuelva a intentarlo',
	             'theme': 'red',
	             'onClose': function(OnClose) {               
	                 window.location = "javascript:history.go(-1)";
	             }
	           });
	    }
		
		if(mensaje == "3")
	    {
	         //errorAlert('Error', 'Revise los datos e intente nuevamente!!!');
	     	$.jAlert({
	             'title': 'Error',
	             'content': 'La contraseña actual no coincide con la proporcionado, intente de nuevo!',
	             'theme': 'red',
	             'onClose': function(OnClose) {               
	                 window.location = "javascript:history.go(-1)";
	             }
	           });
	    }
		
		
		 
		 $("#Pwd2").change(
	 			function() {
	 				var clave = "";
	 				var clave2 = "";
	 				clave = $("#Pwd").val();
	 				clave2 = $("#Pwd2").val();
	 				if (clave != clave2) {
	 					errorAlert('Error','Las contraseñas no coinciden');
	 					$("#Pwd").val();
	 					$("#Pwd2").val("");
	 					}
	 				});
		
    }
    )
    ;
</script>

</body>

</html>