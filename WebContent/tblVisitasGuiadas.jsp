<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"
         import="entidades.*, datos.*, vistas.VW_RolUsuario, java.util.*;" %>
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
<%
	//Variable de control de mensajes
	String varMsj = request.getParameter("msj")==null?"":request.getParameter("msj");


%>
<html>

<head>
   <%@ include file="/utils/head.jsp" %>
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

            <!-- DataTables Servicios -->
            <div class="card shadow mb-4">
                <div class="card-header py-3 row">
                    <div class="col">
						<h1 class="h3 mb-2 text-gray-800">Gestion de Visitas Guiadas</h1>
                    </div>
                    <div class="col" align="right">
			
                        <!-- Button agregar -->
                        <a href="NuevaVisitaGuiada.jsp" data-toggle="modal"
                           data-target="#modalNuevoServicio"> <i
                                class="fas fa-file-medical fa-2x" title="Agregar nueva visita guiada"></i>
                        </a>
                        <!-- Fin Button agregar e imprimir -->

                    </div>
                </div>
                
                <div class="card-body">

                    <div class="table-responsive">
                        <table class="table table-bordered" id="tblVisitasGuiadas" width="100%"
                               cellspacing="0">
                            <%
                                ArrayList<Servicios> listServicios = new ArrayList<Servicios>();
                                Dt_Servicios dtserv = new Dt_Servicios();
                                listServicios = dtserv.listaServicios();

                            %>
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Foto</th>
                                <th>Descripcion</th>
                                <th>Estado</th>
                                <th>Opciones</th>
                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Foto</th>
                                <th>Descripcion</th>
                                <th>Estado</th>
                                <th>Opciones</th>
                            </tr>
                            </tfoot>
                            <tbody>
                            <%
                                for (Servicios ser : listServicios) {
                            %>
                            <tr>
                                <td><%=ser.getServiciosid() %>
                                </td>
                                <td><%=ser.getNombre() %>
                                </td>
                                <td><%=ser.getFoto() %>
                                </td>
                                <td><%=ser.getDescripcion() %>
                                </td>
                                <td><%=ser.getEstado() == 1 || ser.getEstado() == 2 ? "Activo" : "Inactivo" %>
                                </td>
                                <td>
                                	<a id="btn-edita-abrir" href="EditarVisita.jsp?serviciosid=<%=ser.getServiciosid()%>">
                                   		<i class="fas fa-edit" title="Editar visita"></i>
	                                </a> 
	                                <a href="#"> <i class="fas fa-trash-alt" title="Eliminar servicio"></i>
	                                </a> 
	                            </td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            
            <!-- Fin DataTables Servicios -->
        </div>

    </section>
    <!-- End Inicio Section -->

</main>
<!-- End #main -->

<!-- ======= Footer ======= -->
<%@ include file="/menu/footer.jsp" %>
<!-- End Footer -->

<a href="#"
   class="back-to-top d-flex align-items-center justify-content-center"><i
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

<!-- jAlert js -->
<script src="jAlert/dist/jAlert.min.js"></script>
<script src="jAlert/dist/jAlert-functions.min.js"> //optional!!</script>

<script>
    $(document).ready(function () {
        ////// APLICAMOS FORMATO Y BOTONES A LA TABLA //// INICIAMOS EL PLUGIN DATATABLE
        $('#tblServicios').DataTable({
            dom: 'Bfrtip',
            buttons: [
                //'pdf',
                'excel']

        });

        const message = "<%=varMsj%>"

        switch (message) {
            case '1' :
                successAlert('�xito', 'Los datos han sido registrados exitosamente');

                break
            case '2' :
                errorAlert('Error', 'Revise los datos e intente nuevamente');
                
                break
            case '3' :
                successAlert('�xito', 'Los datos han sido actualizados exitosamente');
                
                break
            case '4' :
                errorAlert('Error', 'Revise los datos e intente nuevamente');
                
                break
            case '5' :
                successAlert('�xito', 'Los datos han sido eliminados exitosamente');
                
                break
            case '6' :
                errorAlert('Error', 'Revise los datos e intente nuevamente');
                
                break
        }
    });
</script>

</body>
</html>