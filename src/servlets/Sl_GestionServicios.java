package servlets;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.Dt_Publicaciones;
import datos.Dt_Servicios;
import entidades.Servicios;
import negocio.Ng_Servicios;
import datos.Dt_enviarEmail;
// import negocio.Ng_Publicaciones;

/**
 * Servlet implementation class Sl_GestionUsuario
 */
@WebServlet("/Sl_GestionServicios")

public class Sl_GestionServicios  extends HttpServlet{

	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sl_GestionServicios() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		int ServiciosID =0;
		ServiciosID = Integer.parseInt(request.getParameter("ServicioID"));
		Dt_Servicios dtser = new Dt_Servicios();
				
		if(dtser.eliminaServicio(ServiciosID)) {
		       response.sendRedirect("tblServicios.jsp?msj=5");
		}
		else {
		       response.sendRedirect("tblServicios.jsp?msj=6");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		
		System.out.println("Entro a la consola");
		//obtenemos el valor de opcion
		int opc = 0;
		opc = Integer.parseInt(request.getParameter("opcion"));
				
		//CONSTRUIR EL OBJETO USUARIO
		Dt_Servicios dtserv = new Dt_Servicios();
		Servicios serv = new Servicios();
		Ng_Servicios ngser = new Ng_Servicios();
		
		Dt_enviarEmail dtem = new Dt_enviarEmail();
		
		var name ="";
		var subject ="";
		var email ="";
		var descripcion ="";
			
		serv.setNombre(request.getParameter("txtTitulo"));
		serv.setDescripcion(request.getParameter("txtDescripcion"));
		serv.setDisponibilidad(request.getParameter("selDisp"));
		
		switch (opc){
		case 1:{
			
		        try {
		        	// Para Guardar la Fecha y Hora de creación.
		        	Date fechaSistema = new Date();
			        serv.setFechaCreacion(new java.sql.Timestamp(fechaSistema.getTime()));
			        System.out.println("serv.getFechaCreacion(): "+serv.getFechaCreacion());
		        	
		        	if(ngser.existeServicio(serv.getNombre())) {
		        		response.sendRedirect("NuevoServicio.jsp?msj=existe");
		        	}else {
		        		if(dtserv.guardarServicio(serv)) {
				        	response.sendRedirect("tblServicios.jsp?msj=1");
				        }
				        else {
				        	response.sendRedirect("tblServicios.jsp?msj=2");
				        }
		        	}
		        	
		        	
			        	
		        }
		        catch(Exception e) {
		        	System.out.println("Sl_GestionServicios, el error es: " + e.getMessage());
					e.printStackTrace();
		        }
		        
				break;
			}
		
		case 2:{
			
			try {
				serv.setServiciosid(Integer.parseInt(request.getParameter("ServicioID")));
				//PARA GUARDAR LA FECHA Y HORA DE MODIFICACION
				Date fechaSistema = new Date();
				serv.setFechaModificacion(new java.sql.Timestamp(fechaSistema.getTime()));
				System.out.println("pub.getFechaModificacion(): "+serv.getFechaModificacion());
			
				if(ngser.existeServicioA(serv.getServiciosid(), serv.getNombre())) {
		        	response.sendRedirect("EditarServicio.jsp?ServicioID="+serv.getServiciosid()+"&msj=existe");
		        }else {
		        	if(dtserv.modificarServicio(serv)) {
			        	response.sendRedirect("tblServicios.jsp?msj=3");
			        	
			        }
			        else {
			        	response.sendRedirect("tblServicios.jsp?msj=4");
			        }
		        }
	        
	        
        	
        }
        catch(Exception e) {
        	System.out.println("Sl_GestionPublicaciones, el error es: " + e.getMessage());
			e.printStackTrace();
        }
			break;
			
		}
		
case 3:{
			
	        try {
	        	// Para Guardar la Fecha y Hora de creación.
	        	
	        	serv.setServiciosid(Integer.parseInt(request.getParameter("ServicioID")));
	        	
	        	name = request.getParameter("txtNombre");
	        	subject = request.getParameter("txtAsunto");
	        	email = request.getParameter("txtCorreo");
	        	descripcion = request.getParameter("txtConsulta");
	        	
	        	if(dtem.autoEnviarCorreo(name, subject, email, descripcion)) {
		        	response.sendRedirect("vistaServicio.jsp?ServicioID="+serv.getServiciosid()+"&msj=1");
		        }
		        else {
		        	response.sendRedirect("vistaServicio.jsp?ServicioID="+serv.getServiciosid()+"&msj=2");
		        }
		        
		        
		        
		        
		        	
	        }
	        catch(Exception e) {
	        	System.out.println("Sl_GestionProductos, el error es: " + e.getMessage());
				e.printStackTrace();
	        }
	        
			break;
		}
		
		default:
			response.sendRedirect("tblServicios.jsp?msj=7");	
			break;
	}
		
		
		
	}
	
}
