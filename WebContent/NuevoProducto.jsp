<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="entidades.*, datos.*, vistas.*, java.util.*; " %>
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

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet">
    
    <!-- jAlert css  -->
	<link rel="stylesheet" href="jAlert/dist/jAlert.css" />
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

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

                <%

                    ArrayList<TipoProducto> listTipoProd = new ArrayList<TipoProducto>();
                    Dt_TipoProd dttp = new Dt_TipoProd();
                    listTipoProd = dttp.listaTipoProdActivos();

                %>

                <!-- Formulario arboles -->
                <div class="contenido-arboles formulario col-sm-12">
                    <h2 class="form-header" style="color: black;">Agregar Nuevo Producto</h2>

                    <form class="user" method="post" action="./Sl_GestionProductos">
						<div class="row">
						
                            <div class="form-group col-sm-6">
                                <div class="col-sm-12">
                                 Nombre de producto:
                                 <input name="opcion" type="hidden" value="1"/>
                                    <div>
                                        <input type="text" class="form-control" name="txtNombre" id="txtNombre"
                                               placeholder="Nombre" title="Nombre del producto" required>
                                    </div>
                                </div>
                                
                                <div class="col-sm-12">
                                    Tipo de producto:
                                    <div class="row">
                                        <div class="col-sm-8">
                                            <select class="form-select"  name="cbxTipoProd" id="cbxTipoProd" title="Tipo de producto" required>
                                                <option value="">Seleccione</option>
                                                <%
                                                    for (TipoProducto tp : listTipoProd) {
                                                %>
                                                <option value="<%= tp.getTipoproductoid() %>"><%= tp.getTipoproducto() %>
                                                </option>
                                                <%
                                                    }
                                                %>

                                            </select>
                                        </div>
                                        <div class="col-sm-2">
                                            <a title="Agregar nuevo tipo de producto" href="NuevoTipoProd.jsp">
                                                <i class="add fa-2x fas fa-plus-circle"></i></a>
                                        </div>
                                    </div>
                                    <br>
                                </div>
                            </div>

                            <div class="form-group col-sm-6">
                                <div class="col-sm-12">
                                    Estado:
                                    <div class="row">
                                        <div class="form-group col-sm-8">
										<select class="form-select" name="selDisp" id="selDisp" title="Seleccione el estado del producto" required>
					                           <option value="">Seleccione...</option>
					                           <option value="Disponible" title="Producto disponible">Disponible</option>
					                           <option value="No disponible" title="Producto no disponible">No disponible</option>
					                       </select>
										</div>
                                    </div>
                                    <br>
                                </div>
                                
                              
                        </div>
                        
                            <div class="form-group col-sm-11">
                                &nbsp;&nbsp;&nbsp;Descripción:
                                <div class="col-sm-12">
                                    <textarea class="form-control form-control-user" name="txaDescripcion" id="txaDescripcion" maxlength="200" cols="50" rows="3" placeholder="Descripción"
                                              required></textarea>
                                </div>
                                <br>
                            </div>

                            <!-- Botones -->
			                <div class="button-formulario" style="padding: 35px">
			                    <button> Guardar</button>
			                    <a href="tblProductos.jsp" class="button">Regresar </a>
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

<!-- Bootstrap core JavaScript-->
<script src="assets/vendor/jquery/jquery.min.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="assets/vendor/jquery-easing/jquery.easing.min.js"></script>

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
			//errorAlert('Error','Los datos de arbol que está intentando registrar ya existen en la base de datos');
			$.jAlert({
                'title': 'Error',
                'content': 'Los datos del árbol que está intentando registrar ya existen en la base de datos',
                'theme': 'red',
                'onClose': function(OnClose) {               
                    window.location = "NuevoProducto.jsp";
                }
              });
		}

		
	});
</script>


</body>

</html>