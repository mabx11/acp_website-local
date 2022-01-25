package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import entidades.Floracion;

public class Dt_Floracion {

	
	//cambio
	//Atributos
	
			PoolConexion pc = PoolConexion.getInstance();
			Connection c = null;
			private ResultSet rsFloracion = null;
			private ResultSet rs = null;
			private PreparedStatement ps = null;
			
			//Metodo para llenar el ResultSet
			
			public void llenaRsFloracion(Connection c) {
				try {
				ps = c.prepareStatement("SELECT * from floracion", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);	
				rsFloracion = ps.executeQuery();
				}
				catch (Exception e){
					System.out.println("DATOS: ERROR EN LISTAR Floracion "+ e.getMessage());
					e.printStackTrace();
			}
			
		}//end public void
			
			
			//Metodo para visualizar Floracion de arboles registradas y activas
			
					public ArrayList<Floracion> listaFloracionsActivos(){
						ArrayList<Floracion> listFloracion = new ArrayList<Floracion>();
						try{
							c = PoolConexion.getConnection();
							ps = c.prepareStatement("select * from public.\"floracion\"", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
							rs = ps.executeQuery();
							while(rs.next()){
								Floracion flor = new Floracion();
								flor.setFloracionID(rs.getInt("floracionID"));
								flor.setNombre(rs.getString("nombre"));
								flor.setTemporada(rs.getString("temporada"));
								flor.setDescripcion(rs.getString("descripcion"));
								flor.setEstado(rs.getInt("estado"));
								listFloracion.add(flor);
							}
						}
						catch (Exception e){
							System.out.println("DATOS: ERROR EN LISTAR Floracion "+ e.getMessage());
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
						return listFloracion;
					}
					
					// Metodo para visualizar los datos de un Floracion específico
					public Floracion getFloracion(int floracionID)
					{
						Floracion flor = new Floracion();
						try
						{
							c = PoolConexion.getConnection();
							ps = c.prepareStatement("select * from public.\"floracion\" where estado <> 3 and \"FloracionID\"=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
							ps.setInt(1, floracionID);
							rs = ps.executeQuery();
							if(rs.next())
							{
								flor.setFloracionID(floracionID);
								flor.setNombre(rs.getString("nombre"));
								flor.setTemporada(rs.getString("temporada"));
								flor.setDescripcion(rs.getString("descripcion"));
								flor.setEstado(rs.getInt("estado"));
								
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
						
						return flor;
					}
			

}//end public class
