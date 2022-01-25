<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>PWACP - Portal Web Arboreto Carmelo Palma</title>

    <meta content="" name="description">
    <meta content="" name="keywords">
    
    <%
	String userName = "";
	userName = request.getParameter("us");
	userName = userName==null?"":userName;
	String userEmail = "";
	userEmail = request.getParameter("em");
	userEmail = userEmail==null?"":userEmail;
%>

    <!-- Favicons -->
<link href="assets/img/logo.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
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

<main id="main">

    <!-- Inicio de sesion -->
    <div id="section-login" class="section-login row">

        <!-- Seccion del banner -->
        <%@ include file="/menu/banner.jsp" %>
        <!-- Finaliza seccion del banner -->

        <!-- Formulario de inicio de sesion -->
        <div id="formulario" class="formulario col user">
            <form method="post" action="./Sl_RecuperarPwd" class="col">
                <h2>Recuperación de contraseña</h2>
                <div class="input-group form-group">
                    <input type="hidden" name="opcion" value="2">
                    <input type="hidden" name="usuario" value="<%=userName%>">
                    <input type="hidden" name="email" value="<%=userEmail%>">
                    <input type="password" class="form-control form-control-user"
                     id="newPwd1" name="newPwd1" 
                     placeholder="Ingrese su contraseña">
                     <div class="input-group-append">
						<button id="show_password" class="btn btn-primary" type="button"
							onclick="mostrarPassword()">
							<span class="fa fa-eye-slash icon"></span>
						</button>
					</div>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control form-control-user"
                     id="newPwd2" name="newPwd2" aria-describedby="emailHelp"
                     placeholder="Ingrese nuevamente su contraseña">
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

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
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
<script src="jAlert/dist/jAlert-functions.min.js"> //optional!! </script>

<script type="text/javascript">
	function mostrarPassword() {
		var cambio = document.getElementById("newPwd1");
		if (cambio.type == "password") {
			cambio.type = "text";
			$('.icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
		} else {
			cambio.type = "password";
			$('.icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
		}
	}
	
	$(document).ready(function()
	{
		$("#newPwd2").change(
	 			function() {
	 				var clave = "";
	 				var clave2 = "";
	 				clave = $("#newPwd1").val();
	 				clave2 = $("#newPwd2").val();
	 				if (clave != clave2) {
	 					errorAlert('Error','Las contraseñas no coinciden');
	 					$("#newPwd1").val();
	 					$("#newPwd2").val("");
	 					}
	 				});
	});
       
</script>

</body>

</html>