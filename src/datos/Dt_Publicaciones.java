package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import entidades.Publicaciones;

public class Dt_Publicaciones {
	
	//Atributos
	
		PoolConexion pc = PoolConexion.getInstance(); 
		Connection c = null;
		private ResultSet rsPubli = null;
		private ResultSet rs = null;
		private PreparedStatement ps = null;
		
		
		// Metodo para llenar el RusultSet
		
		public void llenaRsPubli(Connection c){
			try{
				ps = c.prepareStatement("SELECT * from publicaciones;", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rsPubli = ps.executeQuery();
			}
			catch (Exception e){
				System.out.println("DATOS: ERROR EN LISTAR PUBLICACIONES "+ e.getMessage());
				e.printStackTrace();
			}
		}
		
		//Metodo para visualizar usuarios registrados y activos
		
		public ArrayList<Publicaciones> listaPublisActivas(){
			ArrayList<Publicaciones> listPubli = new ArrayList<Publicaciones>();
			try{
				c = PoolConexion.getConnection();
				ps = c.prepareStatement("select * from public.\"publicaciones\" where estado <> 3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rs = ps.executeQuery();
				while(rs.next()){
					Publicaciones pub = new Publicaciones();
					pub.setPublicacionesid(rs.getInt("publicacionesid"));
					pub.setTitulo(rs.getString("titulo"));
					pub.setDescripcion(rs.getString("descripcion"));
					pub.setMultimedia(rs.getString("multimedia"));
					pub.setVideo(rs.getString("video"));
					pub.setImagen(rs.getString("imagen"));
					pub.setTipopubli(rs.getString("tipopubli"));
					pub.setEstado(rs.getInt("estado"));
					pub.setFechaCreacion(rs.getTimestamp("fechaCreacion"));
					listPubli.add(pub);
				}
			}
			catch (Exception e){
				System.out.println("DATOS: ERROR EN LISTAR Publicaciones "+ e.getMessage());
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
			return listPubli;
		}
		
		// Metodo para visualizar los datos de un usuario específico
		public Publicaciones getPubli(int publicacionesID)
		{
			Publicaciones pub = new Publicaciones();
			try
			{
				
				System.out.println("Hasta aca todo bien");
				
				c = PoolConexion.getConnection();
				ps = c.prepareStatement("select * from public.\"publicaciones\" where estado <> 3 and \"publicacionesid\"=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				ps.setInt(1, publicacionesID);
				rs = ps.executeQuery();
				System.out.println("Ya hizo el select");
				if(rs.next())
				{
					pub.setPublicacionesid(publicacionesID);
					pub.setTitulo(rs.getString("titulo"));
					pub.setDescripcion(rs.getString("descripcion"));
					pub.setMultimedia(rs.getString("multimedia"));
					pub.setVideo(rs.getString("video"));
					pub.setImagen(rs.getString("imagen"));
					pub.setTipopubli(rs.getString("tipopubli"));
					pub.setEstado(rs.getInt("estado"));
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
			
			return pub;
		}
		
		//Metodo para almacenar nuevo usuario
		public boolean guardarPubli(Publicaciones pub){
			boolean guardado = false;
			
			
			try{
				c = PoolConexion.getConnection();
				this.llenaRsPubli(c);
				rsPubli.moveToInsertRow();
//				rsUsuario.updateInt("UsuarioID", 2);
				rsPubli.updateString("titulo", pub.getTitulo());
				rsPubli.updateString("descripcion", pub.getDescripcion());
				//rsPubli.updateString("multimedia", pub.getMultimedia());
				rsPubli.updateString("video", pub.getVideo());
				//rsPubli.updateString("imagen", pub.getImagen());
				rsPubli.updateTimestamp("fechaCreacion", pub.getFechaCreacion());
				rsPubli.updateString("tipopubli", pub.getTipopubli());
				rsPubli.updateInt("Estado", 1);
				rsPubli.insertRow();
				rsPubli.moveToCurrentRow();
				guardado = true;
			}
			catch (Exception e) {
				System.err.println("ERROR AL GUARDAR PUBLICACION "+e.getMessage());
				e.printStackTrace();
			}
			finally{
				try {
					if(rsPubli != null){
						rsPubli.close();
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
		
		// Metodo para modificar usuarios
		public boolean modificarPubli(Publicaciones pub)
		{
			System.out.println("Ya entro al metodo");
			boolean modificado=false;	
			try
			{
				c = PoolConexion.getConnection();
				this.llenaRsPubli(c);
				rsPubli.beforeFirst();
				while (rsPubli.next())
				{
					System.out.println("Ya entro al while");
					//System.out.println("este es el valor del while " + rsUsuario.getInt(1) + " y este es el valor del rol a editar " + user.getUsuarioID()) ;
					if(rsPubli.getInt("publicacionesid")==pub.getPublicacionesid())
					{
						System.out.println("Ya entro al if");
						rsPubli.updateString("titulo", pub.getTitulo());
						rsPubli.updateString("descripcion", pub.getDescripcion());
						//rsPubli.updateString("multimedia", pub.getMultimedia());
						rsPubli.updateString("video", pub.getVideo());
						//rsPubli.updateString("imagen", pub.getImagen());
						rsPubli.updateTimestamp("fechaModificacion", pub.getFechaModificacion());
						rsPubli.updateString("tipopubli", pub.getTipopubli());
						rsPubli.updateInt("Estado", 2);
						rsPubli.updateRow();
						modificado=true;
						System.out.println("Se supone que ya");
						break;
					}
				}
			}
			catch (Exception e)
			{
				System.err.println("ERROR AL ACTUALIZAR PUBLICACION "+e.getMessage());
				e.printStackTrace();
			}
			finally
			{
				try {
					if(rsPubli != null){
						rsPubli.close();
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
		
		// Metodo para eliminar Publicaciones (Directamente de la BD)
		public boolean eliminaPubli(int publicacionesID) {
			boolean eliminado = false;
			try {
				c = PoolConexion.getConnection();
				this.llenaRsPubli(c);
				rsPubli.beforeFirst();
				while (rsPubli.next()) {
					if (rsPubli.getInt(7) == publicacionesID) {
						rsPubli.deleteRow();
						eliminado = true;
						break;
					}
				}
			} catch (Exception e) {
				System.err.println("ERROR AL ELIMINAR PUBLICACION " + e.getMessage());
				e.printStackTrace();
			} finally {
				try {
					if (rsPubli != null) {
						rsPubli.close();
					}
					if (c != null) {
						PoolConexion.closeConnection(c);
					}

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return eliminado;
		}
		
		// Metodo para guardar un documento en la Publicacion
				public boolean guardarDocumento(int publicacionesID, String urlDocument)
				{
					boolean actualizado = false;
					
					try
					{
						c = PoolConexion.getConnection();
						this.llenaRsPubli(c);	
						rsPubli.beforeFirst();
						while(rsPubli.next())
						{
							if(rsPubli.getInt("publicacionesid")==publicacionesID)
							{
								
								rsPubli.updateString("multimedia", urlDocument);
								rsPubli.updateInt("estado", 2);
								rsPubli.updateRow();
								actualizado = true;
								break;
							}
						}
					}
					catch (Exception e) 
					{
						System.err.println("ERROR AL GUARDAR DOCUMENTO "+e.getMessage());
						e.printStackTrace();
					}
					finally
					{
						try {
							if(rsPubli != null){
								rsPubli.close();
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
				
				// Metodo para guardar un documento en la Publicacion
				public boolean guardarFotoPubli(int publicacionesID, String urlFotoPub)
				{
					boolean actualizado = false;
					
					try
					{
						c = PoolConexion.getConnection();
						this.llenaRsPubli(c);	
						rsPubli.beforeFirst();
						while(rsPubli.next())
						{
							if(rsPubli.getInt("publicacionesid")==publicacionesID)
							{
								
								rsPubli.updateString("imagen", urlFotoPub);
								rsPubli.updateInt("estado", 2);
								rsPubli.updateRow();
								actualizado = true;
								break;
							}
						}
					}
					catch (Exception e) 
					{
						System.err.println("ERROR AL GUARDAR IMAGEN "+e.getMessage());
						e.printStackTrace();
					}
					finally
					{
						try {
							if(rsPubli != null){
								rsPubli.close();
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

}

