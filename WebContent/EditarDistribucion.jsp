<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="entidades.Distribucion, datos.Dt_Distribucion, entidades.Pais, datos.Dt_Pais, vistas.VW_PaisRegion, vistas.VW_RolUsuario, datos.Dt_RolOpciones, java.util.*;" %>
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
<%
    //Variable de control de mensajes
	String varMsj = request.getParameter("msj")==null?"":request.getParameter("msj");
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

	<!-- jAlert css  -->
	<link rel="stylesheet" href="jAlert/dist/jAlert.css" />

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
        
	         <%
		        String dis = "";
				dis = request.getParameter("DistribucionID")==null?"0":request.getParameter("DistribucionID");
										
				Distribucion di = new Distribucion();
				Dt_Distribucion dtdi = new Dt_Distribucion();
				di = dtdi.getDistribucion(Integer.parseInt(dis));
				
			 %>

            <h2 class="form-header" style="color: black;">Editar Distribuci�n</h2>
            <br>
            <form action="./Sl_GestionDistribucion" method="post" class="distribucion">
            
            	<!-- El valor de este input es para el Servlet opcion guardar -->
				<input name="distribucionid" type="hidden"
					value="<%=di.getDistribucionID()%>" /> 
				<input name="opcion" type="hidden" value="2" />
				
                <div class="row gy-4">

                    <%
                        ArrayList<VW_PaisRegion> listPais = new ArrayList<VW_PaisRegion>();
                        Dt_Pais dtd = new Dt_Pais();
                        listPais = dtd.listaPaisReg();

                    %>

                    <div class="col-md-12">
                        <input name="txtNombre" id="txtNombre" type="text" class="form-control" placeholder="Nombre" required>
                        <br>
                    </div>
                    <div class="row col-md-12">
                        <div class="col-sm-11">
                            <select class="form-select" name="cbxPais" id="cbxPais" required>
                                <option value="">Pa�s...</option>
                                <%
                                    for (VW_PaisRegion pa : listPais) {
                                %>
                                <option value="<%= pa.getID() %>"><%= pa.getPais() %>
                                </option>
                                <%
                                    }
                                %>

                            </select>
                        </div>
                        <div class="col-sm-1">
                            <a title="Agregar nuevo pa�s" href="NuevoPais.jsp">
                                <i class="add fa-2x fas fa-plus-circle"></i></a>
                        </div>
                    </div>
                    <br>

                    <div class="col-md-12">
                        <textarea class="form-control" name="txtDesc" id="txtDesc" rows="6" placeholder="Descripci�n"
                                  required></textarea>
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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<!-- Bootstrap core JavaScript-->
<script src="assets/vendor/jquery/jquery.min.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="assets/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- jAlert js -->
<script src="jAlert/dist/jAlert.min.js"></script>
<script src="jAlert/dist/jAlert-functions.min.js"> //optional!!</script>

<script>  
   $(document).ready(function()
	{
	   $("#txtNombre").val("<%=di.getNombre()%>");
	   $("#cbxPais").val("<%= di.getPaisID()%>");
	   $("#txtDesc").val("<%=di.getDescripcion()%>");
	   
	   /////////// VARIABLE DE CONTROL MSJ ///////////
		var id = 0;
       mensaje = "<%=varMsj%>";

		if (mensaje == "existe") {
			//errorAlert('Error','Los datos de la distribuci�n que est� intentando registrar ya existen en la base de datos');
			$.jAlert({
               'title': 'Error',
               'content': 'Los datos de la distribuci�n que est� intentando registrar ya existen en la base de datos',
               'theme': 'red',
               'onClose': function(OnClose) {               
                   window.location = "tblDistribucion.jsp";
               }
             });
		}
	});
</script>

</body>
</html>