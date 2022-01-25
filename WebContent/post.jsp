<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="entidades.*, datos.*, vistas.*, java.util.*;" %>

<%
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

            <div>
            
               	<%
                String pupo = "";
				pupo = request.getParameter("PostID")==null?"0":request.getParameter("PostID");
										
				Publicaciones pu = new Publicaciones();
				Dt_Publicaciones dtpu = new Dt_Publicaciones();
				pu = dtpu.getPubli(Integer.parseInt(pupo));
				
				ArrayList<Publicaciones> listPubli = new ArrayList<Publicaciones>();
				listPubli = dtpu.listaPublisActivas();
				
				String n =  "";
				n = pu.getVideo();
			
               	%>
               	
                <!-- Tabla arboles -->
                <div class="contenido-arboles formulario">
	
					<table class="default table table-bordered center">
					
					  <tr>
					    <th colspan="3" style="background-color:#081C44; text-align:center; color:white"> <%=pu.getTitulo()%> </th>
					  </tr>
					</table>
					<br>
					<% if(pu.getImagen() != null){%>
					 <div id="Img" class="text-center">

	                     <img style="width: 200px; height: 200px; object-fit: cover;" name="imgPubli" id="imgPubli" src="<%=pu.getImagen()%>">
	
					 </div>
					 <%} %>
					 
					 <br>
					 <div class="text-center" name="txtDescripción" id="txtDescripción"><%=pu.getDescripcion()%></div>
					 <br>
					 
					 <%if((pu.getVideo() != null) || (pu.getMultimedia() != null)) {%>
					 <table style="object-fit: cover;" class="default table table-bordered center">
					
					  <tr>
					    <th colspan="3" style="background-color:green; text-align:center; color:white"> Recursos </th>
					  </tr>
					</table>
					 <%} %>
					 
					 <%if((pu.getVideo() != null) && (pu.getVideo() != "null")){ %>
					  
	                 <div class="text-center" name="video" id="video">
	                 <iframe width="560" height="315" src="<%=n%>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	                 </div>
					  
					 <%} %>
					 <br>
					  
					 <%if(pu.getMultimedia() != null){%>
					 <div class="text-center" name="documento" id="documento">
					 <a target="_blank" href="<%=pu.getMultimedia() %>">
					 <img style="width: 100px; height: 100px; object-fit: cover;" src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/PDF_file_icon.svg/833px-PDF_file_icon.svg.png"></a>
	                 </div> 
	                 
	                 <%} %>
	                   
					
					
					
                    
                    
                    
                </div>
            </div>
        </div>

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