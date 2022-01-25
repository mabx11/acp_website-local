<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" 
         import="vistas.VW_RolUsuario, datos.Dt_RolOpciones, entidades.Publicaciones, datos.Dt_Publicaciones, java.util.*;"%>
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
	if(vru==null){
		//response.sendRedirect("inicioSesion.jsp?msj=401");
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
			response.sendRedirect("401.jsp");
		}	
	}
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
    <link href="assets/fontawesome-free-5.14.0-web/css/fontawesome.min.css" rel="stylesheet">

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

</head>

<body>

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

<main id="main">
    <!-- Empty seccion for space-->
    <div id="empty" class="empty">
    </div>
    <!-- End Empty Section -->

    <!-- ======= Inicio Section ======= -->
    
    <section id="about" class="about">

        <div class="container" data-aos="fade-up">
               <div class="col" align="right">
                    <%
					if (rol != "Visitante") {
					%>
                    <!-- Boton de edicion-->
                    <div id="button-edicion" class="button-edicion">
                        <a href="tblPublicaciones.jsp">
                            <button> Administrar publicaciones</button>
                        </a>
                    </div>
                    <%} %>
                    <!-- Termina boton de edicion-->
                </div>
                <%
                ArrayList<Publicaciones> listPubli = new ArrayList<Publicaciones>();
                Dt_Publicaciones dtpu = new Dt_Publicaciones();
                listPubli = dtpu.listaPublisActivas();
                
                String vpub = "";
                vpub = "Visible";
                
                String Oc = "";
                Oc = "Oculta";
                
                String Br = "";
                Br = "Borrador";

            %>

            <div class="publicaciones">
            <%
                    for (Publicaciones pu : listPubli) {
                %>

                <!-- <div class="content div-publicaciones">
                    <a target="_blank" href="<%=pu.getMultimedia() %>"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/PDF_file_icon.svg/833px-PDF_file_icon.svg.png"></a>
                    <div id="Content-publicacion" class="Content-publicacion">
                        <h2 class="text-center"><%=pu.getDescripcion() %></h2>
                    </div>
                </div> -->
                <%
					if (rol != "Visitante") {
				%>
				<%if((pu.getTipopubli().equals(vpub)) || (pu.getTipopubli().equals(Oc))) {%>
                <a href="EditarPublicacion.jsp?PublicacionesID=<%=pu.getPublicacionesid() %>"><div class="content div-publicaciones" >
                    <img src="https://previews.123rf.com/images/yupiramos/yupiramos1705/yupiramos170534451/79233196-documento-contrato-oficial-vector-icono-ilustraci%C3%B3n-dise%C3%B1o-gr%C3%A1fico.jpg">
                    <div id="Content-publicacion" class="Content-publicacion">
                        <h2 class="text-center"><%=pu.getTitulo() %></h2>
                    </div>
                  
					<div class="col" align="right"> 
					   <br>
                        <br>
					    <i style="color: black;" class="text-right"><%=pu.getTipopubli() %></i>
					</div>
					
                    
                </div></a>
                <%} %>
                <%}
				  else 
				  { 
					
					if(pu.getTipopubli().equals(vpub)){
                	%> 
                	
                	<a target="_blank" href="post.jsp?PostID=<%=pu.getPublicacionesid() %>"><div class="content div-publicaciones" >
                    <img src="https://previews.123rf.com/images/yupiramos/yupiramos1705/yupiramos170534451/79233196-documento-contrato-oficial-vector-icono-ilustraci%C3%B3n-dise%C3%B1o-gr%C3%A1fico.jpg">
                    <div id="Content-publicacion" class="Content-publicacion">
                        <h2 class="text-center"><%=pu.getTitulo() %></h2>
                    </div>
					
                    </div></a>
                    
                	<%}
                	} %>  
                
                <%
	                    }
	                %>

            </div>

            <%
				if (rol != "Visitante") {
			%>
            <!-- Boton anadir publicacion-->
            <div id="button-anadirpub" class="button-anadirpub">
                <a href="NuevaPublicacion.jsp">
                    <button> Añadir nueva publicación</button>
                </a>
            </div>
            <%} %>
        </div>

        <!-- <div class="col-lg-6 d-flex align-items-center" data-aos="zoom-out" data-aos-delay="200">
            <img src="assets/img/about.jpg" class="img-fluid" alt="">
        </div> -->
    </section>
    <!-- End Inicio Section -->

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

<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>

</body>

</html>