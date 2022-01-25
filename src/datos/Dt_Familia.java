package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import entidades.Familia;

public class Dt_Familia {

	PoolConexion pc = PoolConexion.getInstance();
	Connection c = null;
	private ResultSet rsFamilia = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
	//Metodo para llenar el ResultSet
	public void llenaRsFamilia(Connection c) {
		try {
		ps = c.prepareStatement("SELECT * from familia", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);	
		rsFamilia = ps.executeQuery();
		}
		catch (Exception e){
			System.out.println("DATOS: ERROR EN LISTAR FAMILIA "+ e.getMessage());
			e.printStackTrace();
		}
	}

	
	//Metodo para visualizar familias de arboles registradas y activas
	public ArrayList<Familia> listaFamiliasActivas(){
		ArrayList<Familia> listFamilia = new ArrayList<Familia>();
		try{
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.\"familia\" where estado <> 3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rs = ps.executeQuery();
			while(rs.next()){
				Familia fam = new Familia();
				fam.setFamiliaID(rs.getInt("familiaID"));
				fam.setNombre(rs.getString("nombre"));
				fam.setDescripcion(rs.getString("descripcion"));
				fam.setEstado(rs.getInt("estado"));
				fam.setFechaCreacion(rs.getTimestamp("fechaCreacion"));
				fam.setFechaModificacion(rs.getTimestamp("fechaModificacion"));
				fam.setFechaEliminacion(rs.getTimestamp("fechaEliminacion"));
				listFamilia.add(fam);
			}
		}
		catch (Exception e){
			System.out.println("DATOS: ERROR EN LISTAR FAMILIA "+ e.getMessage());
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
		return listFamilia;
	}
	
	// Metodo para visualizar los datos de una familia específica
	public Familia getFamilia(int familiaID)
	{
		Familia fam = new Familia();
		try
		{
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.\"familia\" where estado <> 3 and \"familiaid\"=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			ps.setInt(1, familiaID);
			rs = ps.executeQuery();
			if(rs.next())
			{
				fam.setFamiliaID(familiaID);
				fam.setNombre(rs.getString("nombre"));
				fam.setDescripcion(rs.getString("descripcion"));
				
			}
		}
		catch (Exception e)
		{
			System.out.println("DATOS ERROR getFamilia(): "+ e.getMessage());
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
		
		return fam;
	}


	//Metodo para almacenar nueva familia
	public boolean guardarFam(Familia fam){
		boolean guardado = false;
		
		try{
			c = PoolConexion.getConnection();
			this.llenaRsFamilia(c);
			rsFamilia.moveToInsertRow();
			rsFamilia.updateString("nombre", fam.getNombre());
			rsFamilia.updateString("descripcion", fam.getDescripcion());
			rsFamilia.updateTimestamp("fechaCreacion", fam.getFechaCreacion());
			rsFamilia.updateInt("estado", 1);
			rsFamilia.insertRow();
			rsFamilia.moveToCurrentRow();
			guardado = true;
		}
		catch (Exception e) {
			System.err.println("ERROR AL GUARDAR FAMILIA "+e.getMessage());
			e.printStackTrace();
		}
		finally{
			try {
				if(rsFamilia != null){
					rsFamilia.close();
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
	
	
	// Metodo para modificar Familia
	public boolean modificarFamilia(Familia fam)
	{
		boolean modificado=false;	
		try
		{
			c= PoolConexion.getConnection();
			this.llenaRsFamilia(c);
			rsFamilia.beforeFirst();
			while (rsFamilia.next())
			{
				if(rsFamilia.getInt(7)==fam.getFamiliaID())
				{
					rsFamilia.updateString("nombre", fam.getNombre());
					rsFamilia.updateString("descripcion", fam.getDescripcion());
					rsFamilia.updateTimestamp("fechaModificacion", fam.getFechaModificacion());
					rsFamilia.updateInt("estado", 2);
					rsFamilia.updateRow();
					modificado=true;
					break;
				}
			}
		}
		catch (Exception e)
		{
			System.err.println("ERROR AL ACTUALIZAR CONVOCATORIA "+e.getMessage());
			e.printStackTrace();
		}
		finally
		{
			try {
				if(rsFamilia != null){
					rsFamilia.close();
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
	
	
	// Metodo para eliminar Familia
	public boolean eliminarFamilia(int familiaID)
	{
		boolean eliminado=false;	
		try
		{
			c = PoolConexion.getConnection();
			this.llenaRsFamilia(c);
			rsFamilia.beforeFirst();
			Date fechaSistema = new Date();
			while (rsFamilia.next())
			{
				if(rsFamilia.getInt(7)==familiaID)
				{
					rsFamilia.updateTimestamp("FechaEliminacion", new java.sql.Timestamp(fechaSistema.getTime()));
					rsFamilia.updateInt("estado", 3);
					rsFamilia.updateRow();
					eliminado=true;
					break;
				}
			}
		}
		catch (Exception e)
		{
			System.err.println("ERROR AL ACTUALIZAR Familia "+e.getMessage());
			e.printStackTrace();
		}
		finally
		{
			try {
				if(rsFamilia != null){
					rsFamilia.close();
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

