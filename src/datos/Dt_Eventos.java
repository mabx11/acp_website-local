package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;
import entidades.Eventos;
import entidades.Usuario;

public class Dt_Eventos {
	
	//Atributos
	
		PoolConexion pc = PoolConexion.getInstance(); 
		Connection c = null;
		private ResultSet rsEventos = null;
		private ResultSet rs = null;
		private PreparedStatement ps = null;
			
		// Metodo para llenar el RusultSet
			
		public void llenaRsEventos(Connection c){
			try{
				ps = c.prepareStatement("SELECT * from evento", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rsEventos = ps.executeQuery();
			}
			catch (Exception e){
				System.out.println("DATOS: ERROR EN LISTAR EVENTOS "+ e.getMessage());
				e.printStackTrace();
			}
		}
		
		//Metodo para visualizar eventos registrados y activos
		
			public ArrayList<Eventos> listaEventosActivos(){
				ArrayList<Eventos> listEvent = new ArrayList<Eventos>();
				try{
					c = PoolConexion.getConnection();
					ps = c.prepareStatement("select * from public.\"evento\" where estado <> 3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					rs = ps.executeQuery();
					while(rs.next()){
						Eventos eve = new Eventos();
						eve.setEventoid(rs.getInt("eventoid"));
						eve.setUsuarioid(rs.getInt("usuarioid"));
						eve.setNombre(rs.getString("nombre"));
						eve.setDescripcion(rs.getString("descripcion"));
						eve.setTipoevento(rs.getString("tipoevento"));
						eve.setUbicacion(rs.getString("ubicacion"));
						eve.setHipervinculo(rs.getString("hipervinculo"));
						eve.setFechainicio(rs.getDate("fechainicio"));
						eve.setFechafin(rs.getDate("fechafin"));
						eve.setHora(rs.getString("hora"));
						eve.setHoraf(rs.getString("horaf"));
						eve.setEstado(rs.getInt("estado"));
						listEvent.add(eve);
					}
				}
				catch (Exception e){
					System.out.println("DATOS: ERROR EN LISTAR EVENTOS "+ e.getMessage());
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
				return listEvent;
			}
			
			//Metodo para visualizar eventos registrados, activos y publicos
			
			public ArrayList<Eventos> listaEventosPublicos(){
				ArrayList<Eventos> listEventP = new ArrayList<Eventos>();
				try{
					c = PoolConexion.getConnection();
					ps = c.prepareStatement("select * from public.\"evento\" where estado <> 3 and tipoevento = 'Publica'", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					rs = ps.executeQuery();
					while(rs.next()){
						Eventos eve = new Eventos();
						eve.setEventoid(rs.getInt("eventoid"));
						eve.setUsuarioid(rs.getInt("usuarioid"));
						eve.setNombre(rs.getString("nombre"));
						eve.setDescripcion(rs.getString("descripcion"));
						eve.setTipoevento(rs.getString("tipoevento"));
						eve.setUbicacion(rs.getString("ubicacion"));
						eve.setHipervinculo(rs.getString("hipervinculo"));
						eve.setFechainicio(rs.getDate("fechainicio"));
						eve.setFechafin(rs.getDate("fechafin"));
						eve.setHora(rs.getString("hora"));
						eve.setHoraf(rs.getString("horaf"));
						eve.setEstado(rs.getInt("estado"));
						listEventP.add(eve);
					}
				}
				catch (Exception e){
					System.out.println("DATOS: ERROR EN LISTAR EVENTOS PUBLICOS "+ e.getMessage());
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
				return listEventP;
			}
			
			// Metodo para visualizar los datos de un evento en específico
			public Eventos getEventos(int eventoid)
			{
				Eventos eve = new Eventos();
				try
				{
					c = PoolConexion.getConnection();
					ps = c.prepareStatement("select * from public.\"evento\" where estado <> 3 and \"eventoid\"=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					ps.setInt(1, eventoid);
					rs = ps.executeQuery();
					if(rs.next())
					{
						eve.setEventoid(eventoid);
						eve.setUsuarioid(rs.getInt("usuarioid"));
						eve.setNombre(rs.getString("nombre"));
						eve.setDescripcion(rs.getString("descripcion"));
						eve.setTipoevento(rs.getString("tipoevento"));
						eve.setUbicacion(rs.getString("ubicacion"));
						eve.setHipervinculo(rs.getString("hipervinculo"));
						eve.setFechainicio(rs.getDate("fechainicio"));
						eve.setFechafin(rs.getDate("fechafin"));
						eve.setHora(rs.getString("hora"));
						eve.setHoraf(rs.getString("horaf"));
						eve.setEstado(rs.getInt("estado"));
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
				
				return eve;
			}
			
			//Metodo para almacenar nuevo evento
			public boolean guardarEvent(Eventos eve){
				boolean guardado = false;
				
				try{
					c = PoolConexion.getConnection();
					this.llenaRsEventos(c);
					rsEventos.moveToInsertRow();
					//rsEventos.updateInt("usuarioid", eve.getUsuarioid());
					rsEventos.updateString("nombre", eve.getNombre());
					rsEventos.updateString("descripcion", eve.getDescripcion());
					rsEventos.updateString("tipoevento", eve.getTipoevento());
					rsEventos.updateString("ubicacion", eve.getUbicacion());
					Date fini = eve.getFechainicio();
					Date ffin = eve.getFechafin();
					java.sql.Timestamp sqlfini = new java.sql.Timestamp(fini.getTime());
					java.sql.Timestamp sqlffin = new java.sql.Timestamp(ffin.getTime());
					rsEventos.updateTimestamp("fechainicio", sqlfini);
					rsEventos.updateTimestamp("fechafin", sqlffin);
					rsEventos.updateString("hora", eve.getHora());
					rsEventos.updateString("horaf", eve.getHoraf());
					rsEventos.updateInt("Estado", 1);
					rsEventos.insertRow();
					rsEventos.moveToCurrentRow();
					guardado = true;
				}
				catch (Exception e) {
					System.err.println("ERROR AL GUARDAR EVENTO "+e.getMessage());
					e.printStackTrace();
				}
				finally{
					try {
						if(rsEventos != null){
							rsEventos.close();
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
			
			// Metodo para modificar eventos
			public boolean modificarEvento(Eventos eve)
			{
				System.out.println("Ya entro 1");
				boolean modificado=false;	
				try
				{
					c = PoolConexion.getConnection();
					this.llenaRsEventos(c);
					rsEventos.beforeFirst();
					while (rsEventos.next())
					{
						System.out.println("Ya entro 2");
						if(rsEventos.getInt("eventoid")==eve.getEventoid())
						{
							System.out.println("Ya entro 3");

							//rsEventos.updateInt("usuarioid", eve.getUsuarioid());
							rsEventos.updateString("nombre", eve.getNombre());
							rsEventos.updateString("descripcion", eve.getDescripcion());
							rsEventos.updateString("tipoevento", eve.getTipoevento());
							rsEventos.updateString("ubicacion", eve.getUbicacion());
							Date fini = eve.getFechainicio();
							Date ffin = eve.getFechafin();
							java.sql.Timestamp sqlfini = new java.sql.Timestamp(fini.getTime());
							java.sql.Timestamp sqlffin = new java.sql.Timestamp(ffin.getTime());
							rsEventos.updateTimestamp("fechainicio", sqlfini);
							rsEventos.updateTimestamp("fechafin", sqlffin);
							rsEventos.updateString("hora", eve.getHora());
							rsEventos.updateString("horaf", eve.getHoraf());
							rsEventos.updateInt("Estado", 2);
							rsEventos.updateRow();
							modificado=true;
							break;
						}
					}
				}
				catch (Exception e)
				{
					System.err.println("ERROR AL ACTUALIZAR EVENTO "+e.getMessage());
					e.printStackTrace();
				}
				finally
				{
					try {
						if(rsEventos != null){
							rsEventos.close();
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
			public boolean eliminarevento(int eventoid)
			{
				boolean eliminado=false;	
				try
				{
					c = PoolConexion.getConnection();
					this.llenaRsEventos(c);
					rsEventos.beforeFirst();
					while (rsEventos.next())
					{
						if(rsEventos.getInt("eventoid")==eventoid)
						{
							rsEventos.updateInt("estado", 3);
							rsEventos.updateRow();
							eliminado=true;
							break;
						}
					}
				}
				catch (Exception e)
				{
					System.err.println("ERROR AL ELIMINAR EVENTO "+e.getMessage());
					e.printStackTrace();
				}
				finally
				{
					try {
						if(rsEventos != null){
							rsEventos.close();
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
			
			// Metodo para guardar la foto del Evento
			public boolean guardarFotoEvento(int idEvento, String urlFoto)
			{
				boolean actualizado = false;
				
				try
				{
					c = PoolConexion.getConnection();
					this.llenaRsEventos(c);	
					rsEventos.beforeFirst();
					while(rsEventos.next())
					{
						if(rsEventos.getInt("eventoid")==idEvento)
						{
							
							rsEventos.updateString("hipervinculo", urlFoto);
							rsEventos.updateInt("estado", 2);
							rsEventos.updateRow();
							actualizado = true;
							break;
						}
					}
				}
				catch (Exception e) 
				{
					System.err.println("ERROR AL GUARDAR FOTO "+e.getMessage());
					e.printStackTrace();
				}
				finally
				{
					try {
						if(rsEventos != null){
							rsEventos.close();
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
