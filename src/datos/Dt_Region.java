package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import entidades.Region;


public class Dt_Region {

	//Atributos
	
	PoolConexion pc = PoolConexion.getInstance();
	Connection c = null;
	private ResultSet rsRegion = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
	//Metodo para llenar el ResultSet
	
	public void llenaRsRegion(Connection c) {
		try {
		ps = c.prepareStatement("SELECT * from region", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);	
		rsRegion = ps.executeQuery();
		}
		catch (Exception e){
			System.out.println("DATOS: ERROR EN LISTAR REGIONES "+ e.getMessage());
			e.printStackTrace();}
	}

	//Metodo para visualizar regiones registradas y activas
	public ArrayList<Region> listaRegionActivas(){
		ArrayList<Region> listRegion= new ArrayList<Region>();
		try{
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.\"region\" where estado <> 3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rs = ps.executeQuery();
			while(rs.next()){
				Region reg = new Region();
				reg.setRegionID(rs.getInt("regionID"));
				reg.setNombre(rs.getString("nombre"));
				reg.setEstado(rs.getInt("estado"));
				reg.setFechaCreacion(rs.getTimestamp("fechaCreacion"));
				reg.setFechaModificacion(rs.getTimestamp("fechaModificacion"));
				reg.setFechaEliminacion(rs.getTimestamp("fechaEliminacion"));
				listRegion.add(reg);
			}
		}
		catch (Exception e){
			System.out.println("DATOS: ERROR EN LISTAR REGIONES "+ e.getMessage());
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
		return listRegion;
	}
	
	
	// Metodo para visualizar los datos de una region específica
	public Region getRegion(int regionID)
	{
		Region reg = new Region();
		try
		{
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.\"region\" where estado <> 3 and \"regionid\"=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			ps.setInt(1, regionID);
			rs = ps.executeQuery();
			if(rs.next())
			{
				reg.setRegionID(regionID);
				reg.setNombre(rs.getString("nombre"));
				reg.setEstado(rs.getInt("estado"));
				
			}
		}
		catch (Exception e)
		{
			System.out.println("DATOS ERROR getRegion(): "+ e.getMessage());
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
		
		return reg;
	}

	
	//Metodo para almacenar nueva region
	public boolean guardarReg(Region reg){
		boolean guardado = false;
		
		try{
			c = PoolConexion.getConnection();
			this.llenaRsRegion(c);
			rsRegion.moveToInsertRow();
			//rsUsuario.updateInt("UsuarioID", 2);
			rsRegion.updateString("Nombre", reg.getNombre());
			rsRegion.updateTimestamp("FechaCreacion", reg.getFechaCreacion());
			rsRegion.updateInt("Estado", 1);
			rsRegion.insertRow();
			rsRegion.moveToCurrentRow();
			guardado = true;
		}
		catch (Exception e) {
			System.err.println("ERROR AL GUARDAR REGION "+e.getMessage());
			e.printStackTrace();
		}
		finally{
			try {
				if(rsRegion != null){
					rsRegion.close();
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
	
	// Metodo para modificar region
	public boolean modificarReg(Region Reg)
		{
			System.out.println("Esta en el modificar");
			boolean modificado=false;	
			try
				{
					c = PoolConexion.getConnection();
					this.llenaRsRegion(c);
					rsRegion.beforeFirst();
					while (rsRegion.next())
						{
							System.out.println("Esta en el while del modificar");
							System.out.println("este es el valor del while " + rsRegion.getInt(1) + " y este es el valor del region a editar " + Reg.getRegionID()) ;
							if(rsRegion.getInt(6)==Reg.getRegionID())
							{
								System.out.println("Entro al if");
								rsRegion.updateString("Nombre", Reg.getNombre());
								rsRegion.updateTimestamp("Fechamodificacion", Reg.getFechaModificacion());
								rsRegion.updateInt("Estado", 2);
								rsRegion.updateRow();
								modificado=true;
								System.out.println("Yastaaa");
								break;
							}
						} 
					}
					catch (Exception e)
					{
						System.err.println("ERROR AL ACTUALIZAR ROL "+e.getMessage());
						e.printStackTrace();
					}
					finally
					{
						try {
							if(rsRegion != null){
								rsRegion.close();
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
	// Metodo para eliminar region
	public boolean eliminarReg(int RegionID)
		{
		System.out.println("Esta en el metodo");
			boolean eliminado=false;	
			try
			{
				c = PoolConexion.getConnection();
				this.llenaRsRegion(c);
				rsRegion.beforeFirst();
				Date fechaSistema = new Date();
				while (rsRegion.next())
					{
					if(rsRegion.getInt("RegionID")==RegionID)
						{
							rsRegion.updateTimestamp("FechaEliminacion", new java.sql.Timestamp(fechaSistema.getTime()));
							rsRegion.updateInt("Estado", 3);
							rsRegion.updateRow();
							eliminado=true;
							break;
						}
					}
			}
					
				catch (Exception e)
				{
					System.err.println("ERROR AL ELIMINAR REGION "+e.getMessage());
					e.printStackTrace();
				}
				finally
				{
					try {
						if(rsRegion != null){
							rsRegion.close();
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

	
}//end public void
