package servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.Dt_Distribucion;
import entidades.Distribucion;
import negocio.Ng_Distribucion;

/**
 * Servlet implementation class Sl_GestionDistribucion
 */
@WebServlet("/Sl_GestionDistribucion")

public class Sl_GestionDistribucion extends HttpServlet {
	
private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sl_GestionDistribucion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int DistribucionID =0;
		DistribucionID = Integer.parseInt(request.getParameter("DistribucionID"));
		Dt_Distribucion dtd = new Dt_Distribucion();
		
		if(dtd.eliminarDistribucion(DistribucionID)) {
        	response.sendRedirect("tblDistribucion.jsp?msj=5");
        }
        else {
        	response.sendRedirect("tblDistribucion.jsp?msj=6");
        }
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		
		//obtenemos el valor de opcion
		int opc = 0;
		opc = Integer.parseInt(request.getParameter("opcion"));
				
		//CONSTRUIR EL OBJETO DISTRIBUCION
			Dt_Distribucion dtd = new Dt_Distribucion();
			Distribucion dis = new Distribucion();
			Ng_Distribucion ngd = new Ng_Distribucion();
			
			//dis.setDistribucionID(Integer.parseInt(request.getParameter("distribucionid")));
			dis.setNombre(request.getParameter("txtNombre"));
			dis.setDescripcion(request.getParameter("txtDesc"));
			dis.setPaisID(Integer.parseInt(request.getParameter("cbxPais")));
			
		
		
		switch (opc){
		case 1:{
			
				try {
		        	// Para Guardar la Fecha y Hora de creación.
		        	Date fechaSistema = new Date();
			        dis.setFechaCreacion(new java.sql.Timestamp(fechaSistema.getTime()));
			        System.out.println("dis.getFechaCreacion(): "+dis.getFechaCreacion());
		        	
		        	
			        if(ngd.existeDistribucion(dis.getNombre())){
			        	response.sendRedirect("NuevaDistribucion.jsp?msj=existe");
			        	
			        }
			        else {
			        	if(dtd.guardarDistribucion(dis)) {
				        	response.sendRedirect("tblDistribucion.jsp?msj=1");
				        }
				        else {
				        	response.sendRedirect("tblDistribucion.jsp?msj=2");
				        }
			        }
			        	
		        }
		        catch(Exception e) {
		        	System.out.println("Sl_GestionDistribucion, el error es: " + e.getMessage());
					e.printStackTrace();
		        }
		        
				break;
			}
		
		case 2:{
			
			dis.setDistribucionID(Integer.parseInt(request.getParameter("distribucionid")));
			dis.setEstado(2);
				
			try {
				
				//PARA GUARDAR LA FECHA Y HORA DE MODIFICACION
		        Date fechaSistema = new Date();
		        dis.setFechaModificacion(new java.sql.Timestamp(fechaSistema.getTime()));
		        System.out.println("dis.getFechaModificacion(): "+ dis.getFechaModificacion());
		   
			
		        if(ngd.existeDistribucionM(dis.getDistribucionID(), dis.getNombre())) {
		        	response.sendRedirect("EditarDistribucion.jsp?familiaID="+dis.getDistribucionID()+"&msj=existe");
		        }
		        else {
		        	if(dtd.modificarDistribucion(dis)) {
			        	response.sendRedirect("tblDistribucion.jsp?msj=3");
			        }
			        else {
			        	response.sendRedirect("tblDistribucion.jsp?msj=4");
			        }
		        }
	        }
	        catch(Exception e) {
	        	System.out.println("Sl_GestionDistribucion, el error es: " + e.getMessage());
				e.printStackTrace();
	        }
				break;
				
			}
		
		default:
			response.sendRedirect("tblDistribucion.jsp?msj=5");	
			break;
	}
		
		
		
	}

}
