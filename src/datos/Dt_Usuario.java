package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import entidades.Usuario;
import vistas.VW_RolUsuario;

public class Dt_Usuario {
	
	//Atributos
	
		PoolConexion pc = PoolConexion.getInstance(); 
		Connection c = null;
		private ResultSet rsUsuario = null;
		private ResultSet rs = null;
		private PreparedStatement ps = null;
		
		
		// Metodo para llenar el RusultSet
		
		public void llenaRsUsuario(Connection c){
			try{
				ps = c.prepareStatement("SELECT usuarioid,apellidos,nombres,usuario,email,telefono,contrasenia,fechacreacion,fechamodificacion,fechaeliminacion,estado, cod_verificacion, key_encriptacion from usuario;", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rsUsuario = ps.executeQuery();
			}
			catch (Exception e){
				System.out.println("DATOS: ERROR EN LISTAR USUARIOS "+ e.getMessage());
				e.printStackTrace();
			}
		}
		
		//Metodo para visualizar usuarios registrados y activos
		
		public ArrayList<Usuario> listaUserActivos(){
			ArrayList<Usuario> listUser = new ArrayList<Usuario>();
			try{
				c = PoolConexion.getConnection();
				ps = c.prepareStatement("select * from public.\"usuario\" where estado <> 3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rs = ps.executeQuery();
				while(rs.next()){
					Usuario user = new Usuario();
					user.setUsuarioID(rs.getInt("usuarioID"));
					user.setNombres(rs.getString("nombres"));
					user.setApellidos(rs.getString("apellidos"));
					user.setUsuario(rs.getString("usuario"));
					user.setContrasenia(rs.getString("contrasenia"));
					user.setEmail(rs.getString("email"));
					user.setTelefono(rs.getInt("telefono"));
					user.setEstado(rs.getInt("estado"));
					user.setFechaCreacion(rs.getTimestamp("fechacreacion"));
					listUser.add(user);
				}
			}
			catch (Exception e){
				System.out.println("DATOS: ERROR EN LISTAR USUARIOS "+ e.getMessage());
				e.printStackTrace();
			}
			finally{
				try {
					if(rs != null){
						rs.close();
					}
					if(ps != null){
						ps.close();
					}
					if(c != null){
						PoolConexion.closeConnection(c);
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			return listUser;
		}
		
		// Metodo para visualizar los datos de un usuario específico
		public Usuario getUsuario(int usuarioID)
		{
			Usuario user = new Usuario();
			try
			{
				
				System.out.println("Hasta aca todo bien");
				
				c = PoolConexion.getConnection();
				ps = c.prepareStatement("select * from public.\"usuario\" where estado <> 3 and \"usuarioid\"=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				ps.setInt(1, usuarioID);
				rs = ps.executeQuery();
				System.out.println("Ya hizo el select");
				if(rs.next())
				{
					user.setUsuarioID(usuarioID);
					user.setUsuario(rs.getString("usuario"));
					user.setContrasenia(rs.getString("contrasenia"));
					user.setNombres(rs.getString("nombres"));
					user.setApellidos(rs.getString("apellidos"));
					user.setEmail(rs.getString("email"));
					user.setTelefono(rs.getInt("telefono"));
					user.setEstado(rs.getInt("estado"));
					System.out.println("Ya te deberia de aparecer wtf");
				}
			}
			catch (Exception e)
			{
				System.out.println("DATOS ERROR getNIMA(): "+ e.getMessage());
				e.printStackTrace();
			}
			finally
			{
				try {
					if(rs != null){
						rs.close();
					}
					if(ps != null){
						ps.close();
					}
					if(c != null){
						PoolConexion.closeConnection(c);
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			return user;
		}
		
		//Metodo para almacenar nuevo usuario
		public boolean guardarUser(Usuario user){
			boolean guardado = false;
			
			
			try{
				c = PoolConexion.getConnection();
				this.llenaRsUsuario(c);
				rsUsuario.moveToInsertRow();
//				rsUsuario.updateInt("UsuarioID", 2);
				rsUsuario.updateString("usuario", user.getUsuario());
				rsUsuario.updateString("contrasenia", user.getContrasenia());
				rsUsuario.updateString("nombres", user.getNombres());
				rsUsuario.updateString("apellidos", user.getApellidos());
				rsUsuario.updateString("email", user.getEmail());
				rsUsuario.updateTimestamp("fechacreacion", user.getFechaCreacion());
				rsUsuario.updateInt("telefono", user.getTelefono());
				//GUARDAMOS EL CODIGO DE VERIFICACION
				rsUsuario.updateString("cod_verificacion", user.getCod_verificacion());
				rsUsuario.updateString("key_encriptacion", user.getKey_encriptacion());
				rsUsuario.updateInt("estado", 0); //0 PORQUE EL USUARIO ES REGISTRADO PERO SU EMAIL AUN NO HA SIDO VERIFICADO
				rsUsuario.insertRow();
				rsUsuario.moveToCurrentRow();
				guardado = true;
			}
			catch (Exception e) {
				System.err.println("ERROR AL GUARDAR Usuario "+e.getMessage());
				e.printStackTrace();
			}
			finally{
				try {
					if(rsUsuario != null){
						rsUsuario.close();
					}
					if(c != null){
						PoolConexion.closeConnection(c);
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			return guardado;
		}
		
		// Metodo para obtener los datos de un usuario en proceso de recuperacion de pwd
		public Usuario getUserPwd(String userName, String userEmail){
			Usuario user = new Usuario();
			try{
				c = PoolConexion.getConnection();
				ps = c.prepareStatement("select * from public.usuario where estado <> 3 and email=? and usuario=? ", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				ps.setString(1, userEmail);
				ps.setString(2, userName);
				rs = ps.executeQuery();
				if(rs.next()){
					user.setUsuarioID(rs.getInt("usuarioid"));
					user.setUsuario(rs.getString("usuario"));
					System.out.println("El usuario es: "+userName);
					user.setContrasenia(rs.getString("contrasenia"));
					user.setEmail(rs.getString("email"));
					user.setNombres(rs.getString("nombres"));
					user.setApellidos(rs.getString("apellidos"));
					user.setCod_verificacion(rs.getString("cod_verificacion"));
					user.setKey_encriptacion(rs.getString("key_encriptacion"));
					user.setEstado(rs.getInt("estado"));
				}
				else {
					user.setUsuarioID(0);
				}
			}
			catch (Exception e){
				System.out.println("DATOS ERROR getUserPwd(): "+ e.getMessage());
				e.printStackTrace();
			}
			finally{
				try {
					if(rs != null){
						rs.close();
					}
					if(ps != null){
						ps.close();
					}
					if(c != null){
						PoolConexion.closeConnection(c);
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			return user;
		}
		
		// Metodo para actualizar la contraseña del usuario
		public boolean updatePwd(Usuario user, String newPwd)
		{
			boolean modificado=false;	
			try{
				c = PoolConexion.getConnection();
				/////// ENCRIPTACION DE LA PWD //////////
				Encrypt enc = new Encrypt();
				String key = "";
				String pwdEncrypt = "";
				key=enc.generarLLave();
				pwdEncrypt = enc.getAES(newPwd,key);
				user.setContrasenia(pwdEncrypt);
				user.setKey_encriptacion(key);
				/////////////////////////////////////////
				this.llenaRsUsuario(c);
				rsUsuario.beforeFirst();
				while (rsUsuario.next()){
					if(rsUsuario.getInt(1)==user.getUsuarioID()){
						rsUsuario.updateString("contrasenia", user.getContrasenia());
						rsUsuario.updateString("key_encriptacion", user.getKey_encriptacion());
						rsUsuario.updateTimestamp("fechaModificacion", user.getFechaModificacion());
						rsUsuario.updateInt("estado", 2);
						rsUsuario.updateRow();
						modificado=true;
						break;
					}
				}
			}
			catch (Exception e){
				System.err.println("ERROR AL ACTUALIZAR USUARIO "+e.getMessage());
				e.printStackTrace();
			}
			finally{
				try {
					if(rsUsuario != null){
						rsUsuario.close();
					}
					if(c != null){
						PoolConexion.closeConnection(c);
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return modificado;
		}
		
		// Metodo para actualizar la contraseña del usuario
				public boolean modificarPwd(int usuarioid, String newPwd)
				{
					boolean modificado=false;	
					try{
						c = PoolConexion.getConnection();
						/////// ENCRIPTACION DE LA PWD //////////
						Encrypt enc = new Encrypt();
						String key = "";
						String pwdEncrypt = "";
						Date fechaSistema = new Date();
						key=enc.generarLLave();
						pwdEncrypt = enc.getAES(newPwd,key);
						
						/////////////////////////////////////////
						this.llenaRsUsuario(c);
						rsUsuario.beforeFirst();
						while (rsUsuario.next()){
							if(rsUsuario.getInt(1)==usuarioid){
								rsUsuario.updateString("contrasenia", pwdEncrypt);
								rsUsuario.updateString("key_encriptacion", key);
								rsUsuario.updateTimestamp("fechaModificacion", new java.sql.Timestamp(fechaSistema.getTime()));
								rsUsuario.updateInt("estado", 2);
								rsUsuario.updateRow();
								modificado=true;
								break;
							}
						}
					}
					catch (Exception e){
						System.err.println("ERROR AL ACTUALIZAR USUARIO "+e.getMessage());
						e.printStackTrace();
					}
					finally{
						try {
							if(rsUsuario != null){
								rsUsuario.close();
							}
							if(c != null){
								PoolConexion.closeConnection(c);
							}
							
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
					return modificado;
				}
		
		// Metodo para eliminar usuario
		
		
		// Metodo para modificar usuarios
		public boolean modificarUser(Usuario user)
		{
			System.out.println("Ya entro al metodo");
			boolean modificado=false;	
			try
			{
				c = PoolConexion.getConnection();
				this.llenaRsUsuario(c);
				rsUsuario.beforeFirst();
				while (rsUsuario.next())
				{
					System.out.println("Ya entro al while");
					//System.out.println("este es el valor del while " + rsUsuario.getInt(1) + " y este es el valor del rol a editar " + user.getUsuarioID()) ;
					if(rsUsuario.getInt(1)==user.getUsuarioID())
					{
						System.out.println("Ya entro al if");
						rsUsuario.updateString("usuario", user.getUsuario());
						
						if(user.getContrasenia().equals("") == false) {
							rsUsuario.updateString("contrasenia", user.getContrasenia());
						}
						
						rsUsuario.updateString("nombres", user.getNombres());
						rsUsuario.updateString("apellidos", user.getApellidos());
						rsUsuario.updateString("email", user.getEmail());
						rsUsuario.updateTimestamp("fechaModificacion", user.getFechaModificacion());
						rsUsuario.updateInt("telefono", user.getTelefono());
						rsUsuario.updateString("key_encriptacion", user.getKey_encriptacion());
						rsUsuario.updateInt("estado", 2);
						rsUsuario.updateRow();
						modificado=true;
						System.out.println("Se supone que ya");
						break;
					}
				}
			}
			catch (Exception e)
			{
				System.err.println("ERROR AL ACTUALIZAR USUARIO "+e.getMessage());
				e.printStackTrace();
			}
			finally
			{
				try {
					if(rsUsuario != null){
						rsUsuario.close();
					}
					if(c != null){
						PoolConexion.closeConnection(c);
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return modificado;
		}
		
		// Metodo para modificar un propio usuario
				public boolean modificarSelfUser(Usuario user)
				{
					System.out.println("Ya entro al metodo Modificar Self User");
					boolean modificado=false;	
					try
					{
						c = PoolConexion.getConnection();
						this.llenaRsUsuario(c);
						rsUsuario.beforeFirst();
						while (rsUsuario.next())
						{
							System.out.println("Ya entro al while");
							//System.out.println("este es el valor del while " + rsUsuario.getInt(1) + " y este es el valor del rol a editar " + user.getUsuarioID()) ;
							if(rsUsuario.getInt(1)==user.getUsuarioID())
							{
								System.out.println("Ya entro al if");
								rsUsuario.updateString("usuario", user.getUsuario());
								//rsUsuario.updateString("contrasenia", user.getContrasenia());
								rsUsuario.updateString("nombres", user.getNombres());
								rsUsuario.updateString("apellidos", user.getApellidos());
								rsUsuario.updateString("email", user.getEmail());
								rsUsuario.updateTimestamp("fechaModificacion", user.getFechaModificacion());
								rsUsuario.updateInt("telefono", user.getTelefono());
								rsUsuario.updateInt("estado", 2);
								rsUsuario.updateRow();
								modificado=true;
								System.out.println("Se supone que ya");
								break;
							}
						}
					}
					catch (Exception e)
					{
						System.err.println("ERROR AL ACTUALIZAR USUARIO "+e.getMessage());
						e.printStackTrace();
					}
					finally
					{
						try {
							if(rsUsuario != null){
								rsUsuario.close();
							}
							if(c != null){
								PoolConexion.closeConnection(c);
							}
							
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
					return modificado;
				}
		
		// Metodo para eliminar usuario
		public boolean eliminarUser(int usuarioID)
		{
			boolean eliminado=false;	
			try
			{
				c = PoolConexion.getConnection();
				this.llenaRsUsuario(c);
				rsUsuario.beforeFirst();
				Date fechaSistema = new Date();
				while (rsUsuario.next())
				{
					if(rsUsuario.getInt(1)==usuarioID)
					{
						rsUsuario.updateTimestamp("FechaEliminacion", new java.sql.Timestamp(fechaSistema.getTime()));
						rsUsuario.updateInt("estado", 3);
						rsUsuario.updateRow();
						eliminado=true;
						break;
					}
				}
			}
			catch (Exception e)
			{
				System.err.println("ERROR AL ACTUALIZAR USUARIO "+e.getMessage());
				e.printStackTrace();
			}
			finally
			{
				try {
					if(rsUsuario != null){
						rsUsuario.close();
					}
					if(c != null){
						PoolConexion.closeConnection(c);
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return eliminado;
		}
		
		// METODO PARA VERIFICAR USUARIO Y PWD //
		public boolean dtverificarLogin(String login, String clave, int rol) {
			boolean existe = false;
			String SQL = ("SELECT * FROM public.vw_rolusuario WHERE \"Usuario\"=? AND contrasenia=? AND rolid=? AND estado<>0");
			try {
			    /////// DESENCRIPTACION DE LA PWD //////////
				VW_RolUsuario vwru = new VW_RolUsuario();
				Encrypt enc = new Encrypt();
				vwru = this.dtGetRU(login);
				String pwdDecrypt = "";
				String pwdEncrypt = "";
				
				pwdEncrypt = vwru.getContrasenia();
				pwdDecrypt = enc.getAESDecrypt(pwdEncrypt,vwru.getKey_encriptacion());
				
				/*if(pwdDecrypt == null) {
					pwdDecrypt = pwdEncrypt;
				}*/
				
				c = PoolConexion.getConnection();
				ps = c.prepareStatement(SQL);
				ps.setString(1, login);
				if(clave.equals(pwdDecrypt)){
					ps.setString(2, pwdEncrypt);
				}
				else {
					ps.setString(2, clave);
				}
				ps.setInt(3, rol);
				rs = ps.executeQuery();
				if(rs.next()){
					existe=true;
				}
			} catch (Exception e) {
				System.out.println("DATOS: ERROR AL VERIFICAR EL LOGIN " + e.getMessage());
				e.printStackTrace();
			} finally {
				try {
					if (rs != null) {
						rs.close();
					}
					if (ps != null) {
						ps.close();
					}
					if (c != null) {
						PoolConexion.closeConnection(c);
					}

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			return existe;
		}
		
		// Metodo para actualizar el estado del Usuario
				public boolean updEstado(String login)
				{
					boolean actualizado = false;
					
					try
					{
						c = PoolConexion.getConnection();
						this.llenaRsUsuario(c);	
						rsUsuario.beforeFirst();
						while(rsUsuario.next())
						{
							if(rsUsuario.getString("usuario").equals(login))
							{
								rsUsuario.updateInt("estado", 1);
								rsUsuario.updateRow();
								actualizado = true;
								break;
							}
						}
					}
					catch (Exception e) 
					{
						System.err.println("ERROR AL ACTUALIZAR EL ESTADO DE USUARIO "+e.getMessage());
						e.printStackTrace();
					}
					finally
					{
						try {
							if(rsUsuario != null){
								rsUsuario.close();
							}
							if(c != null){
								PoolConexion.closeConnection(c);
							}
							
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
					
					return actualizado;
				}
			
			
				// METODO PARA VERIFICAR USUARIO, PWD, ROL Y CODIGO DE VERIFICACION //
				public boolean dtverificarLogin2(String login, String clave, int rol, String codigo)
				{
					boolean existe=false;
					String SQL = ("SELECT * FROM public.vw_rolusuario WHERE \"Usuario\"=? AND contrasenia=? AND rolid=? AND cod_verificacion=?");
					try{
						/////// DESENCRIPTACION DE LA PWD //////////
						VW_RolUsuario vwru = new VW_RolUsuario();
						Encrypt enc = new Encrypt();
						vwru = this.dtGetRU(login);
						String pwdDecrypt = "";
						String pwdEncrypt = "";
						
						pwdEncrypt = vwru.getContrasenia();
						pwdDecrypt = enc.getAESDecrypt(pwdEncrypt,vwru.getKey_encriptacion());
						/////////////////////////////////////////
						
						/*if(pwdDecrypt == null) {
							pwdDecrypt = pwdEncrypt;
						}*/
						
						c = PoolConexion.getConnection();
						ps = c.prepareStatement(SQL);
						ps.setString(1, login);
						if(clave.equals(pwdDecrypt)){
							ps.setString(2, pwdEncrypt);
						}
						else {
							ps.setString(2, clave);
						}

						ps.setInt(3, rol);
						ps.setString(4, codigo);
						rs = ps.executeQuery();
						if(rs.next()){
							existe=true;
							updEstado(login);
						}
					}
					catch (Exception e){
						System.out.println("DATOS: ERROR AL VERIFICAR EL LOGIN "+ e.getMessage());
						e.printStackTrace();
					}
					finally {
						try {
							if(rs != null){
								rs.close();
							}
							if(ps != null){
								ps.close();
							}
							if(c != null){
								PoolConexion.closeConnection(c);
							}
							
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				
					return existe;
				}

		// METODO PARA OBTENER UN OBJETO DE TIPO Vw_RolUser //
		public VW_RolUsuario dtGetRU(String login) {
			VW_RolUsuario vwru = new VW_RolUsuario();
			String SQL = ("SELECT * FROM public.vw_rolusuario where \"Usuario\"=?");
			try {
				c = PoolConexion.getConnection();
				ps = c.prepareStatement(SQL);
				ps.setString(1, login);
				rs = ps.executeQuery();
				if (rs.next()) {
					vwru.setID(rs.getInt("iD"));
					vwru.setUsuarioid(rs.getInt("usuarioid"));
					vwru.setRolid(rs.getInt("rolid"));
					vwru.setUsuario(rs.getString("usuario"));
					vwru.setRol(rs.getString("rol"));
					vwru.setContrasenia(rs.getString("contrasenia"));
					vwru.setNombres(rs.getString("nombres"));
					vwru.setApellidos(rs.getString("apellidos"));
					vwru.setKey_encriptacion(rs.getString("key_encriptacion"));
					//vwru.setCod_verificacion(rs.getString("cod_verificacion"));
					
				}
			} catch (Exception e){
				System.out.println("DATOS: ERROR EN dtGetRU "+ e.getMessage());
				e.printStackTrace();
			} finally {
				try {
					if (rs != null) {
						rs.close();
					}
					if (ps != null) {
						ps.close();
					}
					if (c != null) {
						PoolConexion.closeConnection(c);
					}

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			return vwru;
		}
		
		//METODO PARA GENERAR UN CODIGO DE VERIFICACION //

		private final static String ALPHA_NUMERIC_STRING = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		public static String randomAlphaNumeric(int count) 
		{
			StringBuilder builder = new StringBuilder();
			while (count-- != 0) 
			{
				int character = (int)(Math.random()*ALPHA_NUMERIC_STRING.length());
				builder.append(ALPHA_NUMERIC_STRING.charAt(character));
			}
			return builder.toString();
		}

		
		

}
