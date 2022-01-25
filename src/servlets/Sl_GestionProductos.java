package servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.Dt_Productos;
import datos.Dt_TipoProd;
import entidades.CatProductos;
import negocio.Ng_Productos;
import negocio.Ng_TipoProd;
import datos.Dt_enviarEmail;

/**
 * Servlet implementation class Sl_GestionArbol
 */
@WebServlet("/Sl_GestionProductos")
public class Sl_GestionProductos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sl_GestionProductos() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		int productoID =0;
		productoID = Integer.parseInt(request.getParameter("ProductoID"));
		Dt_Productos dtp = new Dt_Productos();
		
		if(dtp.eliminarProducto(productoID)) {
        	response.sendRedirect("tblProductos.jsp?msj=5");
        }
        else {
        	response.sendRedirect("tblProductos.jsp?msj=6");
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
			Dt_Productos dtp = new Dt_Productos();
			CatProductos prod = new CatProductos();
			Ng_Productos ngp = new Ng_Productos();
			Dt_enviarEmail dtem = new Dt_enviarEmail();
			
			var name ="";
			var subject ="";
			var email ="";
			var descripcion ="";
			
			//fam.setArbolID(Integer.parseInt(request.getParameter("ArbolID")));
			prod.setNombre(request.getParameter("txtNombre"));
			prod.setDisponibilidad(request.getParameter("selDisp"));
			prod.setDescripcion(request.getParameter("txaDescripcion"));
			//arb.setDistribucionID(Integer.parseInt(request.getParameter("cbxDis")));
			
			
		
		
		switch (opc){
		case 1:{
			
		        try {
		        	// Para Guardar la Fecha y Hora de creación.
		        	prod.setTipoproductoid(Integer.parseInt(request.getParameter("cbxTipoProd")));
		        	Date fechaSistema = new Date();
			        prod.setFechaCreacion(new java.sql.Timestamp(fechaSistema.getTime()));
			        System.out.println("fam.getFechaCreacion(): "+prod.getFechaCreacion());
		        	
			       
			        if(ngp.existeProducto(prod.getNombre()))  {
			        	response.sendRedirect("NuevoProducto.jsp?msj=existe");
			        }
			        else {
			        	if(dtp.guardarProducto(prod)) {
				        	response.sendRedirect("tblProductos.jsp?msj=1");
				        }
				        else {
				        	response.sendRedirect("NuevoProducto.jsp?msj=2");
				        }
			        }
			        
			        
			        
			        
			        	
		        }
		        catch(Exception e) {
		        	System.out.println("Sl_GestionProductos, el error es: " + e.getMessage());
					e.printStackTrace();
		        }
		        
				break;
			}
		
		case 2:{
				
			try {
		    	prod.setCatalogodeproductosid(Integer.parseInt(request.getParameter("ProductoID")));
		    	prod.setTipoproductoid(Integer.parseInt(request.getParameter("cbxTipoProd")));
	        	//PARA GUARDAR LA FECHA Y HORA DE MODIFICACION
		        Date fechaSistema = new Date();
		        prod.setFechaModificacion(new java.sql.Timestamp(fechaSistema.getTime()));
		        System.out.println("arb.getFechaModificacion(): "+ prod.getFechaModificacion());
		        
		        if(ngp.existeProductoA(prod.getCatalogodeproductosid(), prod.getNombre())) {
		        	response.sendRedirect("EditarProducto.jsp?ProductoID="+prod.getCatalogodeproductosid()+"&msj=existe");
		        }
		        else {
		        	if(dtp.modificarProducto(prod)) {
			        	response.sendRedirect("tblProductos.jsp?msj=3");
			        }
			        else {
			        	response.sendRedirect("tblProductos.jsp?msj=4");
			        }
		        }
		       
		      
		    
		    }
		    catch(Exception e) {
		    	System.out.println("Sl_GestionProductos, el error es: " + e.getMessage());
				e.printStackTrace();
		    	
		    }
		      break;
				
			}
		
		case 3:{
			
	        try {
	        	// Para Guardar la Fecha y Hora de creación.
	        	
	        	prod.setCatalogodeproductosid(Integer.parseInt(request.getParameter("ProductoID")));
	        	
	        	name = request.getParameter("txtNombre");
	        	subject = request.getParameter("txtAsunto");
	        	email = request.getParameter("txtCorreo");
	        	descripcion = request.getParameter("txtConsulta");
	        	
	        	if(dtem.autoEnviarCorreo(name, subject, email, descripcion)) {
		        	response.sendRedirect("vistaProducto.jsp?ProductoID="+prod.getCatalogodeproductosid()+"&msj=1");
		        }
		        else {
		        	response.sendRedirect("vistaProducto.jsp?ProductoID="+prod.getCatalogodeproductosid()+"&msj=2");
		        }
		        
		        
		        
		        
		        	
	        }
	        catch(Exception e) {
	        	System.out.println("Sl_GestionProductos, el error es: " + e.getMessage());
				e.printStackTrace();
	        }
	        
			break;
		}
		
		default:
			response.sendRedirect("tblProductos.jsp?msj=5");	
			break;
	}
		
	}

}
