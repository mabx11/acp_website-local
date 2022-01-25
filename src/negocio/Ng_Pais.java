package negocio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import datos.PoolConexion;

public class Ng_Pais {

	//Atributos
	PoolConexion pc = PoolConexion.getInstance(); 
	Connection c = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
	// Metodo para validar el pais
	public boolean existePais(String nombreP){
		boolean existe = false;
		try{
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.pais where \"nombre\"=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			ps.setString(1, nombreP);
			rs = ps.executeQuery();
			if(rs.next()){
				existe=true;
			}
		}
		catch (Exception e){
			System.out.println("DATOS ERROR existePais(): "+ e.getMessage());
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
	
	// Metodo para validar el pais al modificar
	public boolean existePaisM(int paisID, String nombre){
		boolean existe = false;
		try{
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.pais where paisid<>? and nombre=? and estado<>3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			ps.setInt(1, paisID);
			ps.setString(2, nombre);
			rs = ps.executeQuery();
			if(rs.next()){
				existe=true;
			}
		}
		catch (Exception e){
			System.out.println("DATOS ERROR existePaisM(): "+ e.getMessage());
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
