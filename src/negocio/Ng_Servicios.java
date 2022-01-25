package negocio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import datos.PoolConexion;

public class Ng_Servicios {
	
	//Atributos
	PoolConexion pc = PoolConexion.getInstance(); 
	Connection c = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
	// Metodo para validar el username
	public boolean existeServicio(String nombre){
		boolean existe = false;
		try{
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.servicios where nombre=? and estado<>3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			ps.setString(1, nombre);
			rs = ps.executeQuery();
			if(rs.next()){
				existe=true;
			}
		}
		catch (Exception e){
			System.out.println("DATOS ERROR existeServicio(): "+ e.getMessage());
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
		
		return existe;
	}
	
	// Metodo para validar el username
				public boolean existeServicioA(int serviID, String name){
					boolean existe = false;
					try{
						c = PoolConexion.getConnection();
						ps = c.prepareStatement("select * from public.servicios where serviciosid<>? and nombre=? and estado<>3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
						ps.setInt(1, serviID);
						ps.setString(2, name);
						rs = ps.executeQuery();
						if(rs.next()){
							existe=true;
						}
					}
					catch (Exception e){
						System.out.println("DATOS ERROR existeServicioA(): "+ e.getMessage());
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
					
					return existe;
				}



}