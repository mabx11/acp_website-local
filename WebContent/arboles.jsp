<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="entidades.Arbol, vistas.VW_Arbol, datos.Dt_Arbol, vistas.VW_RolUsuario, datos.Dt_RolOpciones, java.util.*;" %>
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
	
	//LAURA GUISSELLE GRADIZ
	/* String rol = "Visitante";
	
	//OBTENEMOS LA SESION
	vru = (VW_RolUsuario) session.getAttribute("acceso");
	
	
	
	if(vru!=null){
		rol = vru.getRol();
	}
	System.out.println(rol); */
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

        <div class="container" data-aos="fade-up">

            <!-- Despliegue de filtros -->
            <div class="form-group row">
                <div class="col-sm-4">  
                </div>
                <div class="col" align="right">
                
                    <%
					if (rol != "Visitante") {
					%>
					
                    <!-- Boton de edicion-->
                    <div id="button-edicion" class="button-edicion">
                        <a href="tblArbol.jsp">
                            <button> Administrar árboles</button>
                        </a>
                    </div>
                    <!-- Termina boton de edicion-->
                    
					<% 
					}
					%>
					
                </div>
                
                <h1 class="h3 mb-2 text-gray-800">Catálogo de árboles</h1>
                
                <div class="col-sm-8">                     
                	<input type="text" id="search" class="form-control" placeholder="Buscar árboles">
                </div>

            </div>
            <!-- Termina despliegue de filtros-->

            <%
                ArrayList<VW_Arbol> listArbol = new ArrayList<VW_Arbol>();
                Dt_Arbol dta = new Dt_Arbol();
                listArbol = dta.listaArbol();

            %>
            <!-- Cardview arboles -->
            <div class="card-view" id="card-view">
                <%
                    for (VW_Arbol ar : listArbol) {
                %>
                
	                <!-- Para el administrador -->
	                <%
					if (rol != "Visitante") {
					%>
					
	                <a href="EditarArboles.jsp?arbolID=<%=ar.getID() %>">
	                    <div id="card" class="arboles d-flex flex-column" style="height:280px; width:240px">
	
	                        <img src="<%=ar.getImagen()==null?"#":ar.getImagen()%>" onerror="this.onerror=null;this.src='assets/img/arbol-default.png';">
	                       <hr></hr>
	                        <p id="nombre"><%=ar.getNombreComun()%> </p>
	                         
	                    </div>
	                </a>
					<!-- Fin admin -->
					<% 
					 }
					else{
						
					%>
					
					<!-- Para el visitante -->
					<a href="v_vistaArbol.jsp?arbolID=<%=ar.getID() %>">
	                    <div id="card" class="arboles d-flex flex-column" style="height:280px; width:240px">
	
	                        <img src="<%=ar.getImagen()==null?"#":ar.getImagen()%>" onerror="this.onerror=null;this.src='assets/img/arbol-default.png';">
	                       <hr></hr>
	                        <p id="nombre"><%=ar.getNombreComun()%> </p>
	                         
	                    </div>
	                </a>
	                <%
	                    }
	                %>
	                
					<!-- Fin visitante -->
                <%
                    } // Fin ciclo for
                %>
                
	           <%
				if (rol != "Visitante") {
				%>
				
                <!-- Para nuevo arbol -->
                <a href="NuevoArbol.jsp">
                    <div class="arboles new-arbol d-flex flex-column" style="height:280px; width:240px">
                        <center><img src="assets/img/agregar-icon.png">
                            <hr></hr>
                        </center>
                        <p>Agregar nuevo árbol</p>
                    </div>
                </a>
                <!-- Fin nuevo arbol -->
                
	            <% 
				 }
				%>

            </div>
            <!-- Fin cardviews -->

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

<script>
			 
	 $(document).ready(function(){

	   $("#search").on("keyup", function() {
	     var value = $(this).val().toLowerCase();
	     $("#card-view a").filter(function() {
	       $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	     });
	   });
	   
	});
	 
</script>

</body>

</html>