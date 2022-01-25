package negocio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import datos.PoolConexion;

public class Ng_Rol {
	
	//Atributos
	PoolConexion pc = PoolConexion.getInstance(); 
	Connection c = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
	// Metodo para validar el username
	public boolean existeRol(String Rol){
		boolean existe = false;
		try{
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.rol where \"rol\"=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			ps.setString(1, Rol);
			rs = ps.executeQuery();
			if(rs.next()){
				existe=true;
			}
		}
		catch (Exception e){
			System.out.println("DATOS ERROR existeRol(): "+ e.getMessage());
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
			public boolean existeRolA(int rolID, String Rol){
				boolean existe = false;
				try{
					c = PoolConexion.getConnection();
					ps = c.prepareStatement("select * from public.rol where rolid<>? and rol=? and estado<>3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					ps.setInt(1, rolID);
					ps.setString(2, Rol);
					rs = ps.executeQuery();
					if(rs.next()){
						existe=true;
					}
				}
				catch (Exception e){
					System.out.println("DATOS ERROR existeRolA(): "+ e.getMessage());
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