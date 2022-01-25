<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="entidades.*, datos.*, vistas.*, java.util.*;" %>
<%
	response.setHeader( "Pragma", "no-cache" );
	response.setHeader( "Cache-Control", "no-store" );
	response.setDateHeader( "Expires", 0 );
	response.setDateHeader( "Expires", -1 );
	
	VW_RolUsuario vru = new VW_RolUsuario();
	Dt_RolOpciones dtrop = new Dt_RolOpciones();
	ArrayList<VW_RolOpciones> listRolOpc = new ArrayList<VW_RolOpciones>();
	
	//OBTENEMOS LA SESION
	vru = (VW_RolUsuario) session.getAttribute("acceso");
	if(vru==null){
		response.sendRedirect("inicioSesion.jsp?msj=401");
	}
	else{
		//OBTENEMOS LA LISTA DE OPCIONES ASIGNADAS AL ROL
		listRolOpc = dtrop.listaRolOpc2(vru.getRolid());
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
<%
    //Variable de control de mensajes
	String varMsj = request.getParameter("msj")==null?"":request.getParameter("msj");
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
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
    
    <!-- jAlert css  -->
    <link rel="stylesheet" href="jAlert/dist/jAlert.css" />

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet">

</head>

<body id="page-top">

<!-- ======= Header ======= -->
<%@ include file="/menu/header.jsp" %>
<!-- End Header -->

<main id="main">
    <!-- Empty seccion for space-->
    <div id="empty" class="empty"></div>
    <!-- End Empty Section -->

    <!-- ======= Inicio Section ======= -->
    <section id="about" class="about">

        <div class="container" data-aos="fade-up">

			<h2 class="form-header" style="color: black;">Asignar Nueva Opcion a Rol</h2>
            <br><br>

                <form class="user" method="post" action="./Sl_GestionRolOpc">
                <!-- El valor de este input es para el Servlet opcion guardar -->
                    <input name="opcion" type="hidden" value="1"/>
                    <div class="row gy-4">
                        <div class="row col-md-12">
                            <%
                                ArrayList<Rol> listRol = new ArrayList<Rol>();
                                Dt_Rol dtr = new Dt_Rol();
                                listRol = dtr.listaRolActivos();
                            %>
                            <div class="col-sm-11">
	                            <select class="form-control" name="cbxRol" id="cbxRol"
	                                    required>
	                                <option value="">Rol...</option>
	                                <%
	                                    for (Rol r : listRol) {
	                                %>
	                                <option value="<%=r.getRolID()%>"><%=r.getRol()%>
	                                </option>
	                                <%
	                                    }
	                                %>
	
	                            </select>
                            </div>
                            <div class="col-sm-1">
		                       <a title="Agregar nuevo rol" href="NuevoRol.jsp">
		                           <i class="add fa-2x fas fa-plus-circle"></i></a>
		                   </div>
                        </div>
                        <br><br><br>
                        <div class="row col-md-12">
                            <%
                                ArrayList<Opciones> listOpc = new ArrayList<Opciones>();
                                Dt_Opciones dtro = new Dt_Opciones();
                                listOpc = dtro.listaOpcActivos();
                            %>
                            <div class="col-sm-12">
	                            <select class="form-control" name="cbxOpc" id="cbxUser"
	                                    required>
	                                <option value="">Opcion...</option>
	                                <%
	                                    for (Opciones u : listOpc) {
	                                %>
	                                <option value="<%=u.getOpcionesID()%>"><%=u.getOpcion()%>
	                                </option>
	                                <%
	                                    }
	                                %>
	
	                            </select>
                            </div>
                        </div>
                    </div>
					<br>
                    <!-- Botones -->
		            <div class="button-formulario">
		                    <button> Guardar</button>
		                    <a href="javascript:history.go(-1)" class="button">Regresar </a>
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<!-- jAlert js -->
<script src="jAlert/dist/jAlert.min.js"></script>
<script src="jAlert/dist/jAlert-functions.min.js"> //optional!!</script>

<script type="text/javascript">
	
    $(document).ready(function ()
    {
		/////////// VARIABLE DE CONTROL MSJ ///////////
        var mensaje = "";
        mensaje = "<%=varMsj%>";

		if (mensaje == "existe") {
			errorAlert('Error','Este rol ya tiene esta opción asignada');
		}
	});
</script>

</body>
</html>