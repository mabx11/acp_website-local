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


            <div class="row">
                <!-- Cardview -->
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
                            
                <div  class="col-sm-2 arboles card-view ">
                    <div class="">
                        <a style="color:#081C44;" href="fotoArbol.jsp?idArbol=<%=vwru.getID()%>">
	                        <img name="imgArbol" id="imgArbol" src="<%=arb.getImagen()==null?"#":arb.getImagen()%>" onerror="this.onerror=null;this.src='assets/img/arbol-default.png';">
	                        <br>
	                        <i class="fas fa-camera"></i> Editar imagen
	                    </a>
                        <hr></hr>
                        <p name="txtNombreCo" id="txtNombreCo"><%=arb.getNombrecomun()%></p><br>
                    </div>
                </div>
                <!-- Fin cardview -->


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

                <!-- Formulario arboles -->
                <div class="contenido-arboles formulario col-sm-9">
                    <h2 class="form-header" style="color: black;">Editar Árbol</h2>
            
                    <form class="user" method="post" action="./Sl_GestionArbol">
						<!-- El valor de este input es para el Servlet opcion guardar -->
						<input name="idArbol" type="hidden" value="<%=arb.getArbolId()%>" /> 
						<input name="opcion" type="hidden" value="2" /> 
						<input name="ID" type="hidden" value="<%=vwru.getID()%>" /> 
						<input name="opcion" type="hidden" value="2" />
						
                        <div class="row">

                            <div class="form-group col-sm-6">
                                <div class="col-sm-12">
                                    Nombre común:
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" name="txtNombreC" id="txtNombreC"
                                               placeholder="Nombre común" required>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    Nombre científico:
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" name="txtNombreCi" id="txtNombreCi"
                                               placeholder="Nombre científico" required>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    Género:
                                    <div class="row">
                                        <div class="col-sm-8">
                                            <select class="form-select" name="cbxGenero" id="cbxGenero" required>
                                                <option value="">Seleccione</option>
                                                <%
                                                    for (Genero ar : listGenero) {
                                                %>
                                                <option value="<%= ar.getGeneroID() %>"><%= ar.getNombre() %>
                                                </option>
                                                <%
                                                    }
                                                %>

                                            </select>
                                        </div>
                                        <div class="col-sm-2">
                                            <a title="Agregar nuevo género" href="NuevoGenero.jsp">
                                                <i class="add fa-2x fas fa-plus-circle"></i></a>
                                        </div>
                                    </div>
                                    <br>
                                </div>
                            </div>

                            <div class="form-group col-sm-6">
                                <div class="col-sm-12">
                                    Familia:
                                    <div class="row">
                                        <div class="col-sm-8">
                                            <select class="form-select" name="cbxFamilia" id="cbxFamilia" required>
                                                <option value="">Seleccione</option>
                                                <%
                                                    for (Familia fr : listFamilia) {
                                                %>
                                                <option value="<%= fr.getFamiliaID() %>"><%= fr.getNombre() %>
                                                </option>
                                                <%
                                                    }
                                                %>

                                            </select>
                                        </div>
                                        <div class="col-sm-2">
                                            <a title="Agregar nueva familia" href="NuevaFamilia.jsp">
                                                <i class="add fa-2x fas fa-plus-circle"></i></a>
                                        </div>
                                    </div>
                                    <br>
                                </div>
                                <div class="col-sm-12">
                                    Floración:
                                    <div class="row">
                                        <div class="col-sm-10">
                                            <select class="form-select" name="cbxFlora" id="cbxFlora" required>
                                                <option value="">Seleccione</option>
                                                <%
                                                    for (Floracion flr : listFloracion) {
                                                %>
                                                <option value="<%= flr.getFloracionID() %>"><%= flr.getNombre() %>
                                                </option>
                                                <%
                                                    }
                                                %>

                                            </select>
                                        </div>
                                        
                                    </div>
                                    <br>
                                </div>
                               
                            </div>
                            <div class="form-group col-sm-11">
                                Descripción:
                                <div class="col-sm-12">
                                    <textarea class="form-control form-control-user" name="txaDescrip" id="txaDescrip" maxlength="200" cols="50" rows="3" placeholder="Descripción"
                                              required></textarea>
                                </div>
                                <br>
                            </div>

                            <!-- Botones -->
                            <div class="col-md-10 button-iniciar">
                                 <input class="btn-user button button-formulario" type="submit"
					                                       value="Guardar"/>
                                <a href="javascript:history.go(-1)" class="button"> Regresar</a>
                            </div>
                        </div>
                    </form>
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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<!-- Bootstrap core JavaScript-->
<script src="assets/vendor/jquery/jquery.min.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="assets/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- DATATABLE -->
<script src="DataTables/DataTables-1.10.21/js/jquery.dataTables.js"></script>

<!-- DATATABLE buttons -->
<script src="DataTables/Buttons-1.6.3/js/dataTables.buttons.min.js"></script>

<!-- js Datatable buttons print -->
<script src="DataTables/Buttons-1.6.3/js/buttons.html5.min.js"></script>
<script src="DataTables/Buttons-1.6.3/js/buttons.print.min.js"></script>

<!-- js Datatable buttons pdf -->
<script src="DataTables/pdfmake-0.1.36/pdfmake.min.js"></script>
<script src="DataTables/pdfmake-0.1.36/vfs_fonts.js"></script>

<!-- js Datatable buttons excel -->
<script src="DataTables/JSZip-2.5.0/jszip.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<!-- jAlert js -->
<script src="jAlert/dist/jAlert.min.js"></script>
<script src="jAlert/dist/jAlert-functions.min.js"> //optional!!</script>


<script type="text/javascript">
     
    $(document).ready(function ()
    {
    	   $("#imgArbol").val("<%=arb.getImagen()%>");
	 	   $("#txtNombreo").val("<%=arb.getNombrecomun()%>");
	 	   $("#txtNombreC").val("<%=arb.getNombrecomun()%>");
	 	   $("#txtNombreCi").val("<%=arb.getNombrecientifico()%>");
	 	   $("#cbxGenero").val("<%=arb.getGeneroID()%>");
	 	   $("#cbxFamilia").val("<%=arb.getFamiliaID()%>");
	 	   $("#cbxFlora").val("<%=arb.getFloracionID()%>");
	 	   $("#txaDescrip").val("<%=arb.getDescripcion()%>");
	 	   
	 	
		/////////// VARIABLE DE CONTROL MSJ ///////////
        var mensaje = "";
        mensaje = "<%=varMsj%>";

		if (mensaje == "existe") {
			//errorAlert('Error','El nombre de usuario que esta intentando registrar ya existe en la base de datos');
			$.jAlert({
                'title': 'Error',
                'content': 'Los datos de árboles que esta intentando registrar ya existen en la base de datos',
                'theme': 'red',
                'onClose': function(OnClose) {               
                	 window.location = "EditarArboles.jsp?arbolID=<%=arb.getArbolId()%>";
                }
              });
		}

	});
</script>
</body>

</html>