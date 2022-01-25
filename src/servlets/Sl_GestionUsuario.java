package servlets;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.Dt_Usuario;
import datos.Dt_enviarEmail;
import datos.Encrypt;
import entidades.Usuario;
import vistas.VW_RolUsuario;
import negocio.Ng_Usuario;

/**
 * Servlet implementation class Sl_GestionUsuario
 */
@WebServlet("/Sl_GestionUsuario")

public class Sl_GestionUsuario  extends HttpServlet{

	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sl_GestionUsuario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		int usuarioID =0;
		usuarioID = Integer.parseInt(request.getParameter("usuarioID"));
		Dt_Usuario dtu = new Dt_Usuario();
		
		if(dtu.eliminarUser(usuarioID)) {
        	response.sendRedirect("tblUsuarios.jsp?msj=5");
        }
        else {
        	response.sendRedirect("tblUsuarios.jsp?msj=6");
        }
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		
		System.out.println("Entro a la consola");
		
		var newPwd = "";
		var oldPwd = "";
		var usuario = "";
		
		//obtenemos el valor de opcion
		int opc = 0;
		opc = Integer.parseInt(request.getParameter("opcion"));
				
		//CONSTRUIR EL OBJETO USUARIO
			Dt_Usuario dtu = new Dt_Usuario();
			Usuario user = new Usuario();
			Encrypt enc = new Encrypt();
			Ng_Usuario ngu = new Ng_Usuario();
			Dt_enviarEmail dtem = new Dt_enviarEmail();
			
			
			
			//user.setUsuarioID(Integer.parseInt(request.getParameter("usuarioID")));
			String key = "";
			String pwdEncrypt = "";
		    /////// ENCRIPTACION DE LA PWD //////////
			
			/////////////////////////////////////////
		
