package servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.Dt_Familia;
import datos.Dt_Usuario;
import entidades.Familia;
import negocio.Ng_Familia;
import negocio.Ng_Genero;

/**
 * Servlet implementation class Sl_GestionFamilia
 */
@WebServlet("/Sl_GestionFamilia")
public class Sl_GestionFamilia extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sl_GestionFamilia() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		int familiaID =0;
		familiaID = Integer.parseInt(request.getParameter("familiaID"));
		Dt_Familia dtf = new Dt_Familia();
		
		if(dtf.eliminarFamilia(familiaID)) {
        	response.sendRedirect("tblFamilia.jsp?msj=5");
        }
        else {
        	response.sendRedirect("tblFamilia.jsp?msj=6");
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
			Dt_Familia dtf = new Dt_Familia();
			Familia fam = new Familia();
			Ng_Familia ngf = new Ng_Familia();
			
			//fam.setFamiliaID(Integer.parseInt(request.getParameter("familiaID")));
			fam.setNombre(request.getParameter("txtNombre"));
			fam.setDescripcion(request.getParameter("txtDesc"));
			
		
		
		switch (opc){
		case 1:{
			
		        try {
		        	// Para Guardar la Fecha y Hora de creación.
		        	
		        	Date fechaSistema = new Date();
			        fam.setFechaCreacion(new java.sql.Timestamp(fechaSistema.getTime()));
			        System.out.println("fam.getFechaCreacion(): "+fam.getFechaCreacion());
		        	
			        if(ngf.existeFamilia(fam.getNombre())) {
			        	response.sendRedirect("NuevaFamilia.jsp?msj=existe");
			        }
			        else {
			        	if(dtf.guardarFam(fam)) {
				        	response.sendRedirect("tblFamilia.jsp?msj=1");
				        }
				        else {
				        	response.sendRedirect("tblFamilia.jsp?msj=2");
				        }
			        }
			        	
		        }
		        catch(Exception e) {
		        	System.out.println("Sl_GestionFamilia, el error es: " + e.getMessage());
					e.printStackTrace();
		        }
		        
				break;
			}
		
		case 2:{
				
			try {
		    	fam.setFamiliaID(Integer.parseInt(request.getParameter("familiaID")));
		    	
	        	//PARA GUARDAR LA FECHA Y HORA DE MODIFICACION
		        Date fechaSistema = new Date();
		        fam.setFechaModificacion(new java.sql.Timestamp(fechaSistema.getTime()));
		        System.out.println("fam.getFechaModificacion(): "+ fam.getFechaModificacion());	      
		        
		        if(ngf.existeFamiliaM(fam.getFamiliaID(), fam.getNombre())) {
		        	response.sendRedirect("EditarFamilia.jsp?familiaID="+fam.getFamiliaID()+"&msj=existe");
		        }
		        else {
		        	if(dtf.modificarFamilia(fam)) {
			        	response.sendRedirect("tblFamilia.jsp?msj=3");
			        }
			        else {
			        	response.sendRedirect("tblFamilia.jsp?msj=4");
			        }
		        }
		        
		    
		    }
		    catch(Exception e) {
		    	System.out.println("Sl_GestionFamilia, el error es: " + e.getMessage());
				e.printStackTrace();
		    	
		    }
		      break;
				
			}
		
		default:
			response.sendRedirect("tblFamilia.jsp?msj=5");	
			break;
	}
		
		
		
		
	}

}
