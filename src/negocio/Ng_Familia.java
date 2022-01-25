package negocio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import datos.PoolConexion;

public class Ng_Familia {
	//Atributos
			PoolConexion pc = PoolConexion.getInstance(); 
			Connection c = null;
			private ResultSet rs = null;
			private PreparedStatement ps = null;
			
			// Metodo para validar la familia
			public boolean existeFamilia(String nombre){
				boolean existe = false;
				try{
					c = PoolConexion.getConnection();
					ps = c.prepareStatement("select * from public.familia where \"nombre\"=? and estado<>3" , ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					ps.setString(1, nombre);
					rs = ps.executeQuery();
					if(rs.next()){
						existe=true;
					}
				}
				catch (Exception e){
					System.out.println("DATOS ERROR existeFamilia(): "+ e.getMessage());
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
		
			// Metodo para validar el genero al modificar
			public boolean existeFamiliaM(int familiaID, String nombreF){
				boolean existe = false;
				try{
					c = PoolConexion.getConnection();
					ps = c.prepareStatement("select * from public.familia where familiaid<>? and nombre=? and estado<>3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					ps.setInt(1, familiaID);
					ps.setString(2, nombreF);
					rs = ps.executeQuery();
					if(rs.next()){
						existe=true;
					}
				}
				catch (Exception e){
					System.out.println("DATOS ERROR existeFamiliaM(): "+ e.getMessage());
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
