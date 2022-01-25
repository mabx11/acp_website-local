package negocio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import datos.PoolConexion;

public class Ng_RolOpc {
	//Atributos
		PoolConexion pc = PoolConexion.getInstance(); 
		Connection c = null;
		private ResultSet rs = null;
		private PreparedStatement ps = null;
		
		// Metodo para validar el username
		public boolean existeRolOpc(int opcionesID, int rolID){
			boolean existe = false;
			try{
				c = PoolConexion.getConnection();
				ps = c.prepareStatement("select * from public.rol_opciones where opcionesid=? and rolid=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				ps.setInt(1, opcionesID);
				ps.setInt(2, rolID);
				rs = ps.executeQuery();
				if(rs.next()){
					existe=true;
				}
			}
			catch (Exception e){
				System.out.println("DATOS ERROR existeRolOpc(): "+ e.getMessage());
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
				public boolean existeRolOpcA(int rolopcID,int opcionesID, int rolID){
					boolean existe = false;
					try{
						c = PoolConexion.getConnection();
						ps = c.prepareStatement("select * from public.rol_opciones where rol_opcionesid<>? and (opcionesid=? and rolid=?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
						ps.setInt(1, rolopcID);
						ps.setInt(2, opcionesID);
						ps.setInt(3, rolID);
						rs = ps.executeQuery();
						if(rs.next()){
							existe=true;
						}
					}
					catch (Exception e){
						System.out.println("DATOS ERROR existeRolOpc(): "+ e.getMessage());
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
