<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="entidades.*, datos.*, vistas.*, java.util.*;" %>

<%
	VW_RolUsuario vru = new VW_RolUsuario();
	Dt_RolOpciones dtro = new Dt_RolOpciones();
	ArrayList<VW_RolOpciones> listRolOpc = new ArrayList<VW_RolOpciones>();
	
	String rol = "Visitante";
	
	//OBTENEMOS LA SESION
	vru = (VW_RolUsuario) session.getAttribute("acceso");
	
	if(vru!=null){
		rol = vru.getRol();
	}
	System.out.println(rol);
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
                String us = "";
				us = request.getParameter("arbolID")==null?"0":request.getParameter("arbolID");
										
				Arbol arb = new Arbol();
				Dt_Arbol dta = new Dt_Arbol();
				arb = dta.getArbol(Integer.parseInt(us));
			
               	%>
                        
               	<%
                String rous = "";
				rous = request.getParameter("arbolID")==null?"0":request.getParameter("arbolID");
										
				VW_Arbol vwru = new VW_Arbol();
				Dt_Arbol dtrous = new Dt_Arbol();
				vwru = dtrous.getArbol2(Integer.parseInt(rous));
             	%>
            

                <%
                ArrayList<Genero> listGenero = new ArrayList<Genero>();
                Dt_Genero dtg = new Dt_Genero();
                listGenero = dtg.listaGenerosActivos();

                ArrayList<Familia> listFamilia = new ArrayList<Familia>();
                Dt_Familia dtf = new Dt_Familia();
                listFamilia = dtf.listaFamiliasActivas();

                ArrayList<Floracion> listFloracion = new ArrayList<Floracion>();
                Dt_Floracion dtfl = new Dt_Floracion();
                listFloracion = dtfl.listaFloracionsActivos();
                %>


                <!-- Tabla arboles -->
                <div class="contenido-arboles formulario">
	
					<table class="default table table-bordered center">
					
					  <tr>
					    <th colspan="3" style="background-color:#081C44; text-align:center; color:white"> Características del <%=arb.getNombrecomun()%> </th>
					  </tr>
					
					  <tr>
					  	<td style="text-align:center; vertical-align: middle;" rowspan="7">
	                       	<img style="width: 200px; height: 200px; object-fit: cover;" name="imgArbol" id="imgArbol" src="<%=vwru.getImagen()==null?"#":arb.getImagen()%>" onerror="this.onerror=null;this.src='assets/img/arbol-default.png';">
	                	</td>
	                   	<th> Nombre Común</th>
	                   	<td> <div name="txtNombreCo" id="txtNombreCo"><%=vwru.getNombreComun()%></div></td>
					  </tr>
					
					  <tr>
	                   	<th> Nombre Científico</th>
	                   	<td> <div name="txtNombreCi" id="txtNombreCi"><%=vwru.getNombreCientifico()%></div> </td>
					  </tr>
					  
					  <tr>
	                   	<th> Género</th>
	                   	<td> <div name="cbxGenero" id="cbxGenero"><%= vwru.getGenero()%></div> </td>
	                  </tr>
	                  
	                   <tr>
	                   	<th> Familia</th>
	                   	<td> <div name="cbxFamilia" id="cbxFamilia"><%= vwru.getFamilia()%></div> </td>
	                   </tr>
	                   
	                   <tr>
	                   	<th> Floracion</th>
	                   	<td> <div name="cbxFlora" id="cbxFlora"><%= vwru.getEpocaFloracion()%></div> </td>
	                   </tr>
	                   
	                     <tr>
	                    
	                     <%-- <% 
	                    String nombred = vwru.getNombreDistribucion();
	                    if(nombred==null)
	                    {
	                    	
	                    	nombred = "No definido";
	                    	
	                    }
	                    else{
	                    	nombred = vwru.getNombreDistribucion();
	                    }
	                    %> --%>
	                    
	                    	<%-- <th> Distribución</th>
	                    	<td> <div name="txtNDistribucion" id="txtNDistribucion"><%=nombred%></div> </td>
	                     --%>
	                    </tr>
	                   
	                    <tr>
	                    	<th> Descripción</th>
	                    	<td> <div name="txaDescrip" id="txaDescrip"><%=vwru.getDescripcion()%></div> </td>
	                    </tr>
					
					</table>
					
                    <br><br>
                    
                    <!-- Botones -->
                    <div class="button-anadirpub">
                        <a href="javascript:history.go(-1)" class="button"> Regresar</a>
                    </div>
                    
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