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
<%
    //Variable de control de mensajes
	String varMsj = request.getParameter("msj")==null?"":request.getParameter("msj");
%>
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

	<!-- jAlert css  -->
	<link rel="stylesheet" href="jAlert/dist/jAlert.css" />
	
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
    <br>
    <br>
    <!-- End Empty Section -->

    <!-- ======= Inicio Section ======= -->
    <section id="about" class="about">

        <div class="container" data-aos="fade-up">

            <div>
            
               	<%
                String viser = "";
				viser = request.getParameter("ServicioID")==null?"0":request.getParameter("ServicioID");
										
				Servicios ser = new Servicios();
				Dt_Servicios dtser = new Dt_Servicios();
				ser = dtser.getServicio(Integer.parseInt(viser));
				
				ArrayList<Servicios> listServicio = new ArrayList<Servicios>();
				listServicio = dtser.listaServicios();
			
               	%>
               	
               	<%if(ser.getDisponibilidad().equals("No disponible")){%>
                <br>
               	<div class="formulario">
	               	<div style="max-width: 990px; height: 30px; background-color: pink; text-align:center; border: 2px solid red; border-radius: 5px;">
	               		<a>Este servicio no se encuentra disponible actualmente.</a>
	               	</div>
	            </div>
               	<%} %>
               	
               	
                <!-- Tabla arboles -->
                <div class="contenido-arboles formulario">
	
					<table class="default table table-bordered center">
					
					  <tr>
					    <th colspan="3" style="background-color:#081C44; text-align:center; color:white"> <%=ser.getNombre()%> </th>
					  </tr>
					</table>
					<br>
					<% if(ser.getFoto() != null){%>
					 <div id="Img" class="text-center">

	                     <img style="width: 200px; height: 200px; object-fit: cover;" name="imgServicio" id="imgServicio" src="<%=ser.getFoto()%>">
	
					 </div>
					 <br>
					 <%} %>
					 
					 
					 <div class="text-center" name="txtDescripción" id="txtDescripción"><%=ser.getDescripcion()%></div>
					 <br>
					 <!-- Botones -->
                    <div id="button-anadirpub" class="button-anadirpub">
		                 <a>
		                     <button onclick="myFunction()"> Contacto por correo</button>
		                 </a>
		             </div>	
                    
                    <form id="myDIV" method="post" action="./Sl_GestionServicios" style="display: none;" class="rol">
						<div class="row gy-4">
							<div class="col-sm-12">
							<input name="ServicioID" type="hidden" value="<%=ser.getServiciosid() %>" />
							<input name="opcion" type="hidden" value="3" />
								<input style="border: 1px solid black;" class="form-control form-control-user"
									type="text" title="Escriba su nombre completo" placeholder="Nombre completo" id="txtNombre" name="txtNombre">
							</div>
							<div class="col-sm-12">
								<input style="border: 1px solid black;" class="form-control form-control-user"
									type="email" title="Escriba su correo" placeholder="Correo" id="txtCorreo" name="txtCorreo">
							</div>
							<div class="col-sm-12">
								<input style="border: 1px solid black;" class="form-control form-control-user"
									type="text" title="Escriba el asunto" placeholder="Asunto" id="txtAsunto" name="txtAsunto">
							</div>
							<div class="col-sm-12">
								<textarea style="border: 1px solid black;" type="text" class="form-control form-control-user"
									title="Escriba el contenido de la consulta" placeholder="Consulta" id="txtConsulta" name="txtConsulta"></textarea>
							</div>
						</div>
						<br>
		
						<!-- Botones -->
			            <div class="button-formulario text-center">
			                    <button style="background-color: green">Enviar</button>
			            </div>
			            <br>
		
					</form>	
		             
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

<!-- Core plugin JavaScript-->
<script src="assets/vendor/jquery-easing/jquery.easing.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- jAlert js -->
<script src="jAlert/dist/jAlert.min.js"></script>
<script src="jAlert/dist/jAlert-functions.min.js"> //optional!!</script>

<script type="text/javascript">
function myFunction() {
    var x = document.getElementById("myDIV");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}

$(document).ready(function(){
/////////// VARIABLE DE CONTROL MSJ ///////////
//var mensaje = "";
var id = 0;
mensaje = "<%=varMsj%>";
//id = user.getUsuarioID();

if (mensaje == "1") {
	//errorAlert('Error','El nombre de usuario que esta intentando registrar ya existe en la base de datos');
	$.jAlert({
         'title': 'Éxito',
         'content': 'El correo de consulta se envió correctamente!',
         'theme': 'green',
         'onClose': function(OnClose) {               
             window.location = "javascript:history.go(-1).jsp";
         }
       });
}

if (mensaje == "2") {
	//errorAlert('Error','El nombre de usuario que esta intentando registrar ya existe en la base de datos');
	$.jAlert({
         'title': 'Error',
         'content': 'El correo de consulta no se envió, por favor intente nuevamente!',
         'theme': 'red',
         'onClose': function(OnClose) {               
             window.location = "javascript:history.go(-1).jsp";
         }
       });
}

});

</script>

</body>

</html>