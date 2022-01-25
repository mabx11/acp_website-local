package servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.Dt_ArbolDistribucion;
import entidades.ArbolDistribucion;
import negocio.Ng_DistribucionArbol;

/**
 * Servlet implementation class Sl_GestionDistribucionArbol
 */
@WebServlet("/Sl_GestionDistribucionArbol")

public class Sl_GestionDistribucionArbol extends HttpServlet {
	
private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sl_GestionDistribucionArbol() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int Arbol_DistribucionId =0;
		Arbol_DistribucionId = Integer.parseInt(request.getParameter("Arbol_DistribucionId"));
		Dt_ArbolDistribucion dtd = new Dt_ArbolDistribucion();
		
		if(dtd.eliminarArbolDistribucion(Arbol_DistribucionId)) {
        	response.sendRedirect("tblArbolDistribucion.jsp?msj=5");
        }
        else {
        	response.sendRedirect("tblArbolDistribucion.jsp?msj=6");
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
			Dt_ArbolDistribucion dtd = new Dt_ArbolDistribucion();
			ArbolDistribucion dis = new ArbolDistribucion();
			Ng_DistribucionArbol ngda = new Ng_DistribucionArbol();
			
			dis.setArbolId(Integer.parseInt(request.getParameter("cbxArbol")));
			dis.setDistribucionId(Integer.parseInt(request.getParameter("cbxDistribucion")));
			
		
		
		switch (opc){
		case 1:{
			
		        try {
		        	
		        	if(ngda.existeDistribucionArbol(dis.getArbolId(), dis.getDistribucionId())){
		        			response.sendRedirect("NuevoArbolDistribucion.jsp?msj=existe");
		        	}
		        	else {

				        if(dtd.guardarArbolDistribucion(dis)) {
				        	response.sendRedirect("tblArbolDistribucion.jsp?msj=1");
				        }
				        else {
				        	response.sendRedirect("tblArbolDistribucion.jsp?msj=2");
				        }
		        		
		        	}
			        	
		        }
		        catch(Exception e) {
		        	System.out.println("Sl_GestionDistribucionArbol, el error es: " + e.getMessage());
					e.printStackTrace();
		        }
		        
				break;
			}
		
		case 2:{
			
			dis.setArbol_DistribucionId(Integer.parseInt(request.getParameter("Arbol_DistribucionId")));
				
			try {
				if(ngda.existeDistribucionArbol(dis.getArbolId(), dis.getDistribucionId())){
        			response.sendRedirect("NuevoArbolDistribucion.jsp?msj=existe");
				}
				else {

					if(dtd.modificarArbolDistribucion(dis)) {
						response.sendRedirect("tblArbolDistribucion.jsp?msj=3");
					}
					else {
						response.sendRedirect("tblArbolDistribucion.jsp?msj=4");
					}
				}
	        }
	        catch(Exception e) {
	        	System.out.println("Sl_GestionDistribucionArbol, el error es: " + e.getMessage());
				e.printStackTrace();
	        }
				break;
				
			}
		
		default:
			response.sendRedirect("tblArbolDistribucion.jsp?msj=5");	
			break;
	}
		
		
		
	}

}
