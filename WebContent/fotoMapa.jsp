<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="entidades.*, datos.*, vistas.*, java.util.*;" %>
<%
	response.setHeader( "Pragma", "no-cache" );
	response.setHeader( "Cache-Control", "no-store" );
	response.setDateHeader( "Expires", 0 );
	response.setDateHeader( "Expires", -1 );
	
	VW_RolUsuario vru = new VW_RolUsuario();
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
<%@ include file="/menu/header.jsp" %>
<!-- End Header -->

<main id="main">
    <!-- Empty seccion for space-->
    <div id="empty" class="empty">
    </div>
    <!-- End Empty Section -->

    <!-- ======= Inicio Section ======= -->
    <section id="about" class="about">

        <div class="container" data-aos="fade-up">

            <h2 class="form-header" style="color: black;">Registrar Imagen del Mapa de ?rboles</h2>
            <br>
            <%
					int idmapa = 0;
					Mapa mp = new Mapa();
					Dt_Mapa dtmp = new Dt_Mapa();
					idmapa = Integer.parseInt(request.getParameter("idMapa"));
					mp = dtmp.getMapa(idmapa);
				%>
				
            <form  method="post" class="user" name="frm-foto" enctype="multipart/form-data" action="./Sl_FotoMapa">
                <div class="row gy-4">
                    <div class="col-md-12">
                    <div class="cuadro-fotoNima" align="center">
						<img id="preview" src="<%=mp.getFotomapa()==null?"#":mp.getFotomapa()%>" name="preview"  alt="Foto Mapa"
									style="width: 866px; height: 645px; border-bottom-color: white; margin: 2px;" />
                    </div>

                    <div class="col-md-12">
                       <input type="file" id="mapa" name="mapa" onchange="Test.UpdatePreview(this)"  >&nbsp; 
								
								<input type="hidden" name="idmapa" value="<%=idmapa%>" >
                    </div>
                    <br>
                    <!-- <div class="col-sm-12 mb-3 mb-sm-0">
							<input type="text" class="form-control form-control-user"
								name="txtNombre" id="txtNombre" title="Versi?n del mapa"
								placeholder="Versi?n del mapa" required>
				    </div>-->
                </div>
                <br>

                <!-- Botones -->
                <div class="button-formulario">
                    <input  class="button" type="submit" value="Guardar" />
                    <a href="index.jsp">
                    <button style="background-color:#0e203f; color:white"> Regresar</button>
                </a>
                    
                </div>
            </form>

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

<script src="assets/vendor/jquery/jquery.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="assets/vendor/jquery-easing/jquery.easing.min.js"></script>

   <!-- Custom scripts for all pages
    <script src="js/sb-admin-2.min.js"></script>-->
    
    
    <script>
	    $(document).ready(function() 
		{
	    	//$("#txtNombre").val("<%=mp.getNombre()%>");
	 
Test = {
	    	        UpdatePreview: function(obj)
	    	        {
	    	          // if IE < 10 doesn't support FileReader
	    	          if(!window.FileReader)
	    	          {
	    	             
	    	          } 
	    	          else 
	    	          {
	    	             var reader = new FileReader();
	    	             var target = null;
	    	             
	    	             reader.onload = function(e) 
	    	             {
	    	              target =  e.target || e.srcElement;
	    	
 $("#preview").prop("src", target.result);
	    	             };
	    	              reader.readAsDataURL(obj.files[0]);
	    	          }
	    	        }
	    	    };
		});
	</script>



</body>
</html>