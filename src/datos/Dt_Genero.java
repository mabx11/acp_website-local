package datos;
//cambio
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import entidades.Genero;


public class Dt_Genero {

	//Atributos
	
		PoolConexion pc = PoolConexion.getInstance();
		Connection c = null;
		private ResultSet rsGenero = null;
		private ResultSet rs = null;
		private PreparedStatement ps = null;
		
		//Metodo para llenar el ResultSet
		
		public void llenaRsGenero(Connection c) {
			try {
			ps = c.prepareStatement("SELECT * from genero", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);	
			rsGenero = ps.executeQuery();
			}
			catch (Exception e){
				System.out.println("DATOS: ERROR EN LISTAR GENERO "+ e.getMessage());
				e.printStackTrace();
		}
		
	}//end public void
		
		
		//Metodo para visualizar generos de arboles registradas y activas
		
				public ArrayList<Genero> listaGenerosActivos(){
					ArrayList<Genero> listGenero = new ArrayList<Genero>();
					try{
						c = PoolConexion.getConnection();
						ps = c.prepareStatement("select * from public.\"genero\" where estado <> 3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
						rs = ps.executeQuery();
						while(rs.next()){
							Genero gen = new Genero();
							gen.setGeneroID(rs.getInt("generoID"));
							gen.setNombre(rs.getString("nombre"));
							gen.setDescripcion(rs.getString("descripcion"));
							gen.setEstado(rs.getInt("estado"));
							gen.setFechaCreacion(rs.getTimestamp("fechaCreacion"));
							gen.setFechaModificacion(rs.getTimestamp("fechaModificacion"));
							gen.setFechaEliminacion(rs.getTimestamp("fechaEliminacion"));
							listGenero.add(gen);
						}
					}
					catch (Exception e){
						System.out.println("DATOS: ERROR EN LISTAR GENERO "+ e.getMessage());
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
					return listGenero;
				}
				
				// Metodo para visualizar los datos de un genero específico
				public Genero getGenero(int generoID)
				{
					Genero gen = new Genero();
					try
					{
						c = PoolConexion.getConnection();
						ps = c.prepareStatement("select * from public.\"genero\" where estado <> 3 and \"generoid\"=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
						ps.setInt(1, generoID);
						rs = ps.executeQuery();
						if(rs.next())
						{
							gen.setGeneroID(generoID);
							gen.setNombre(rs.getString("nombre"));
							gen.setDescripcion(rs.getString("descripcion"));
							
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
					
					return gen;
				}
		
		
				//Metodo para almacenar nueva genero
				public boolean guardarGen(Genero gen){
					boolean guardado = false;
					
					try{
						c = PoolConexion.getConnection();
						this.llenaRsGenero(c);
						rsGenero.moveToInsertRow();
//						rsUsuario.updateInt("UsuarioID", 2);
						rsGenero.updateString("nombre", gen.getNombre());
						rsGenero.updateString("descripcion", gen.getDescripcion());
						rsGenero.updateTimestamp("fechaCreacion", gen.getFechaCreacion());
						rsGenero.updateInt("estado", 1);
						rsGenero.insertRow();
						rsGenero.moveToCurrentRow();
						guardado = true;
					}
					catch (Exception e) {
						System.err.println("ERROR AL GUARDAR GENERO "+e.getMessage());
						e.printStackTrace();
					}
					finally{
						try {
							if(rsGenero != null){
								rsGenero.close();
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
				
				// Metodo para modificar genero
				public boolean modificarGenero(Genero gen)
				{
					boolean modificado=false;	
					try
					{
						c= PoolConexion.getConnection();
						this.llenaRsGenero(c);
						rsGenero.beforeFirst();
						while (rsGenero.next())
						{
							if(rsGenero.getInt(7)==gen.getGeneroID())
							{
								rsGenero.updateString("nombre", gen.getNombre());
								rsGenero.updateString("descripcion", gen.getDescripcion());
								rsGenero.updateTimestamp("fechaModificacion", gen.getFechaModificacion());
								rsGenero.updateInt("estado", 2);
								rsGenero.updateRow();
								modificado=true;
								break;
							}
						}
					}
					catch (Exception e)
					{
						System.err.println("ERROR AL ACTUALIZAR GENERO "+e.getMessage());
						e.printStackTrace();
					}
					finally
					{
						try {
							if(rsGenero != null){
								rsGenero.close();
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
				// Metodo para eliminar Genero
				public boolean eliminarGenero(int GeneroID)
				{
					boolean eliminado=false;	
					try
					{
						c = PoolConexion.getConnection();
						this.llenaRsGenero(c);
						rsGenero.beforeFirst();
						Date fechaSistema = new Date();
						while (rsGenero.next())
						{
							if(rsGenero.getInt(7)==GeneroID)
							{
								rsGenero.updateTimestamp("FechaEliminacion", new java.sql.Timestamp(fechaSistema.getTime()));
								rsGenero.updateInt("estado", 3);
								rsGenero.updateRow();
								eliminado=true;
								break;
							}
						}
					}
					catch (Exception e)
					{
						System.err.println("ERROR AL ELIMINAR Genero "+e.getMessage());
						e.printStackTrace();
					}
					finally
					{
						try {
							if(rsGenero != null){
								rsGenero.close();
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
	
	
}//end public class
