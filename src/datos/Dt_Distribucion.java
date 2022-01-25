package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.Distribucion;
import entidades.Familia;
import vistas.VW_Distribucion;

public class Dt_Distribucion {
	//Atributos
			PoolConexion pc = PoolConexion.getInstance(); 
			Connection c = null;
			private ResultSet rsDistribucion = null;
			private ResultSet rs = null;
			private PreparedStatement ps = null;
			
			// Metodo para llenar el ResultSet
			public void llenaRsDistribucion(Connection c){
				try{
					ps = c.prepareStatement("select * from public.distribucion", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					rsDistribucion = ps.executeQuery();
				}
				catch (Exception e){
					System.out.println("DATOS: ERROR EN LISTAR DISTRIBUCION "+ e.getMessage());
					e.printStackTrace();
				}
			}
			
			//Metodo para listar los Distribuciones con sus paises
			public ArrayList<VW_Distribucion> listaDistribucion(){
				ArrayList<VW_Distribucion> listDistribucion = new ArrayList<VW_Distribucion>();
				try{
					c = PoolConexion.getConnection();
					ps = c.prepareStatement("select * from public.vw_distribucion where \"Estado\" <> 3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					rs = ps.executeQuery();
					while(rs.next()){
						VW_Distribucion ds = new VW_Distribucion();
						ds.setID(rs.getInt("iD"));
						ds.setPais(rs.getString("pais"));
						ds.setDescripcion(rs.getString("descripcion"));
						ds.setEstado(rs.getInt("estado"));
						ds.setDistribucion(rs.getString("distribucion"));
						listDistribucion.add(ds);
					}
				}
				catch (Exception e){
					System.out.println("DATOS: ERROR EN LISTAR Distribuciones "+ e.getMessage());
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
				return listDistribucion;
			}
			
			//Metodo para listar los Distribuciones con sus paises
			public ArrayList<Distribucion> listarDistribucion(){
				ArrayList<Distribucion> listDistribucion = new ArrayList<Distribucion>();
				try{
					c = PoolConexion.getConnection();
					ps = c.prepareStatement("select * from public.\"distribucion\" where estado <> 3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					rs = ps.executeQuery();
					while(rs.next()){
						Distribucion ds = new Distribucion();
						ds.setDistribucionID(rs.getInt("distribucionID"));
						ds.setPaisID(rs.getInt("paisID"));
						ds.setNombre(rs.getString("nombre"));
						ds.setDescripcion(rs.getString("descripcion"));
						ds.setFechaCreacion(rs.getTimestamp("fechaCreacion"));
						ds.setFechaModificacion(rs.getTimestamp("fechaModificacion"));
						ds.setFechaEliminacion(rs.getTimestamp("fechaEliminacion"));
						ds.setEstado(rs.getInt("estado"));
						listDistribucion.add(ds);
					}
				}
				catch (Exception e){
					System.out.println("DATOS: ERROR EN LISTAR Distribuciones "+ e.getMessage());
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
				return listDistribucion;
			}
			
			
			// Metodo para visualizar los datos de una distribución específica
			public Distribucion getDistribucion(int DistribucionID)
			{
				Distribucion dis = new Distribucion();
				try
				{
					c = PoolConexion.getConnection();
					ps = c.prepareStatement("select * from public.\"distribucion\" where estado <> 3 and \"distribucionid\"=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					ps.setInt(1, DistribucionID);
					rs = ps.executeQuery();
					if(rs.next())
					{
						dis.setDistribucionID(DistribucionID);
						dis.setNombre(rs.getString("nombre"));
						dis.setDescripcion(rs.getString("descripcion"));
						dis.setEstado(rs.getInt("estado"));
						dis.setPaisID(rs.getInt("paisid"));
						
					}
				}
				catch (Exception e)
				{
					System.out.println("DATOS ERROR getDistribucion(): "+ e.getMessage());
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
				
				return dis;
			}
			
			// Metodo para modificar distribucion
			public boolean modificarDistribucion(Distribucion dis)
			{
				boolean modificado=false;	
				try
				{
					c= PoolConexion.getConnection();
					this.llenaRsDistribucion(c);
					rsDistribucion.beforeFirst();
					while (rsDistribucion.next())
					{
						if(rsDistribucion.getInt(7)==dis.getDistribucionID())
						{
							rsDistribucion.updateString("nombre", dis.getNombre());
							rsDistribucion.updateString("descripcion", dis.getDescripcion());
							rsDistribucion.updateInt("paisid", dis.getPaisID());
							rsDistribucion.updateTimestamp("fechaModificacion", dis.getFechaModificacion());
							rsDistribucion.updateInt("estado", 2);
							rsDistribucion.updateRow();
							modificado=true;
							break;
						}
					}
				}
				catch (Exception e)
				{
					System.err.println("ERROR AL ACTUALIZAR "+e.getMessage());
					e.printStackTrace();
				}
				finally
				{
					try {
						if(rsDistribucion != null){
							rsDistribucion.close();
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

			
			//Metodo para guardar una distribucion
			public boolean guardarDistribucion(Distribucion d){
				boolean guardado = false;
				
				try{
					c = PoolConexion.getConnection();
					this.llenaRsDistribucion(c);
					rsDistribucion.moveToInsertRow();
					rsDistribucion.updateString("nombre", d.getNombre());
					rsDistribucion.updateString("descripcion", d.getDescripcion());
					rsDistribucion.updateInt("paisID", d.getPaisID());
					rsDistribucion.updateInt("estado", 1);
					rsDistribucion.updateTimestamp("fechaCreacion", d.getFechaCreacion());
					rsDistribucion.insertRow();
					rsDistribucion.moveToCurrentRow();
					guardado = true;
				}
				catch (Exception e) {
					System.err.println("ERROR AL guardar Distribucion "+e.getMessage());
					e.printStackTrace();
				}
				finally{
					try {
						if(rsDistribucion != null){
							rsDistribucion.close();
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
			
			// Metodo para eliminar usuario
			public boolean eliminarDistribucion(int distribucionid)
			{
				boolean eliminado=false;	
				try
				{
					c = PoolConexion.getConnection();
					this.llenaRsDistribucion(c);
					rsDistribucion.beforeFirst();
					while (rsDistribucion.next())
					{
						if(rsDistribucion.getInt("distribucionid")==distribucionid)
						{
							rsDistribucion.updateInt("estado", 3);
							rsDistribucion.updateRow();
							eliminado=true;
							break;
						}
					}
				}
				catch (Exception e)
				{
					System.err.println("ERROR AL ELIMINAR DISTRIBUCIÓN "+e.getMessage());
					e.printStackTrace();
				}
				finally
				{
					try {
						if(rsDistribucion != null){
							rsDistribucion.close();
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
			
}
