<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"
         import="entidades.Genero, datos.Dt_Genero, entidades.Home, datos.Dt_Home, vistas.*, datos.Dt_RolOpciones, java.util.*;" %>
<%
	response.setHeader( "Pragma", "no-cache" );
	response.setHeader( "Cache-Control", "no-store" );
	response.setDateHeader( "Expires", 0 );
	response.setDateHeader( "Expires", -1 );
	
	VW_RolUsuario vru = new VW_RolUsuario();
	Dt_RolOpciones dtro = new Dt_RolOpciones();
	ArrayList<VW_RolOpciones> listRolOpc = new ArrayList<VW_RolOpciones>();
	
	/* OBTENEMOS LA SESION
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
	} */
	
	String rol = "Visitante";
	
	//OBTENEMOS LA SESION
	vru = (VW_RolUsuario) session.getAttribute("acceso");
	
	if(vru!=null){
		rol = vru.getRol();
	}
	System.out.println(rol);
%>
<!DOCTYPE html>
<%
	//Variable de control de mensajes
	String varMsj = request.getParameter("msj")==null?"":request.getParameter("msj");

	ArrayList<Home> listHome = new ArrayList<Home>();
	Dt_Home dth = new Dt_Home();
	listHome = dth.listaHome();
	
    String fb = "";
    for (Home ho : listHome) {
    	fb = ho.getBanner();
    }	



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

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

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
	
    <!-- =======================================================
    * Template Name: FlexStart - v1.1.1
    * Template URL: https://bootstrapmade.com/flexstart-bootstrap-startup-template/
    * Author: BootstrapMade.com
    * License: https://bootstrapmade.com/license/
    ======================================================== -->
</head>

<body>
<div >
	<!-- ======= Header ======= -->
	<!-- Para administrar que menu se mostrara -->
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
</div>

<main id="main">
    <div id="empty" class="empty">
    </div>
    
    <div id="banner" class="banner">
    </div>
    
    

    <!-- ======= Inicio Section ======= -->
    <section id="about" class="about">

        <div class="container" data-aos="fade-up">

           <%
			if (rol != "Visitante") {
			%>

               <!-- Boton de edicion-->
	           <div id="button-edicion" class="button-edicion">
	               <a href="edicionSeccion.jsp">
	                   <button> Editar secciones</button>
	               </a>
	           </div>
	           <!-- Termina boton de edicion-->

			<% 
			 }
			%>

                <div class="row gx-0">

                    

                    <div class="col-lg-6 d-flex flex-column justify-content-center" data-aos="fade-up"
                         data-aos-delay="200">
                        <div class="content">
                            <div id="Content-vision" class="Content-vision">
                                <img src="assets/img/mision.png"/>
                                <h2>Misión</h2>
                            </div>

                            <%
                                for (Home ho : listHome) {
                            %>
                            
                            <p><%=ho.getMision() %>
                            </p>
                            <%
                                }
                            %>
                        </div>
                    </div>

                    <div class="col-lg-6 d-flex flex-column justify-content-center" data-aos="fade-up"
                         data-aos-delay="200">
                        <div class="content">
                            <div id="Content-vision" class="Content-vision">
                                <img src="assets/img/vision.png"/>
                                <h2>Visión</h2>
                            </div>

                            <%
                                for (Home ho : listHome) {
                            %>
                            <p><%=ho.getVision() %>
                            </p>
                            <%
                                }
                            %>
                        </div>
                    </div>

                </div>

                <!-- <div class="col-lg-6 d-flex align-items-center" data-aos="zoom-out" data-aos-delay="200">
                  <img src="assets/img/about.jpg" class="img-fluid" alt="">
                </div> -->

                <div>
                    <div class="content">

                        <div id="Content-vision" class="Content-vision">
                            <img src="assets/img/historia.png"/>
                            <h2>Historia</h2>
                        </div>

                        <%
                        
                            for (Home ho : listHome) {
                            	
                        %>
                        <p><%=ho.getHistoria() %>
                        </p>
                        <%
                            }
                        %>
                    </div>
                </div>

            </div>
        </div>

    </section>
    <!-- End Inicio Section -->

