package servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.Dt_RolOpciones;
import entidades.RolOpciones;
import negocio.Ng_RolOpc;

/**
 * Servlet implementation class Sl_GestionRolOpc
 */
@WebServlet("/Sl_GestionRolOpc")
public class Sl_GestionRolOpc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sl_GestionRolOpc() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		int rol_opcionesID =0;
		rol_opcionesID = Integer.parseInt(request.getParameter("rol_opcionesID"));
		Dt_RolOpciones dtro = new Dt_RolOpciones(); 
		
		if(dtro.eliminaRolOpc(rol_opcionesID)) {
        	response.sendRedirect("tblRolOpc.jsp?msj=5");
        }
        else {
        	response.sendRedirect("tblRolOpc.jsp?msj=6");
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
				
		//CONSTRUIR EL OBJETO ROL-OPC
		RolOpciones ro = new RolOpciones();		
		ro.setOpcionesID(Integer.parseInt(request.getParameter("cbxOpc")));
		ro.setRolId(Integer.parseInt(request.getParameter("cbxRol")));
		Ng_RolOpc ngro = new Ng_RolOpc();
		Dt_RolOpciones dtro = new Dt_RolOpciones(); 
		
		
		switch (opc){
		case 1:{
			
		        try {
		        	// Para Guardar la Fecha y Hora de creación.
		        	
		        	Date fechaSistema = new Date();
			        ro.setFechaCreacion(new java.sql.Timestamp(fechaSistema.getTime()));
			        System.out.println("ro.getFechaCreacion(): "+ro.getFechaCreacion());
		        	
			        if(ngro.existeRolOpc(ro.getOpcionesID(), ro.getRolId())){
			        	response.sendRedirect("NuevoRolOpc.jsp?msj=existe");
			        }else{
			        	if(dtro.guardarRolOpc(ro)) {
				        	response.sendRedirect("tblRolOpc.jsp?msj=1");
				        }
				        else {
				        	response.sendRedirect("tblRolOpc.jsp?msj=2");
				        }
			        }
			        
			        	
		        }
		        catch(Exception e) {
		        	System.out.println("Sl_GestionRolOpc, el error es: " + e.getMessage());
					e.printStackTrace();
		        }
		        
				break;
			}
		
		case 2:{
				
			try {
				ro.setRol_opcionesID(Integer.parseInt(request.getParameter("ID")));
				//PARA GUARDAR LA FECHA Y HORA DE MODIFICACION
				Date fechaSistema = new Date();
				ro.setFechaModificacion(new java.sql.Timestamp(fechaSistema.getTime()));
				System.out.println("ro.getFechaModificacion(): "+ro.getFechaModificacion());

		        if(ngro.existeRolOpcA(ro.getRol_opcionesID(), ro.getOpcionesID(), ro.getRolId())) {
		        	response.sendRedirect("editRolOpc.jsp?rol_opcionesID="+ro.getRol_opcionesID()+"&msj=existe");
		        }else {
		        	if(dtro.modificarRolOpc(ro)) {
			        	response.sendRedirect("tblRolOpc.jsp?msj=3");
			        }
			        else {
			        	response.sendRedirect("tblRolOpc.jsp?msj=4");
			        }
		        }

	        	
	        }
	        catch(Exception e) {
	        	System.out.println("Sl_GestionRolOpc, el error es: " + e.getMessage());
				e.printStackTrace();
	        }
				break;
				
			}
		
		default:
			response.sendRedirect("tblRolOpc.jsp?msj=7");	
			break;
	}
		
		
		
	}

}
