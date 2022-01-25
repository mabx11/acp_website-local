<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"
         import="datos.*, entidades.*, vistas.*, java.util.*;" %>

<%
	response.setHeader( "Pragma", "no-cache" );
	response.setHeader( "Cache-Control", "no-store" );
	response.setDateHeader( "Expires", 0 );
	response.setDateHeader( "Expires", -1 );
	
	VW_RolUsuario vru1 = new VW_RolUsuario();
	Dt_RolOpciones dtro2 = new Dt_RolOpciones();
	ArrayList<VW_RolOpciones> listRolOpcH = new ArrayList<VW_RolOpciones>();
	
	//OBTENEMOS LA SESION
	vru1 = (VW_RolUsuario) session.getAttribute("acceso2");
	/*if(vru1==null){
		response.sendRedirect("inicioSesion.jsp?msj=401");
	}
	else{
		//OBTENEMOS LA LISTA DE OPCIONES ASIGNADAS AL ROL
		listRolOpcH = dtro2.listaRolOpc2(vru1.getRolid());
		//listOpc = dtro.listaRolOpc(vru.getIdrol());
		
		
	}*/
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">

<!-- Custom fonts for this template -->
<link href="assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

<style type="text/css">
	a:hover{
    	text-decoration: none;
    }
</style>

</head>

<body>
<!-- ======= Header ======= --> 
  <header id="header" class="header fixed-top">
    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">

      <a href="index.jsp" class="logo d-flex align-items-center">
        <img src="assets/img/logo2.png" alt="">
      </a>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto" href="index.jsp">Quiénes somos</a></li>
          <li><a class="nav-link" href="eventos.jsp">Eventos</a></li>
           <li class="dropdown"><a href="arboles.jsp"><span>Árboles</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a class="nav-link" href="tblGenero.jsp">Género</a></li>
              <li><a class="nav-link" href="tblFamilia.jsp">Familia</a></li>
              <li><a class="nav-link" href="tblFloracion.jsp">Floración</a></li>
               <li class="dropdown"><a href="tblDistribucion.jsp"><span>Distribución</span> <i class="bi bi-chevron-right"></i></a>
                <ul>
               	  <li class="dropdown"><a href="tblPais.jsp"><span>País</span> <i class="bi bi-chevron-right"></i></a>
                  <ul>
                    <li><a class="nav-link" href="tblRegion.jsp">Región</a></li>
                 </ul>
                </ul>
              </li> 
            </ul>
          </li>
          <li><a class="nav-link" href="mapa.jsp">Mapa</a></li>
          <li class="dropdown"><a href="servicios.jsp"><span>Servicios</span><i class="bi bi-chevron-down"></i></a>
          	<ul>
          		<li class="dropdown"><a href="productos.jsp"><span>Productos</span><i class="bi bi-chevron-right"></i></a>
          		<ul>
                    <li><a class="nav-link" href="tblTipoProd.jsp">Tipo de producto</a></li>
                </ul>
          	</ul>
          </li>
          <li><a class="nav-link" href="publicaciones.jsp">Publicaciones</a></li>
          <li class="dropdown"><a href="#"><span>Seguridad</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li class="dropdown"><a href="tblUsuarios.jsp"><span>Usuarios</span> <i class="bi bi-chevron-right"></i></a>
                <ul>
                  <li><a class="nav-link" href="tblRolUser.jsp">Asignar Rol</a></li>
                </ul>
              </li>
              <!--<li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-right"></i></a>
                <ul>
                  <li><a href="#">Deep Drop Down 1</a></li>
                  <li><a href="#">Deep Drop Down 2</a></li>
                  <li><a href="#">Deep Drop Down 3</a></li>
                  <li><a href="#">Deep Drop Down 4</a></li>
                  <li><a href="#">Deep Drop Down 5</a></li>
                </ul>
              </li> -->
              <li class="dropdown"><a href="tblRol.jsp"><span>Roles</span><i class="bi bi-chevron-right"></i></a>
                <ul>
                  <li><a class="nav-link" href="tblRolOpc.jsp">Asignar Opción</a></li>
                </ul>
              </li>
              <li><a class="nav-link" href="tblOpciones.jsp">Opciones</a></li>
            </ul>
          </li>
          <%
            String Username = "-";
		    int UserID = 0;
		    String Edit = "";
            if(vru1 == null){
            	Edit = "No hay sesion";
            }else
            {
            	Username = vru1.getUsuario();
            	UserID = vru1.getUsuarioid();
            	Edit = "Editar datos";
            }
            
            
          %>
          
          
          
          <li class="dropdown"><a href="#"><img src="assets/img/usuario.png"><i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a >User: <%=Username%></a></li>
              <li><a class="nav-link"  href="EditSelfUser.jsp?UsuarioID=<%=UserID%>"><%=Edit%></a></li>
              <li><a class="nav-link" href="inicioSesion.jsp">Salir</a></li>  
            </ul>
          </li>  
          
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav>
      <!-- .navbar -->

    </div>
  </header>    
  <!-- End Header -->
</body>

</html>