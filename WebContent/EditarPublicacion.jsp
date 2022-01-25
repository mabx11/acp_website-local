<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import = "entidades.*, datos.*, vistas.*, java.util.*;" %>
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
<%//Variable de control de mensajes
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

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet">
    
    <!-- jAlert css  -->
	<link rel="stylesheet" href="jAlert/dist/jAlert.css" />

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

            <h2 class="form-header" style="color: black;">Editar Publicaci�n</h2>
            <br>
             <%
                int est = 0;
                
                String pu = "";
				pu = request.getParameter("PublicacionesID")==null?"0":request.getParameter("PublicacionesID");
										
				Publicaciones pub = new Publicaciones();
				Dt_Publicaciones dtpu = new Dt_Publicaciones();
				pub = dtpu.getPubli(Integer.parseInt(pu));
				
				
				
				
			
             %>
            
            <form action="./Sl_GestionPublicaciones" method="post" class="user row">
            <input name="PublicacionesID" type="hidden" value="<%=pub.getPublicacionesid()%>" />
             <input name="opcion" type="hidden" value="2" />
            
                <div class="form-group col-sm-9">
                    <div class="col-sm-12 mb-3 mb-sm-0">
							<input type="text" class="form-control form-control-user"
								name="txtTitulo" id="txtTitulo" title="T�tulo de la publicaci�n"
								placeholder="T�tulo de publicaci�n" required>
				    </div>
				    <br>
					<div class="col-sm-10 mb-3 mb-sm-0">
							<textarea class="form-control form-control-user" title="Texto que contiene la publiaci�n"
								name="txtDescrip" id="txtDescrip" placeholder="Descripci�n" required></textarea>
					</div>
					<br>
					<div class="col-sm-12 mb-3 mb-sm-0">
							<input type="url" class="form-control form-control-user"
								name="txtVideo" id="txtVideo"
								placeholder="URL del video" title="URL del video">
					</div>
                </div>
                <div class="form-group col-sm-3">
						<select class="form-select" name="selTipoPu" id="selTipoPu" title="Seleccione el estado de la publicaci�n" required>
                            <option value="Visible" title="Visible a todos">Visible</option>
                            <option value="Oculta" title="Oculto a visitantes">Oculto</option>
                            <option value="Borrador" title="A�n no es publicado">Borrador</option>
                        </select>
				</div>
                <br>
                <!-- Botones -->
                <div class="button-formulario">
                    <button>Actualizar</button>
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
	   $("#txtTitulo").val("<%=pub.getTitulo()%>");
	   $("#txtDescrip").val("<%=pub.getDescripcion()%>");
	   <%if(pub.getVideo() != null){
	   %>
		   $("#txtVideo").val("<%=pub.getVideo()%>");
	   <%
	   }
	   %>
	   $("#selTipoPu").val("<%=pub.getTipopubli()%>");
	 
		
	    var mensaje = "";
		mensaje = "<%=varMsj%>";
		
		

		if (mensaje == "existe") {
			//errorAlert('Error','El titulo de la publicaci�n que esta intentando registrar ya existe en la base de datos!');
			$.jAlert({
                'title': 'Error',
                'content': 'El titulo de la publicaci�n que esta intentando registrar ya existe en la base de datos! Intentelo otra vez!',
                'theme': 'red',
                'onClose': function(OnClose) {               
                    window.location = "EditarPublicacion.jsp?PublicacionesID=<%=pub.getPublicacionesid() %>";
                }
              });
		}
		
		
	});
</script>

</body>
</html>