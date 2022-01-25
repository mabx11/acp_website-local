package servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.Dt_RolUsuario;
import entidades.RolUsuario;
import negocio.Ng_RolUsuario;

/**
 * Servlet implementation class Sl_GestionRolUser
 */
@WebServlet("/Sl_GestionRolUser")
public class Sl_GestionRolUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sl_GestionRolUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		int rol_usuarioID =0;
		rol_usuarioID = Integer.parseInt(request.getParameter("rol_usuarioID"));
		Dt_RolUsuario dtru = new Dt_RolUsuario(); 
		
		if(dtru.eliminaRolUser(rol_usuarioID)) {
        	response.sendRedirect("tblRolUser.jsp?msj=5");
        }
        else {
        	response.sendRedirect("tblRolUser.jsp?msj=6");
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
				
		//CONSTRUIR EL OBJETO ROL-USER
		RolUsuario ru = new RolUsuario();		
		ru.setUsuarioID(Integer.parseInt(request.getParameter("cbxUser")));
		ru.setRolId(Integer.parseInt(request.getParameter("cbxRol")));
		Dt_RolUsuario dtru = new Dt_RolUsuario(); 
		Ng_RolUsuario ngru = new Ng_RolUsuario();
		
		
		switch (opc){
		case 1:{
			
		        try {
		        	// Para Guardar la Fecha y Hora de creación.
		        	
		        	Date fechaSistema = new Date();
			        ru.setFechaCreacion(new java.sql.Timestamp(fechaSistema.getTime()));
			        System.out.println("user.getFechaCreacion(): "+ru.getFechaCreacion());
		        	
			        if(ngru.existeRolUser(ru.getRolId(), ru.getUsuarioID())) {
			        	response.sendRedirect("NuevoRolUser.jsp?msj=existe");
			        }else {
			        	if(dtru.guardarRolUser(ru)) {
				        	response.sendRedirect("tblRolUser.jsp?msj=1");
				        }
				        else {
				        	response.sendRedirect("tblRolUser.jsp?msj=2");
				        }
			        }
			        	
		        }
		        catch(Exception e) {
		        	System.out.println("Sl_GestionRolUser, el error es: " + e.getMessage());
					e.printStackTrace();
		        }
		        
				break;
			}
		
		case 2:{
				
			try {
				ru.setRol_usuarioID(Integer.parseInt(request.getParameter("ID")));
				//PARA GUARDAR LA FECHA Y HORA DE MODIFICACION
				Date fechaSistema = new Date();
				ru.setFechaModificacion(new java.sql.Timestamp(fechaSistema.getTime()));
				System.out.println("user.getFechaModificacion(): "+ru.getFechaModificacion());

	        	
		        if(ngru.existeRolUserA(ru.getRol_usuarioID(), ru.getRolId(), ru.getUsuarioID())) {
		        	response.sendRedirect("editRolUsuario.jsp?rol_usuarioID="+ru.getRol_usuarioID()+"&msj=existe");
		        }else {
		        	if(dtru.modificarRolUser(ru)) {
			        	response.sendRedirect("tblRolUser.jsp?msj=3");
			        }
			        else {
			        	response.sendRedirect("tblRolUser.jsp?msj=4");
			        }
		        }
		        	
	        	
	        }
	        catch(Exception e) {
	        	System.out.println("Sl_GestionRolUser, el error es: " + e.getMessage());
				e.printStackTrace();
	        }
				break;
				
			}
		
		default:
			response.sendRedirect("tblRolUser.jsp?msj=7");	
			break;
	}
		
		
		
	}

}