</main><!-- End #main -->

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

<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>

<!-- Bootstrap core JavaScript-->
<script src="assets/vendor/jquery/jquery.min.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="assets/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- DATATABLE -->
<script src="DataTables/DataTables-1.10.21/js/jquery.dataTables.js"></script>

<!-- jAlert js -->
<script src="jAlert/dist/jAlert.min.js"></script>
<script src="jAlert/dist/jAlert-functions.min.js"> //optional!!</script>

<script>
    $(document).ready(function () {
    	
    	///// VARIABLE DE CONTROL DEL BANNER /////
    	
	    var banner = document.getElementById("banner");
	    banner.style.backgroundImage = "url(<%=fb %>)";
        
        ////////////////////////////////////////////////
        /////////// VARIABLE DE CONTROL MSJ ///////////
        var mensaje = "";
        mensaje = "<%=varMsj%>";

        if(mensaje == "1")
        {
        	//successAlert('Éxito', 'Los datos han sido registrados exitosamente');
            $.jAlert({
                'title': 'Éxito',
                'content': 'Los datos han sido registrados exitosamente',
                'theme': 'green',
                'onClose': function(OnClose) {               
                    window.location = "index.jsp";
                }
              });
        }
        if(mensaje == "2")
        {
        	//errorAlert('Error', 'Revise los datos e intente nuevamente');
        	$.jAlert({
                'title': 'Error',
                'content': 'Revise los datos e intente nuevamente',
                'theme': 'red',
                'onClose': function(OnClose) {               
                    window.location = "index.jsp";
                }
              });
        }
        
        if(mensaje == "3")
        {
        	 //successAlert('Éxito', 'Los datos han sido actualizados exitosamente');
            $.jAlert({
                'title': 'Éxito',
                'content': 'Los datos han sido actualizados exitosamente',
                'theme': 'green',
                'onClose': function(OnClose) {               
                    window.location = "index.jsp";
                }
              });
            
        }
        if(mensaje == "4")
        {
        	//errorAlert('Error', 'Revise los datos e intente nuevamente');
        	$.jAlert({
                'title': 'Error',
                'content': 'Revise los datos e intente nuevamente',
                'theme': 'red',
                'onClose': function(OnClose) {               
                    window.location = "index.jsp";
                }
              });
        }
        if(mensaje == "5")
        {
        	 //successAlert('Éxito', 'Los datos han sido actualizados exitosamente');
            $.jAlert({
                'title': 'Éxito',
                'content': 'Los datos han sido dados de baja exitosamente',
                'theme': 'green',
                'onClose': function(OnClose) {               
                    window.location = "index.jsp";
                }
              });
        }
        if(mensaje == "6")
        {
        	//errorAlert('Error', 'Revise los datos e intente nuevamente');
        	$.jAlert({
                'title': 'Error',
                'content': 'Revise los datos e intente nuevamente',
                'theme': 'red',
                'onClose': function(OnClose) {               
                    window.location = "index.jsp";
                }
              });
        }
        if(mensaje == "7")
        {
        	//errorAlert('Éxito', 'El banner ha sido actualizado exitosamente');
        	$.jAlert({
                'title': 'Éxito',
                'content': 'El banner ha sido actualizado exitosamente',
                'theme': 'red',
                'onClose': function(OnClose) {               
                    window.location = "index.jsp";
                }
              });
        }
        if(mensaje == "8")
        {
        	//errorAlert('Error', 'Revise los datos e intente nuevamente');
        	$.jAlert({
                'title': 'Error',
                'content': 'Aqui tamos',
                'theme': 'red',
                'onClose': function(OnClose) {               
                    window.location = "index.jsp";
                }
              });
        }

    });
</script>

<script type="text/javascript">

</script>

</body>

</html>