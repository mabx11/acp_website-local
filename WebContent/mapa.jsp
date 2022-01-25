<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="entidades.*, vistas.*, datos.*, java.util.*;" %>
<%
	response.setHeader( "Pragma", "no-cache" );
	response.setHeader( "Cache-Control", "no-store" );
	response.setDateHeader( "Expires", 0 );
	response.setDateHeader( "Expires", -1 );
	
	VW_RolUsuario vru = new VW_RolUsuario();
	Dt_RolOpciones dtro = new Dt_RolOpciones();
	ArrayList<VW_RolOpciones> listRolOpc = new ArrayList<VW_RolOpciones>();
	
	String rol = "Visitante";
	boolean permiso = false; //VARIABLE DE CONTROL
	
	//OBTENEMOS LA SESION
	vru = (VW_RolUsuario) session.getAttribute("acceso");
	System.out.println("si.");
	if(vru==null){
		System.out.println("va");
		//response.sendRedirect("inicioSesion.jsp?msj=401");
		System.out.println("aja");
	}
	else{
		rol = vru.getRol();
		//OBTENEMOS LA LISTA DE OPCIONES ASIGNADAS AL ROL
		listRolOpc = dtro.listaRolOpc2(vru.getRolid());
		//listOpc = dtro.listaRolOpc(vru.getIdrol());
		
		//RECUPERAMOS LA URL = MI OPCION ACTUAL
		int index = request.getRequestURL().lastIndexOf("/");
		String miPagina = request.getRequestURL().substring(index+1);
		//boolean permiso = false; //VARIABLE DE CONTROL
		
		//VALIDAR SI EL ROL CONTIENE LA OPCION ACTUAL DENTRO DE LA MATRIZ DE OPCIONES
		for(VW_RolOpciones vrop : listRolOpc){
			if(vrop.getOpcion().trim().equals(miPagina.trim())){
				permiso = true; //ACCESO CONCEDIDO
				break;
			}
		}
		
		if(!permiso){
			System.out.println("Entrï¿½");
			response.sendRedirect("401.jsp");
		}	
	}
	System.out.println("XD");
%>

<!DOCTYPE html>
<%
	//Variable de control de mensajes
	String varMsj = request.getParameter("msj")==null?"":request.getParameter("msj");

    
	ArrayList<Mapa> listMapa = new ArrayList<Mapa>();
	Dt_Mapa dtmp = new Dt_Mapa();
	listMapa = dtmp.listaMapa();
	
	
	
   

%>
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

    <!-- Custom fonts for this template -->
    <link href="assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

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
    
    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet">
    
    <!-- jAlert css  -->
	<link rel="stylesheet" href="jAlert/dist/jAlert.css" />

</head>

<body>

<!-- ======= Header ======= -->
<%
		if (rol == "Visitante") {
	%>
		<%@include file="/menu/v_header.jsp"%>
	
	<% 
	 }
	else{
	%>
		<%@include file="/menu/header.jsp"%>
	<%
		}
	%>
<!-- End Header -->

<main id="main">
    <!-- Empty seccion for space-->
    <div id="empty" class="empty">
    </div>
    <!-- End Empty Section -->

    <!-- ======= Inicio Section ======= -->
    <section id="about" class="about">

        <div class="container" data-aos="fade-up">


            <%for(Mapa mp : listMapa){ %>
			<div id="mapa" class="text-center" >
				<img style="width: 866px; height: 645px" src="<%=mp.getFotomapa()%>">
			</div>
			
			<br>
			<br>
			
			<%
				if (rol != "Visitante") {
			%>
			<div id="button-anadirpub" class="button-anadirpub">
                <a href="fotoMapa.jsp?idMapa=<%=mp.getMapaid()%>">
                    <button>Actualizar Mapa</button>
                </a>
            </div>
            <%} %>
            <%} %>
			
		</div>
		
		
		
        
    </section><!-- End Inicio Section -->

</main>
<!-- End #main -->

<!-- ======= Footer ======= -->
<%@ include file="/menu/footer.jsp" %>
<!-- End Footer -->

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

<!-- Bootstrap core JavaScript-->
<script src="assets/vendor/jquery/jquery.min.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="assets/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>

<!-- jAlert js -->
<script src="jAlert/dist/jAlert.min.js"></script>
<script src="jAlert/dist/jAlert-functions.min.js"> //optional!!</script>

<script>
	 $(document).ready(function () {
		var mensaje = "";
		mensaje = "<%=varMsj%>";
		
		if(mensaje == "1")
        {
            //successAlert('Éxito', 'Los datos han sido registrados exitosamente');
            $.jAlert({
                'title': 'Éxito',
                'content': 'La foto de Mapa se guardó exitosamente!',
                'theme': 'green',
                'onClose': function(OnClose) {               
                    window.location = "mapa.jsp";
                }
              });
        }
		if(mensaje == "2")
        {
            //successAlert('Éxito', 'Los datos han sido registrados exitosamente');
            $.jAlert({
                'title': 'Advertencia',
                'content': 'La foto de Mapa no se guardó en la base de datos!',
                'theme': 'yellow',
                'onClose': function(OnClose) {               
                    window.location = "mapa.jsp";
                }
              });
        }
		if(mensaje == "3")
        {
            //successAlert('Éxito', 'Los datos han sido registrados exitosamente');
            $.jAlert({
                'title': 'Error',
                'content': 'No seleccionó un archivo de imagen para guardar o algo salió mal, vuelva a intentarlo!',
                'theme': 'red',
                'onClose': function(OnClose) {               
                    window.location = "mapa.jsp";
                }
              });
        }
	 });
	 
</script>

</body>

</html>