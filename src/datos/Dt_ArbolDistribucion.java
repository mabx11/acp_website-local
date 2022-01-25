package datos;

	import java.sql.Connection;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.sql.SQLException;
	import java.util.ArrayList;

	import entidades.Arbol;
	import entidades.ArbolDistribucion;
import entidades.Distribucion;
import vistas.VW_DistribucionArbol;
import vistas.VW_RolUsuario;
	
public class Dt_ArbolDistribucion {

	//Atributos
	PoolConexion pc = PoolConexion.getInstance(); 
	Connection c = null;
	private ResultSet rsArbol = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
	// Metodo para llenar el ResultSet
	public void llenaRsArbolDistribucion(Connection c){
		try{
			ps = c.prepareStatement("select * from public.arbol_distribucion", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rsArbol = ps.executeQuery();
		}
		catch (Exception e){
			System.out.println("DATOS: ERROR EN LISTAR Arboles Distribucion "+ e.getMessage());
			e.printStackTrace();
		}
	}
	
	//Metodo para listar los arboles
	public ArrayList<VW_DistribucionArbol> listaArbolDistribucion(){
		ArrayList<VW_DistribucionArbol> listArbol = new ArrayList<VW_DistribucionArbol>();
		try{
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.VW_DistribucionArbol", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rs = ps.executeQuery();
			while(rs.next()){
				VW_DistribucionArbol ds = new VW_DistribucionArbol();
				ds.setID(rs.getInt("ID"));
				ds.setNombreArbol(rs.getString("nombreArbol"));
				ds.setNombreDistribucion(rs.getString("nombreDistribucion"));
				listArbol.add(ds);
			}
		}
		catch (Exception e){
			System.out.println("DATOS: ERROR EN LISTAR Arboles Distribucion "+ e.getMessage());
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
		return listArbol;
	}
	
	// Metodo para visualizar los datos de un usuario específico
	public ArbolDistribucion getArbolId(int Arbol_DistribucionId) {
		
		System.out.println("Ya entro al metodo");
		
		ArbolDistribucion ardi = new ArbolDistribucion();
		try {
			System.out.println("Ya entro al metodo DOS");
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.arbol_distribucion where \"arbol_distribucionid\"=?",
					ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			ps.setInt(1, Arbol_DistribucionId);
			rs = ps.executeQuery();
			System.out.println("Ya entro al metodo TRES");
			if (rs.next()) {
				ardi.setArbol_DistribucionId(Arbol_DistribucionId);
				ardi.setArbolId(rs.getInt("ArbolId"));
				ardi.setDistribucionId(rs.getInt("DistribucionId"));
				System.out.println("Ya entro al metodo CUATRO");
			}
		} catch (Exception e) {
			System.out.println("DATOS ERROR getNIMA(): " + e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (c != null) {
					PoolConexion.closeConnection(c);
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return ardi;
	}
	
	// Metodo para modificar distribucion
	public boolean modificarArbolDistribucion(ArbolDistribucion dis)
	{
		boolean modificado=false;	
		try
		{
			c= PoolConexion.getConnection();
			this.llenaRsArbolDistribucion(c);
			rsArbol.beforeFirst();
			while (rsArbol.next())
			{
				if(rsArbol.getInt(1)==dis.getArbol_DistribucionId())
				{
					rsArbol.updateInt("DistribucionId", dis.getDistribucionId());
					rsArbol.updateInt("ArbolId", dis.getArbolId());
					rsArbol.updateRow();
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
				if(rsArbol != null){
					rsArbol.close();
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
	public boolean guardarArbolDistribucion(ArbolDistribucion d){
		boolean guardado = false;
		
		try{
			c = PoolConexion.getConnection();
			this.llenaRsArbolDistribucion(c);
			rsArbol.moveToInsertRow();
			rsArbol.updateInt("ArbolId", d.getArbolId());
			rsArbol.updateInt("DistribucionId", d.getDistribucionId());
			rsArbol.insertRow();
			rsArbol.moveToCurrentRow();
			guardado = true;
		}
		catch (Exception e) {
			System.err.println("ERROR AL guardar Árbol Distribución "+e.getMessage());
			e.printStackTrace();
		}
		finally{
			try {
				if(rsArbol != null){
					rsArbol.close();
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

	
	// Metodo para eliminar distribucion arbol
	public boolean eliminarArbolDistribucion(int Arbol_DistribucionId)
	{
		boolean eliminado=false;	
		try
		{
			c = PoolConexion.getConnection();
			this.llenaRsArbolDistribucion(c);
			rsArbol.beforeFirst();
			while (rsArbol.next())
			{
				if(rsArbol.getInt("Arbol_DistribucionId")==Arbol_DistribucionId)
				{
					rsArbol.deleteRow();
					eliminado = true;
					break;
				}
			}
		}
		catch (Exception e)
		{
			System.err.println("ERROR AL ELIMINAR ÁRBOL DISTRIBUCIÓN "+e.getMessage());
			e.printStackTrace();
		}
		finally
		{
			try {
				if(rsArbol != null){
					rsArbol.close();
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
