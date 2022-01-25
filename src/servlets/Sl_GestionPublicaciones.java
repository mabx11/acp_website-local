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
import entidades.Publicaciones;
import negocio.Ng_Publicaciones;

/**
 * Servlet implementation class Sl_GestionUsuario
 */
@WebServlet("/Sl_GestionPublicaciones")

public class Sl_GestionPublicaciones  extends HttpServlet{

	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sl_GestionPublicaciones() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		int PublicacionesID =0;
		PublicacionesID = Integer.parseInt(request.getParameter("PublicacionesID"));
		Dt_Publicaciones dtpu = new Dt_Publicaciones();
		
		if(dtpu.eliminaPubli(PublicacionesID)) {
        	response.sendRedirect("tblPublicaciones.jsp?msj=5");
        }
        else {
        	response.sendRedirect("tblPublicaciones.jsp?msj=6");
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
			Dt_Publicaciones dtpu = new Dt_Publicaciones();
			Publicaciones pub = new Publicaciones();
			Ng_Publicaciones ngpu = new Ng_Publicaciones();
			
			//user.setUsuarioID(Integer.parseInt(request.getParameter("usuarioID")));
			pub.setTitulo(request.getParameter("txtTitulo"));
			pub.setDescripcion(request.getParameter("txtDescrip"));
			pub.setVideo(request.getParameter("txtVideo"));
			pub.setTipopubli(request.getParameter("selTipoPu"));
		
		switch (opc){
		case 1:{
			
		        try {
		        	// Para Guardar la Fecha y Hora de creación.
		        	
		        	Date fechaSistema = new Date();
			        pub.setFechaCreacion(new java.sql.Timestamp(fechaSistema.getTime()));
			        System.out.println("pub.getFechaCreacion(): "+pub.getFechaCreacion());
		        	
			        if(ngpu.existePubli(pub.getTitulo())) {
			        	response.sendRedirect("NuevaPublicacion.jsp?msj=existe");
			        }
			        else {
			        	if(dtpu.guardarPubli(pub)) {
				        	response.sendRedirect("tblPublicaciones.jsp?msj=1");
				        }
				        else {
				        	response.sendRedirect("tblPublicaciones.jsp?msj=2");
				        }
			        }
			        	
		        }
		        catch(Exception e) {
		        	System.out.println("Sl_GestionPublicaciones, el error es: " + e.getMessage());
					e.printStackTrace();
		        }
		        
				break;
			}
		
		case 2:{
			
				try {
					var xd = "";
					pub.setPublicacionesid(Integer.parseInt(request.getParameter("PublicacionesID")));
					//PARA GUARDAR LA FECHA Y HORA DE MODIFICACION
					Date fechaSistema = new Date();
					pub.setFechaModificacion(new java.sql.Timestamp(fechaSistema.getTime()));
					System.out.println("pub.getFechaModificacion(): "+pub.getFechaModificacion());
					
					if(pub.getVideo().equals(xd)) {
						//String xd = null;
						System.out.println("Entra y el valor es: "+pub.getVideo());
						pub.setVideo(request.getParameter(null));
					}
				
					if(ngpu.existePubliA(pub.getPublicacionesid(), pub.getTitulo())) {
			        	response.sendRedirect("EditarPublicacion.jsp?PublicacionesID="+pub.getPublicacionesid()+"&msj=existe");
			        }else {
			        	if(dtpu.modificarPubli(pub)) {
				        	response.sendRedirect("tblPublicaciones.jsp?msj=3");
				        	
				        }
				        else {
				        	response.sendRedirect("tblPublicaciones.jsp?msj=4");
				        }
			        }
		        
		        
	        	
	        }
	        catch(Exception e) {
	        	System.out.println("Sl_GestionPublicaciones, el error es: " + e.getMessage());
				e.printStackTrace();
	        }
				break;
				
			}
		
		default:
			response.sendRedirect("tblPublicaciones.jsp?msj=7");	
			break;
	}
		
		
		
	}
	
}
