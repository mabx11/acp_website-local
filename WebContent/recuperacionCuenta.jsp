<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>

<%
	String mensaje = request.getParameter("msj");
	mensaje=mensaje==null?"":mensaje;

	//Variable de control de mensajes
	String varMsj = request.getParameter("msj")==null?"":request.getParameter("msj");

%>

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
                <div class="form-group">
                    <label for="usuario"> Usuario:</label>
                    <input type="hidden" name="opcion" value="1">
                    <input placeholder="Ingrese su usuario" type="text" class="form-control w-100"
                           id="usuario" name="usuario">
                </div>
                <div class="form-group">
                    <label for="email"> Correo:</label>
                    <input placeholder="Ingrese su correo electrónico" type="email" class="form-control w-100"
                           id="email" name="email">
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

var mensaje = "";
mensaje = "<%=varMsj%>";

if(mensaje == "1"){
	   $.jAlert({
        'title': 'Éxito',
        'content': 'Se envió el correo para recuperar contraseña, por favor revise su email y continue el proceso de recuperación de contraseña',
        'theme': 'green',
        'onClose': function(OnClose) {               
            window.location = "recuperacionCuenta.jsp";
        }
      });
	///errorAlert('Error', 'Los datos de Usuario son incorrectos, vuelva a intentarlo');
}

if(mensaje == "2"){
	   $.jAlert({
        'title': 'Error',
        'content': 'Los datos de usuario y/o correo son incorrectos, vuelva a intentarlo',
        'theme': 'red',
        'onClose': function(OnClose) {               
            window.location = "recuperacionCuenta.jsp";
        }
      });
	///errorAlert('Error', 'Los datos de Usuario son incorrectos, vuelva a intentarlo');
}

if(mensaje == "3"){
	   $.jAlert({
     'title': 'Error',
     'content': 'El proceso de recuperación de contraseña ha fallado',
     'theme': 'red',
     'onClose': function(OnClose) {               
         window.location = "recuperacionCuenta.jsp";
     }
   });
	///errorAlert('Error', 'Los datos de Usuario son incorrectos, vuelva a intentarlo');
}

if(mensaje == "4"){
	   $.jAlert({
     'title': 'Error',
     'content': 'Verifique los datos y vuelva a intentarlo!',
     'theme': 'red',
     'onClose': function(OnClose) {               
         window.location = "recuperacionCuenta.jsp";
     }
   });
	///errorAlert('Error', 'Los datos de Usuario son incorrectos, vuelva a intentarlo');
}

</script>

</body>

</html>