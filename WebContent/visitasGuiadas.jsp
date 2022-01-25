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
	
	vru = (VW_RolUsuario) session.getAttribute("acceso");
	if(vru==null){
		response.sendRedirect("inicioSesion.jsp?msj=401");
	}
	else{
		listRolOpc = dtro.listaRolOpc2(vru.getRolid());
		
		int index = request.getRequestURL().lastIndexOf("/");
		String miPagina = request.getRequestURL().substring(index+1);
		boolean permiso = false; //VARIABLE DE CONTROL
		
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
    <%@ include file="/utils/head.jsp" %>
</head>

<body>
<%@ include file="/menu/header.jsp" %>

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
						<h1 class="h3 mb-2 text-gray-800">Gestión de Servicios</h1>
                    </div>
                    <div class="col" align="right">
			
                        <!-- Button agregar -->
                        
                        <a href="nuevaVisita.jsp" class="fas fa-file-medical fa-2x">
                        </a>
                        
                        <!-- Fin Button agregar e imprimir -->

                    </div>
                </div>
                
                <div class="card-body">

                    <div class="table-responsive">
                        <table class="table table-bordered" id="tblServicios" width="100%"
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
                                	<a id="btn-edita-abrir" href="EditarServicio.jsp?serviciosid=<%=ser.getServiciosid()%>">
                                   		<i class="fas fa-edit" title="Editar servicio"></i>
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

</body>

</html>