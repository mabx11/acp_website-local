package servlets;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.Dt_Servicios;
 import entidades.Servicios;
// import negocio.Ng_Publicaciones;

/**
 * Servlet implementation class Sl_GestionUsuario
 */
@WebServlet("/Sl_GestionVisitas")

public class Sl_GestionVisitas  extends HttpServlet{

	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sl_GestionVisitas() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
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
			
		serv.setNombre(request.getParameter("txtTitulo"));
		serv.setDescripcion(request.getParameter("txtDescripcion"));
		
		
		switch (opc){
		case 1:{
			
		        try {
		        	// Para Guardar la Fecha y Hora de creación.
		        	Date fechaSistema = new Date();
			        serv.setFechaCreacion(new java.sql.Timestamp(fechaSistema.getTime()));
			        System.out.println("serv.getFechaCreacion(): "+serv.getFechaCreacion());
		        	
		        	if(dtserv.guardarServicio(serv)) {
			        	response.sendRedirect("visitasGuiadas.jsp?msj=1");
			        }
			        else {
			        	response.sendRedirect("visitasGuiadas.jsp?msj=2");
			        }
		        	
		        	
			        	
		        }
		        catch(Exception e) {
		        	System.out.println("Sl_GestionVisitas, el error es: " + e.getMessage());
					e.printStackTrace();
		        }
		        
				break;
			}
		
		default:
			response.sendRedirect("visitasGuiadas.jsp?msj=7");	
			break;
	}
		
		
		
	}
	
}
