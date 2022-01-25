package servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.Dt_Familia;
import datos.Dt_Genero;
import entidades.Genero;
import negocio.Ng_Genero;
import negocio.Ng_Usuario;

/**
 * Servlet implementation class Sl_GestionGenero
 */
@WebServlet("/Sl_GestionGenero")
public class Sl_GestionGenero extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sl_GestionGenero() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int generoID =0;
		generoID = Integer.parseInt(request.getParameter("generoID"));
		Dt_Genero dtg = new Dt_Genero();
		
		if(dtg.eliminarGenero(generoID)) {
        	response.sendRedirect("tblGenero.jsp?msj=5");
        }
        else {
        	response.sendRedirect("tblGenero.jsp?msj=6");
        }
		
	}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		//obtenemos el valor de opcion
				int opc = 0;
				opc = Integer.parseInt(request.getParameter("opcion"));
						
				//CONSTRUIR EL OBJETO USUARIO
					Dt_Genero dtg = new Dt_Genero();
					Genero gen = new Genero();
					Ng_Genero ngg = new Ng_Genero();
					
					
					//fam.setFamiliaID(Integer.parseInt(request.getParameter("familiaID")));
					gen.setNombre(request.getParameter("txtNombreG"));
					gen.setDescripcion(request.getParameter("txtDescripcionG"));
					
				
				
				switch (opc){
				case 1:{
					
				        try {
				        	// Para Guardar la Fecha y Hora de creación.
				        	
				        	Date fechaSistema = new Date();
					        gen.setFechaCreacion(new java.sql.Timestamp(fechaSistema.getTime()));
					        System.out.println("gen.getFechaCreacion(): "+gen.getFechaCreacion());
				        	
					        
					        if(ngg.existeGenero(gen.getNombre())) {
					        	response.sendRedirect("NuevoGenero.jsp?msj=existe");
					        }
					        else {
					        	if(dtg.guardarGen(gen)) {
						        	response.sendRedirect("tblGenero.jsp?msj=1");
						        }
						        else {
						        	response.sendRedirect("tblGenero.jsp?msj=2");
						        }
					        }
					        
					        
					        
					        	
				        }
				        catch(Exception e) {
				        	System.out.println("Sl_GestionGenero, el error es: " + e.getMessage());
							e.printStackTrace();
				        }
				        
						break;
					}
				
				case 2:{
					
					try {
				    	gen.setGeneroID(Integer.parseInt(request.getParameter("generoID")));
				    	
			        	//PARA GUARDAR LA FECHA Y HORA DE MODIFICACION aaaa
				        Date fechaSistema = new Date();
				        gen.setFechaModificacion(new java.sql.Timestamp(fechaSistema.getTime()));
				        System.out.println("fam.getFechaModificacion(): "+ gen.getFechaModificacion());
				        
				        
				        if(ngg.existenGeneroM(gen.getGeneroID(), gen.getNombre())) {
				        	response.sendRedirect("EditarGenero.jsp?generoID="+gen.getGeneroID()+"&msj=existe");
				        }
				        else {
				        	if(dtg.modificarGenero(gen)) {
					        	response.sendRedirect("tblGenero.jsp?msj=3");
					        }
					        else {
					        	response.sendRedirect("tblGenero.jsp?msj=4");
					        }
				        }
				        
				    
				    }
				    catch(Exception e) {
				    	System.out.println("Sl_GestionGenero, el error es: " + e.getMessage());
						e.printStackTrace();
				    	
				    }
				      break;
						
					}
				
				default:
					response.sendRedirect("tblGenero.jsp?msj=5");	
					break;
			}
				
			
		
		
	}

}
