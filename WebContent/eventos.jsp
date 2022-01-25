<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" 
         import="entidades.Eventos, datos.Dt_Eventos, vistas.VW_RolUsuario, datos.Dt_RolOpciones, java.util.*;" %>
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
    <link href="assets/fontawesome-free-5.14.0-web/css/fontawesome.min.css" rel="stylesheet">

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
    <link rel="stylesheet" href="assets/css/calendar.css">
    
        <!-- Otro calendario -->
    <link href="assets/vendor/fullcalendar/main.css" rel="stylesheet" />
    <script src="assets/vendor/fullcalendar/main.js"></script>

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

            <!-- Boton de edicion-->
            <div id="button-edicion" class="button-edicion">
                <a href="tblEventos.jsp">
                    <button> Administrar eventos</button>
                </a>
            </div>
            <!-- Termina boton de edicion-->
            
            <%
                ArrayList<Eventos> listEvent = new ArrayList<Eventos>();
                Dt_Eventos dte = new Dt_Eventos();
                listEvent = dte.listaEventosActivos();

            %>

            <div class="eventos row">
                <div class="eventos col-sm-8">
                
                <%
                    for (Eventos ev : listEvent) {
                %>

                    <div class="content div-eventos">
                        <img src="<%=ev.getHipervinculo()==null?"#":ev.getHipervinculo()%>" onerror="this.onerror=null;this.src='assets/img/evento-default.png';">
                        <div id="Content-evento" class="Content-evento">
                            <h2><%=ev.getNombre() %></h2>
                            <p><strong>Descripción: </strong><%=ev.getDescripcion() %><br>
                            <strong>Ubicación:</strong> <%=ev.getUbicacion() %>
                                <br><strong>Fecha: </strong><%=ev.getFechainicio() %>
                                <br><strong>Hora: </strong><%=ev.getHora() %></p>

                        </div>
                    </div>
                    
                    <%
	                    }
	                %>

                    <!-- Boton anadir publicacion-->
                    <div id="button-anadirpub" class="button-anadirpub">
                        <a href="NuevoEvento.jsp">
                            <button> Añadir nuevo evento</button>
                        </a>
                    </div>

                </div>
                <div class="eventos col-sm-4 col-center">
                    <div class="root">
                        <center>
                            <div class="calendar2" id="calendar2">
                        </center>
                    </div>
                </div>
            </div>
        </div>

        </div>

        <!-- <div class="col-lg-6 d-flex align-items-center" data-aos="zoom-out" data-aos-delay="200">
            <img src="assets/img/about.jpg" class="img-fluid" alt="">
        </div> -->
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

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	  integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>

<script>
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar2');

        var calendar = new FullCalendar.Calendar(calendarEl, {
          themeSystem: 'bootstrap',
          initialView: 'dayGridMonth',
          headerToolbar: {
            left: 'prev,next',
            center: 'title',
            right: 'today'
          },
          
          events: [
           	  <%
              	for(Eventos evento: listEvent){
              		
              %>
              
              {
          		Id: '<%= evento.getEventoid()%>',
          		groupId: '<%= evento.getTipoevento()%>',
          		title: '<%= evento.getNombre()%>',
          		start: '<%= evento.getFechainicio()%>',
          		end: '<%= evento.getFechafin()%>',
          		backgroundColor: '<%= evento.getTipoevento().equals("Privado") ? "#2E446D" : "#3788d8" %>'
          	},
              <%
            	}
              %>            
              {
     
  }
            ]
            
          });
          calendar.render();
        });

      </script>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/locale/es.js"></script>
<script type="text/javascript" src="assets/js/calendar.js"></script>

<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>


<script type="text/javascript">
    let calendar = new Calendar('calendar');
    calendar.getElement().addEventListener('change', e => {
        console.log(calendar.value().format('LLL'));
    });
</script>

</body>

</html>