		switch (opc){
		case 1:{
			
		        try {
		        	//GENERAMOS EL CODIGO DE VERIFICACION Y LO ASIGNAMOS AL OBJETO
					user.setCod_verificacion(dtu.randomAlphaNumeric(10)); // 10 PORQUE ES LA CANTIDAD DE CARACTERES QUE SOPORTA LA BD
		        	
					user.setContrasenia(request.getParameter("txtPwd"));
					if(user.getContrasenia().equals("")==false) 
					{
					key=enc.generarLLave();
					pwdEncrypt = enc.getAES(user.getContrasenia(),key);
					user.setContrasenia(pwdEncrypt);
					user.setKey_encriptacion(key);
					}
		        	// Para Guardar la Fecha y Hora de creación.
		        	user.setNombres(request.getParameter("txtNombres"));
					user.setApellidos(request.getParameter("txtApellidos"));
					user.setUsuario(request.getParameter("txtUserName"));
					user.setEmail(request.getParameter("txtEmail"));
					//user.setContrasenia(request.getParameter(""));
					user.setTelefono(Integer.parseInt(request.getParameter("txttel")));
		        	
		        	Date fechaSistema = new Date();
			        user.setFechaCreacion(new java.sql.Timestamp(fechaSistema.getTime()));
			        System.out.println("user.getFechaCreacion(): "+user.getFechaCreacion());
		        	
			        if(ngu.existeUser(user.getUsuario())) {
			        	response.sendRedirect("NuevoUsuario.jsp?msj=existe");
			        }
			        else {
			        	if(dtu.guardarUser(user)) {
			        		if(dtem.enviarEmailVerificacion(user.getUsuario(), user.getContrasenia(), user.getEmail(), user.getCod_verificacion())) {
			        			response.sendRedirect("tblUsuarios.jsp?msj=1");
			        		}
				        	//response.sendRedirect("tblUsuarios.jsp?msj=1");
				        }
				        else {
				        	response.sendRedirect("tblUsuarios.jsp?msj=2");
				        }
			        }
			        	
		        }
		        catch(Exception e) {
		        	System.out.println("Sl_GestionUsuario, el error es: " + e.getMessage());
					e.printStackTrace();
		        }
		        
				break;
			}
		
		case 2:{
			
				try {
					
					
					user.setContrasenia(request.getParameter("txtPwd"));
					if(user.getContrasenia().equals("")==false) 
					{
					key=enc.generarLLave();
					pwdEncrypt = enc.getAES(user.getContrasenia(),key);
					user.setContrasenia(pwdEncrypt);
					user.setKey_encriptacion(key);
					}
					
					user.setNombres(request.getParameter("txtNombres"));
					user.setApellidos(request.getParameter("txtApellidos"));
					user.setUsuario(request.getParameter("txtUserName"));
					user.setEmail(request.getParameter("txtEmail"));
					//user.setContrasenia(pwdEncry);
					user.setTelefono(Integer.parseInt(request.getParameter("txttel")));
					
					user.setUsuarioID(Integer.parseInt(request.getParameter("usuarioid")));
					//PARA GUARDAR LA FECHA Y HORA DE MODIFICACION
					Date fechaSistema = new Date();
					user.setFechaModificacion(new java.sql.Timestamp(fechaSistema.getTime()));
					System.out.println("user.getFechaModificacion(): "+user.getFechaModificacion());
					
					if(ngu.existeUserA(user.getUsuarioID(), user.getUsuario())) {
			        	response.sendRedirect("EditarUsuario.jsp?UsuarioID="+user.getUsuarioID()+"&msj=existe");
			        }
					else {
						if(dtu.modificarUser(user)) {
				        	response.sendRedirect("tblUsuarios.jsp?msj=3");
				        	
				        }
				        else {
				        	response.sendRedirect("tblUsuarios.jsp?msj=4");
				        }
					}
					
					
							        	
		        
		        
	        	
	        }
	        catch(Exception e) {
	        	System.out.println("Sl_GestionUsuario, el error es: " + e.getMessage());
				e.printStackTrace();
	        }
				break;
				
			}
		
		case 3:{
			
			try {
				
				user.setNombres(request.getParameter("txtNombres"));
				user.setApellidos(request.getParameter("txtApellidos"));
				user.setUsuario(request.getParameter("txtUserName"));
				user.setEmail(request.getParameter("txtEmail"));
				//user.setContrasenia(request.getParameter("txtPwd"));
				user.setTelefono(Integer.parseInt(request.getParameter("txttel")));
				
				user.setUsuarioID(Integer.parseInt(request.getParameter("userid")));
				//PARA GUARDAR LA FECHA Y HORA DE MODIFICACION
				Date fechaSistema = new Date();
				user.setFechaModificacion(new java.sql.Timestamp(fechaSistema.getTime()));
				System.out.println("user.getFechaModificacion(): "+user.getFechaModificacion());
				
				if(ngu.existeUserA(user.getUsuarioID(), user.getUsuario())) {
		        	response.sendRedirect("EditSelfUser.jsp?UsuarioID="+user.getUsuarioID()+"&msj=existe");
		        }
				else {
					if(dtu.modificarSelfUser(user)) {
			        	response.sendRedirect("EditSelfUser.jsp?UsuarioID="+user.getUsuarioID()+"&msj=1");
			        	
			        }
			        else {
			        	response.sendRedirect("EditSelfUser.jsp?UsuarioID="+user.getUsuarioID()+"&msj=2");
			        }
				}
				
				
						        	
	        
	        
        	
        }
        catch(Exception e) {
        	System.out.println("Sl_GestionUsuario A, el error es: " + e.getMessage());
			e.printStackTrace();
        }
			break;
			
		}
		
		case 4:{
			
			try {
				
				newPwd = request.getParameter("Pwd");
				oldPwd = request.getParameter("PwdO");
				usuario = request.getParameter("usuario");
				
				VW_RolUsuario vru = new VW_RolUsuario();
				
				vru = dtu.dtGetRU(usuario);
				
				var encryptPwd = "";
				var desencryptPwd = "";
				
				encryptPwd = vru.getContrasenia();
				desencryptPwd = enc.getAESDecrypt(encryptPwd, vru.getKey_encriptacion());
								
				//user.setUsuarioID(Integer.parseInt(request.getParameter("usuarioid")));
				//PARA GUARDAR LA FECHA Y HORA DE MODIFICACION
				Date fechaSistema = new Date();
				user.setFechaModificacion(new java.sql.Timestamp(fechaSistema.getTime()));
				System.out.println("user.getFechaModificacion(): "+user.getFechaModificacion());
				
				
				if(oldPwd.equals(desencryptPwd)) {
					if(dtu.modificarPwd(vru.getUsuarioid(), newPwd)) {
						
						response.sendRedirect("editPwd.jsp?msj=1");
						
					}else {
						
						response.sendRedirect("editPwd.jsp?msj=2");
						
					}
					
				}else
				{
					response.sendRedirect("editPwd.jsp?msj=3");
				}
				
				
						        	
        }
        catch(Exception e) {
        	System.out.println("Sl_GestionUsuario, el error es: " + e.getMessage());
			e.printStackTrace();
        }
			break;
			
		}
		
		default:
			response.sendRedirect("tblUsuarios.jsp?msj=7");	
			break;
	}
		
		
		
	}
	
}
