package servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.Dt_Arbol;
import datos.Dt_Familia;
import entidades.Arbol;
import negocio.Ng_Arbol;
import negocio.Ng_Genero;

/**
 * Servlet implementation class Sl_GestionArbol
 */
@WebServlet("/Sl_GestionArbol")
public class Sl_GestionArbol extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sl_GestionArbol() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		int arbolID =0;
		arbolID = Integer.parseInt(request.getParameter("arbolID"));
		Dt_Arbol dta = new Dt_Arbol();
		
		if(dta.eliminarArbol(arbolID)) {
        	response.sendRedirect("tblArbol.jsp?msj=5");
        }
        else {
        	response.sendRedirect("tblArbol.jsp?msj=6");
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
			Dt_Arbol dta = new Dt_Arbol();
			Arbol arb = new Arbol();
			Ng_Arbol nga = new Ng_Arbol();
			
			
			
			//fam.setArbolID(Integer.parseInt(request.getParameter("ArbolID")));
			arb.setNombrecientifico(request.getParameter("txtNombreCi"));
			arb.setNombrecomun(request.getParameter("txtNombreC"));
			arb.setDescripcion(request.getParameter("txaDescrip"));
			//arb.setDistribucionID(Integer.parseInt(request.getParameter("cbxDis")));
			arb.setFamiliaID(Integer.parseInt(request.getParameter("cbxFamilia")));
			arb.setGeneroID(Integer.parseInt(request.getParameter("cbxGenero")));
			arb.setFloracionID(Integer.parseInt(request.getParameter("cbxFlora")));
			
		
		
		switch (opc){
		case 1:{
			
		        try {
		        	// Para Guardar la Fecha y Hora de creación.
		        	
		        	Date fechaSistema = new Date();
			        arb.setFechaCreacion(new java.sql.Timestamp(fechaSistema.getTime()));
			        System.out.println("fam.getFechaCreacion(): "+arb.getFechaCreacion());
		        	
			       
			        if(nga.existeNombreC(arb.getNombrecomun()) || (nga.existeNombreCi(arb.getNombrecientifico())) ) {
			        	response.sendRedirect("NuevoArbol.jsp?msj=existe");
			        }
			        else {
			        	if(dta.guardarArbol(arb)) {
				        	response.sendRedirect("tblArbol.jsp?msj=1");
				        }
				        else {
				        	response.sendRedirect("NuevoArbol.jsp?msj=2");
				        }
			        }
			        
			        
			        
			        
			        	
		        }
		        catch(Exception e) {
		        	System.out.println("Sl_GestionArbol, el error es: " + e.getMessage());
					e.printStackTrace();
		        }
		        
				break;
			}
		
		case 2:{
				
			try {
		    	arb.setArbolId(Integer.parseInt(request.getParameter("idArbol")));
		    	
	        	//PARA GUARDAR LA FECHA Y HORA DE MODIFICACION
		        Date fechaSistema = new Date();
		        arb.setFechaModificacion(new java.sql.Timestamp(fechaSistema.getTime()));
		        System.out.println("arb.getFechaModificacion(): "+ arb.getFechaModificacion());
		        
		        if(nga.existenNombres(arb.getArbolId(),arb.getNombrecomun(),arb.getNombrecientifico())) {
		        	response.sendRedirect("EditarArboles.jsp?arbolID="+arb.getArbolId()+"&msj=existe");
		        }
		        else {
		        	if(dta.modificarArbol(arb)) {
			        	response.sendRedirect("tblArbol.jsp?msj=3");
			        }
			        else {
			        	response.sendRedirect("tblArbol.jsp?msj=4");
			        }
		        }
		       
		      
		    
		    }
		    catch(Exception e) {
		    	System.out.println("Sl_GestionArbol, el error es: " + e.getMessage());
				e.printStackTrace();
		    	
		    }
		      break;
				
			}
		
		default:
			response.sendRedirect("tblArbol.jsp?msj=5");	
			break;
	}
		
	}

}
