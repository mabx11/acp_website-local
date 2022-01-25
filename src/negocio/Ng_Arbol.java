package negocio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import datos.PoolConexion;

public class Ng_Arbol {
	
	//Atributos
			PoolConexion pc = PoolConexion.getInstance(); 
			Connection c = null;
			private ResultSet rs = null;
			private PreparedStatement ps = null;
			
			// Metodo para validar el Nombre Comun de un arbol
			public boolean existeNombreC(String nombreC){
				boolean existe = false;
				try{
					c = PoolConexion.getConnection();
					ps = c.prepareStatement("select * from public.arbol where \"nombrecomun\"=? and estado<>3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					ps.setString(1, nombreC);
					rs = ps.executeQuery();
					if(rs.next()){
						existe=true;
					}
				}
				catch (Exception e){
					System.out.println("DATOS ERROR existeNombreComun(): "+ e.getMessage());
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
			
			
			// Metodo para validar el Nombre Cientifico de un arbol
						public boolean existeNombreCi(String nombreCi){
							boolean existe = false;
							try{
								c = PoolConexion.getConnection();
								ps = c.prepareStatement("select * from public.arbol where \"nombrecientifico\"=? and estado<>3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
								ps.setString(1, nombreCi);
								rs = ps.executeQuery();
								if(rs.next()){
									existe=true;
								}
							}
							catch (Exception e){
								System.out.println("DATOS ERROR existeNombreCientifico(): "+ e.getMessage());
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
		
						
						//Validaciones del modificar
						// Metodo para validar el Nombre Comun de un arbol
						public boolean existeNombreCM( String nombreC){
							boolean existe = false;
							try{
								c = PoolConexion.getConnection();
								ps = c.prepareStatement("select * from public.arbol where nombrecomun=? and estado<>3" , ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
							
								ps.setString(1, nombreC);
								rs = ps.executeQuery();
								if(rs.next()){
									existe=true;
								}
							}
							catch (Exception e){
								System.out.println("DATOS ERROR existeNombreComun(): "+ e.getMessage());
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
						
						// Metodo para validar el Nombre Cientifico de un arbol
						public boolean existeNombreCiM( String nombreCi){
							boolean existe = false;
							try{
								c = PoolConexion.getConnection();
								ps = c.prepareStatement("select * from public.arbol where nombrecientifico=? and estado<>3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
							
								ps.setString(1, nombreCi);
								rs = ps.executeQuery();
								if(rs.next()){
									existe=true;
								}
							}
							catch (Exception e){
								System.out.println("DATOS ERROR existeNombreCientifico(): "+ e.getMessage());
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
						public boolean existenNombres(int arbolID, String nombreC, String nombreCi){
							boolean existe = false;
							try{
								c = PoolConexion.getConnection();
								ps = c.prepareStatement("select * from public.arbol where arbolid<>? and (nombrecomun=? or nombrecientifico=?) and estado<>3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
								ps.setInt(1, arbolID);
								ps.setString(2, nombreC);
								ps.setString(3, nombreCi);
								rs = ps.executeQuery();
								if(rs.next()){
									existe=true;
								}
							}
							catch (Exception e){
								System.out.println("DATOS ERROR existenNombres(): "+ e.getMessage());
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
