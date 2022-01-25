<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" 
         import="vistas.VW_RolUsuario, datos.Dt_RolOpciones, java.util.*;"%>
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

            <h2 class="form-header" style="color: black;">Editar Footer</h2>
            <br>
            
            <%
                String footer = "";
				footer = request.getParameter("info_footerID")==null?"0":request.getParameter("info_footerID");
										
				Info_Footer foo = new Info_Footer();
				Dt_InfoFooter dtfoo = new Dt_InfoFooter();
				foo = dtfoo.getInfo_Footer(Integer.parseInt(footer));

            %>

            <form action="./Sl_GestionInfo_Footer" method="post" class="user row">
             <input name="info_footerID" type="hidden" value="<%=foo.getInfo_footerID()%>" />
             <input name="opcion" type="hidden" value="1" /> 
                <div class="form-group col-sm-6">      
                    <div class="col-sm-12">
                    Dirección:
                        <input type="text" class="form-control form-control-user" name="txtDireccion" id="txtDireccion"
                               placeholder="Dirección" required>
                    </div>
                    <div class="col-sm-12 mb-3 mb-sm-0">
                    Teléfono:
                        <input type="number" class="form-control form-control-user" name="txtTelefono" id="txtTelefono"
                               placeholder="Telefono" required>
                    </div>
                    <div class="col-sm-12">
                    Extensión:
                        <input type="text" class="form-control form-control-user" name="txtExtension" id="txtExtension"
                               placeholder="Extension" required>
                    </div>
                </div>
                <div class="form-group col-sm-6">
                    <div class="col-sm-12">
                    Correo:
                        <input type="email" class="form-control form-control-user" name="txtCorreo" id="txtCorreo"
                               placeholder="Correo" required>
                    </div>
                    <div class="col-sm-12">
                    Descripción:
                        <textarea class="form-control" name="message" rows="6" placeholder="Descripción" name="txtDescripcion" id="txtDescripcion"
                                  required></textarea>
                    </div>
                </div>
                
                <div class="button-formulario">
                	<br>
                    <button> Guardar</button>
                    <a href="javascript:history.go(-1)" class="button">Regresar </a>
                </div>
            </form>

            <br>

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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>


<script>  
   $(document).ready(function()
	{
	   $("#txtTelefono").val("<%=foo.getTelefono()%>");
	   $("#txtExtension").val("<%=foo.getExtension()%>");
	   $("#txtDireccion").val("<%=foo.getDireccion()%>");
	   $("#txtCorreo").val("<%=foo.getCorreo()%>");
	   $("#txtDescripcion").val("<%=foo.getDescripcion()%>");
	});
</script>

</body>
</html>