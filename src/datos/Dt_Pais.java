package datos;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.Eventos;
import entidades.Familia;
import entidades.Pais;
import entidades.Region;
import vistas.VW_PaisRegion;


public class Dt_Pais {

	//Atributos
	PoolConexion pc = PoolConexion.getInstance(); 
	Connection c = null;
	private ResultSet rsPaisReg = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
	// Metodo para llenar el ResultSet
	public void llenaRsPaisReg(Connection c){
		try{
			ps = c.prepareStatement("select * from public.pais", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rsPaisReg = ps.executeQuery();
		}
		catch (Exception e){
			System.out.println("DATOS: ERROR EN LISTAR PAIS "+ e.getMessage());
			e.printStackTrace();
		}
	}
	
	//Metodo para listar los Paises con sus regiones
	public ArrayList<VW_PaisRegion> listaPaisReg(){
		ArrayList<VW_PaisRegion> listPaisReg = new ArrayList<VW_PaisRegion>();
		try{
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.vw_paisregion where \"Estado\" <> 3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rs = ps.executeQuery();
			while(rs.next()){
				VW_PaisRegion pr = new VW_PaisRegion();
				pr.setID(rs.getInt("iD"));
				pr.setPais(rs.getString("pais"));
				pr.setEstado(rs.getInt("estado"));
				pr.setRegion(rs.getString("region"));
				listPaisReg.add(pr);
			}
		}
		catch (Exception e){
			System.out.println("DATOS: ERROR EN LISTAR Paises "+ e.getMessage());
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
		return listPaisReg;
	}
	
	// Metodo para visualizar los datos de un pais específica
	public Pais getPais(int PaisID)
	{
		Pais pai = new Pais();
		try
		{
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.\"pais\" where estado <> 3 and \"paisid\"=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			ps.setInt(1, PaisID);
			rs = ps.executeQuery();
			if(rs.next())
			{
				pai.setPaisID(PaisID);
				pai.setNombre(rs.getString("Nombre"));
				pai.setRegionID(rs.getInt("RegionID"));
				
			}
		}
		catch (Exception e)
		{
			System.out.println("DATOS ERROR getPais(): "+ e.getMessage());
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
		
		return pai;
	}
	
	
	//Metodo para guardar un pais
	public boolean guardarPaisReg(Pais p){
		boolean guardado = false;
		
		try{
			c = PoolConexion.getConnection();
			this.llenaRsPaisReg(c);
			rsPaisReg.moveToInsertRow();
			rsPaisReg.updateString("Nombre", p.getNombre());
			rsPaisReg.updateInt("RegionID", p.getRegionID());
			rsPaisReg.updateInt("Estado", 1);
			rsPaisReg.updateTimestamp("fechaCreacion", p.getFechaCreacion());
			rsPaisReg.insertRow();
			rsPaisReg.moveToCurrentRow();
			guardado = true;
		}
		catch (Exception e) {
			System.err.println("ERROR AL guardar Pais "+e.getMessage());
			e.printStackTrace();
		}
		finally{
			try {
				if(rsPaisReg != null){
					rsPaisReg.close();
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
	
	// Metodo para modificar pais
	public boolean modificarPaisReg(Pais p)
	{
		System.out.println("Ya entro 1");
		boolean modificado=false;	
		try
		{
			c = PoolConexion.getConnection();
			this.llenaRsPaisReg(c);
			rsPaisReg.beforeFirst();
			while (rsPaisReg.next())
			{
				System.out.println("Ya entro 2");
				if(rsPaisReg.getInt("PaisID")==p.getPaisID())
				{
					System.out.println("Ya entro 3");

					rsPaisReg.updateInt("RegionID", p.getRegionID());
					rsPaisReg.updateString("Nombre", p.getNombre());
					rsPaisReg.updateTimestamp("fechaModificacion", p.getFechaModificacion());
					rsPaisReg.updateInt("Estado", 2);
					rsPaisReg.updateRow();
					modificado=true;
					break;
				}
			}
		}
		catch (Exception e)
		{
			System.err.println("ERROR AL ACTUALIZAR PAIS "+e.getMessage());
			e.printStackTrace();
		}
		finally
		{
			try {
				if(rsPaisReg != null){
					rsPaisReg.close();
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
	
	// Metodo para eliminar rol
	public boolean eliminarPais(int PaisID)
	{
		boolean eliminado=false;	
		try
		{
			c = PoolConexion.getConnection();
			this.llenaRsPaisReg(c);
			rsPaisReg.beforeFirst();
			Date fechaSistema = new Date();
			while (rsPaisReg.next())
			{
				if(rsPaisReg.getInt("PaisID")==PaisID)
				{
					rsPaisReg.updateTimestamp("fechaEliminacion", new java.sql.Timestamp(fechaSistema.getTime()));
					rsPaisReg.updateInt("Estado", 3);
					rsPaisReg.updateRow();
					eliminado=true;
					break;
				}
			}
		}
		catch (Exception e)
		{
			System.err.println("ERROR AL ELIMINAR PAIS "+e.getMessage());
			e.printStackTrace();
		}
		finally
		{
			try {
				if(rsPaisReg != null){
					rsPaisReg.close();
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
