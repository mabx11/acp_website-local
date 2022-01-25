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
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
        <div class="container">
			<%
				if (rol != "Visitante") {
			%>
            <!-- Boton de edicion-->
            <div id="button-edicion" class="button-edicion">
                <a href="tblProductos.jsp">
                    <button> Administrar productos</button>
                </a>
            </div>
            <!-- Termina boton de edicion-->
            <%
				}
            %>
            
            <%
            
	            ArrayList<CatProductos> listProductos = new ArrayList<CatProductos>();
	            Dt_Productos dtp = new Dt_Productos();
	            listProductos = dtp.listaProductos();
                
            %>

            <div class="row servicios">
                <%
                    for (CatProductos prod : listProductos) {
                %>
                <% 
                	if (rol != "Visitante") { 
                %>
                <div class="col-lg-6">
					<a href="EditarProducto.jsp?ProductoID=<%=prod.getCatalogodeproductosid() %>">
					<div class="d-flex flex-column justify-content-center">
                        <div id="Content-vision" class="Content-vision content">
                            <div>
                                <img style="width: 100px; height: 100px; border-radius: 50%;" src="<%=prod.getFoto()==null?"#":prod.getFoto()%>" onerror="this.onerror=null;this.src='https://cdn-icons-png.flaticon.com/512/1170/1170577.png';">
                            </div>
                            <div>
                                <h2 class="text-center"><%=prod.getNombre() %></h2>
                            </div>
                            
                            <div class="col" align="right"> 
							    <br>
		                        <br>
		                        <br>
							    <i style="color: black;" class="text-right"><%=prod.getDisponibilidad() %></i>
							</div>
                        </div>
                    </div>
                    </a>
                  </div>
                  <%
                	}else{
                  %>
                		<div class="col-lg-6">
    					<a href="vistaProducto.jsp?ProductoID=<%=prod.getCatalogodeproductosid() %>">
    					<div class="d-flex flex-column justify-content-center">
                            <div id="Content-vision" class="Content-vision content">
                                <div>
                                	<img style="width: 100px; height: 100px; border-radius: 50%;" src="<%=prod.getFoto()==null?"#":prod.getFoto()%>" onerror="this.onerror=null;this.src='https://cdn-icons-png.flaticon.com/512/1170/1170577.png';">
                                </div>
                                <div>
                                    <h2 class="text-center"><%=prod.getNombre() %></h2>
                                </div>
                                
                                
                            </div>
                        </div>
                        </a>
                      </div>
                      <%} %>
                   <%
                    }
                   %>
                </div>
                
                <%
				if (rol != "Visitante") {
				%>
	            <!-- Boton anadir publicacion-->
	            <div id="button-anadirpub" class="button-anadirpub">
	                <a href="NuevoProducto.jsp">
	                    <button> Añadir nuevo producto</button>
	                </a>
	            </div>
	            <%} %>
                
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

</body>

</html>