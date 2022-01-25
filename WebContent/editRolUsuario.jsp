<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="entidades.*, datos.*, vistas.VW_RolUsuario, datos.Dt_RolOpciones, java.util.*;"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
    
    <!-- jAlert css  -->
	<link rel="stylesheet" href="jAlert/dist/jAlert.css" />

</head>

<body id="page-top">

<!-- ======= Header ======= -->
<%@ include file="/menu/header.jsp"%>
<!-- End Header -->

<main id="main">
	<!-- Empty seccion for space-->
	<div id="empty" class="empty"></div>
	<!-- End Empty Section -->

	<!-- ======= Inicio Section ======= -->
	<section id="about" class="about">

		<div class="container" data-aos="fade-up">

			<h2 class="form-header" style="color: black;">Editar Rol a Usuario</h2>
           	<br>

					<%
	                    String us = "";
						us = request.getParameter("rol_usuarioID")==null?"0":request.getParameter("rol_usuarioID");
												
						RolUsuario ru = new RolUsuario();
						Dt_RolUsuario dtru = new Dt_RolUsuario();
						ru = dtru.getRolUsuario(Integer.parseInt(us));
	                %>
	
					<%
	                    String rous = "";
						rous = request.getParameter("rol_usuarioID")==null?"0":request.getParameter("rol_usuarioID");
												
						VW_RolUsuario vwru = new VW_RolUsuario();
						Dt_RolUsuario dtrous = new Dt_RolUsuario();
						vwru = dtrous.getRolUsuario2(Integer.parseInt(rous));
	                 %>

					<form class="user" method="post" action="./Sl_GestionRolUser">
					<!-- El valor de este input es para el Servlet opcion guardar -->
					
						<input name="idUsuario" type="hidden" value="<%=ru.getRol_usuarioID()%>" /> 
						<input name="opcion" type="hidden" value="2" /> 
						<input name="ID" type="hidden" value="<%=vwru.getID()%>" /> 
						<input name="opcion" type="hidden" value="2" />
						
						<div class="row gy-4">
							<div class="col-md-12">
								<%
                                     ArrayList<Usuario> listUser = new ArrayList<Usuario>();
                                     Dt_Usuario dtu = new Dt_Usuario();
                                     listUser = dtu.listaUserActivos();
                            	%>
                            	<%
                                    for (Usuario u : listUser) {
                                %>
								<input type="hidden" name="cbxUser" id="cbxUser" value="<%=u.getUsuarioID()%>"/>
									
								<%
                                    }
                                 %>

								<input type="text" readonly class="form-control" name="txtUser" id="txtUser"/>
									
							</div>	
								
							<br></br>
							
							<div class="col-md-12">
								<%
                                    ArrayList<Rol> listRol = new ArrayList<Rol>();
                                    Dt_Rol dtr = new Dt_Rol();
                                    listRol = dtr.listaRolActivos();
                                %>
                                   
								<select class="form-control" name="cbxRol" id="cbxRol"
									required>
									
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
						</div>
						
						<!-- Botones -->
			            <div class="button-formulario">
			                <input class="btn-user button button-formulario" type="submit"
			                                       value="Guardar"/>
			                <a href="javascript:history.go(-1)" style="padding: 13px 35px" class="btn-user button button-formulario ">Regresar</a>
			            </div>
					</form>
		</div>
	</section>
	<!-- End Inicio Section -->

</main>
<!-- End #main -->

<!-- ======= Footer ======= -->
<%@ include file="/menu/footer.jsp"%>
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
	$("#cbxUser").val("<%=ru.getUsuarioID()%>");
	$("#txtUser").val("<%=vwru.getUsuario()%>");
	$("#cbxRol").val("<%= ru.getRolId()%>");
	
	var mensaje = "";
    mensaje = "<%=varMsj%>";

	if (mensaje == "existe") {
		//errorAlert('Error','Este usuario ya tiene este rol asignado');
		$.jAlert({
            'title': 'Error',
            'content': 'Este usuario ya tiene ese rol asignado, intente nuevamente!',
            'theme': 'red',
            'onClose': function(OnClose) {               
                window.location = "javascript:history.go(-1)";
            }
       });
	}	
});
</script>

</body>
</html>