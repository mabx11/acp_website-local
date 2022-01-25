package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import entidades.Servicios;

public class Dt_Servicios {
	
	//Atributos
	
		PoolConexion pc = PoolConexion.getInstance(); 
		Connection c = null;
		private ResultSet rsServicios = null;
		private ResultSet rs = null;
		private PreparedStatement ps = null;
		
		
		// Metodo para llenar el RusultSet
		
		public void llenaRsServicios(Connection c){
			try{
				ps = c.prepareStatement("SELECT * from servicios", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rsServicios = ps.executeQuery();
			}
			catch (Exception e){
				System.out.println("DATOS: ERROR EN LISTAR SERVICIOS "+ e.getMessage());
				e.printStackTrace();
			}
		}
		
		//Metodo para visualizar servicios registrados y activos
		
		public ArrayList<Servicios> listaServicios(){
			ArrayList<Servicios> listServicios = new ArrayList<Servicios>();
			try{
				c = PoolConexion.getConnection();
				ps = c.prepareStatement("select * from public.servicios where estado <> 3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rs = ps.executeQuery();
				while(rs.next()){
					Servicios serv = new Servicios();
					serv.setServiciosid(rs.getInt("serviciosid"));
					serv.setNombre(rs.getString("nombre"));
					serv.setDescripcion(rs.getString("descripcion"));
					serv.setDisponibilidad(rs.getString("disponibilidad"));
					serv.setFoto(rs.getString("foto"));
					serv.setEstado(rs.getInt("estado"));
					serv.setFechaCreacion(rs.getTimestamp("fechacreacion"));
					listServicios.add(serv);
				}
			}
			catch (Exception e){
				System.out.println("DATOS: ERROR EN LISTAR SERVICIOS "+ e.getMessage());
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
			return listServicios;
		}
		
		//Metodo para almacenar nuevo usuario
				public boolean guardarServicio(Servicios servicio){
					boolean guardado = false;
					
					try{
						c = PoolConexion.getConnection();
						this.llenaRsServicios(c);
						rsServicios.moveToInsertRow();
						//rsServicios.updateInt("serviciosid", 2);
						rsServicios.updateString("nombre", servicio.getNombre());
						rsServicios.updateString("descripcion", servicio.getDescripcion());
						rsServicios.updateString("disponibilidad", servicio.getDisponibilidad());
						rsServicios.updateTimestamp("fechacreacion", servicio.getFechaCreacion());
						rsServicios.updateInt("Estado", 1);
						rsServicios.insertRow();
						rsServicios.moveToCurrentRow();
						guardado = true;
					}
					catch (Exception e) {
						System.err.println("ERROR AL GUARDAR Usuario "+e.getMessage());
						e.printStackTrace();
					}
					finally{
						try {
							if(rsServicios != null){
								rsServicios.close();
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
		
		// Metodo para visualizar los datos de un usuario específico
		public Servicios getServicio(int serviciosid)
		{
			Servicios servicio = new Servicios();
			try
			{
				c = PoolConexion.getConnection();
				ps = c.prepareStatement("select * from public.\"servicios\" where estado <> 3 and \"serviciosid\"=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				ps.setInt(1, serviciosid);
				rs = ps.executeQuery();
				if(rs.next())
				{
					servicio.setServiciosid(serviciosid);
					servicio.setNombre(rs.getString("nombre"));
					servicio.setDescripcion(rs.getString("descripcion"));
					servicio.setDisponibilidad(rs.getString("disponibilidad"));
					servicio.setFoto(rs.getString("foto"));
					servicio.setEstado(rs.getInt("estado"));
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
			
			return servicio;
		}
		
		
		
		// Metodo para modificar usuarios
		public boolean modificarServicio(Servicios serv)
		{
			boolean modificado=false;	
			try
			{
				c = PoolConexion.getConnection();
				this.llenaRsServicios(c);
				rsServicios.beforeFirst();
				while (rsServicios.next())
				{
					if(rsServicios.getInt("serviciosid")==serv.getServiciosid())
					{
						rsServicios.updateString("nombre", serv.getNombre());
						rsServicios.updateString("descripcion", serv.getDescripcion());
						rsServicios.updateString("disponibilidad", serv.getDisponibilidad());
						rsServicios.updateTimestamp("fechaModificacion", serv.getFechaModificacion());
						rsServicios.updateInt("estado", 2);
						rsServicios.updateRow();
						modificado=true;
						break;
					}
				}
			}
			catch (Exception e)
			{
				System.err.println("ERROR AL ACTUALIZAR SERVICIO "+e.getMessage());
				e.printStackTrace();
			}
			finally
			{
				try {
					if(rsServicios != null){
						rsServicios.close();
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
				public boolean eliminaServicio(int serviciosID) {
					boolean eliminado = false;
					try {
						c = PoolConexion.getConnection();
						this.llenaRsServicios(c);
						rsServicios.beforeFirst();
						while (rsServicios.next()) {
							if (rsServicios.getInt(8) == serviciosID) {
								rsServicios.deleteRow();
								eliminado = true;
								break;
							}
						}
					} catch (Exception e) {
						System.err.println("ERROR AL ELIMINAR SERVICIO " + e.getMessage());
						e.printStackTrace();
					} finally {
						try {
							if (rsServicios != null) {
								rsServicios.close();
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
				
				// Metodo para guardar una foto en el servicio
				public boolean guardarFotoServicio(int servicioID, String urlFotoServ)
				{
					boolean actualizado = false;
					
					try
					{
						c = PoolConexion.getConnection();
						this.llenaRsServicios(c);	
						rsServicios.beforeFirst();
						while(rsServicios.next())
						{
							if(rsServicios.getInt("serviciosid")==servicioID)
							{
								
								rsServicios.updateString("foto", urlFotoServ);
								rsServicios.updateInt("estado", 2);
								rsServicios.updateRow();
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
							if(rsServicios != null){
								rsServicios.close();
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
