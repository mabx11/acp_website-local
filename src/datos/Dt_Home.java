package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.Home;

public class Dt_Home {
	
	PoolConexion pc = PoolConexion.getInstance(); 
	Connection c = null;
	private ResultSet rsHome = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
	// Metodo para llenar el ResultSet
	public void llenaRsHome(Connection c){
		try{
			ps = c.prepareStatement("SELECT * from home", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rsHome = ps.executeQuery();
		}
		catch (Exception e){
			System.out.println("DATOS: ERROR EN LISTAR DATOS HOME "+ e.getMessage());
			e.printStackTrace();
		}
	}
	
	
	//Metodo para visualizar opciones de home
	public ArrayList<Home> listaHome(){
		ArrayList<Home> listHome = new ArrayList<Home>();
		try{
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.\"home\"", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rs = ps.executeQuery();
			while(rs.next()){
				Home hom = new Home();
				hom.setHomeID(rs.getInt("homeID"));
				hom.setMision(rs.getString("mision"));
				hom.setVision(rs.getString("vision"));
				hom.setHistoria(rs.getString("historia"));
				hom.setDescrip_pag(rs.getString("descrip_pag"));
				hom.setBanner(rs.getString("banner"));
				hom.setFechaModificacion(rs.getTimestamp("fechaModificacion"));
				listHome.add(hom);
			}
		}
		catch (Exception e){
			System.out.println("DATOS: ERROR EN LISTAR HOME "+ e.getMessage());
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
		return listHome;
	}
	
	// Metodo para visualizar los datos de home específico
	public Home getHome(int homeID)
	{
		Home hom = new Home();
		try
		{
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.\"home\" where \"homeid\"=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			ps.setInt(1, homeID);
			rs = ps.executeQuery();
			if(rs.next())
			{
				hom.setHomeID(homeID);
				hom.setMision(rs.getString("mision"));
				hom.setVision(rs.getString("vision"));
				hom.setHistoria(rs.getString("historia"));
				hom.setBanner(rs.getString("banner"));
				
			}
		}
		catch (Exception e)
		{
			System.out.println("DATOS ERROR getHome(): "+ e.getMessage());
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
		
		return hom;
	}
	
	// Metodo para modificar home
	public boolean modificarHome(Home ho, int opc)
	{
		boolean modificado=false;	
		try
		{
			c = PoolConexion.getConnection();
			this.llenaRsHome(c);
			rsHome.beforeFirst();
			while (rsHome.next())
			{
				if(rsHome.getInt("homeID")==ho.getHomeID())
				{
					int control=opc;
					
					
					switch(control){
					case 1:{
						rsHome.updateString("historia", ho.getHistoria());	
						break;				
					}
					case 2:{
						rsHome.updateString("mision", ho.getMision());	
						break;
					}
					case 3:{
						rsHome.updateString("vision", ho.getVision());
						break;
					}
					case 4:{
						rsHome.updateString("banner", ho.getBanner());
						break;
					}
					
						
					}	
					rsHome.updateTimestamp("fechaModificacion", ho.getFechaModificacion());
					rsHome.updateRow();
					modificado=true;
					break;																	
			}
			}
		}
		catch (Exception e)
		{
			System.err.println("ERROR AL ACTUALIZAR HOME "+e.getMessage());
			e.printStackTrace();
		}
		finally
		{
			try {
				if(rsHome != null){
					rsHome.close();
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
	
	// Metodo para cargar datos por primera vez
	public boolean guardarHome(){
		boolean guardado = false;
		
		try{
			c = PoolConexion.getConnection();
			this.llenaRsHome(c);
			rsHome.moveToInsertRow();
			rsHome.updateString("historia", "Historia");
			rsHome.updateString("mision", "Mision");
			rsHome.updateString("vision", "Vision");
			rsHome.updateString("descrip_pag", "Descripcion");
			rsHome.updateString("banner", "Banner");
			rsHome.updateInt("usuarioid", 1);
			rsHome.insertRow();
			rsHome.moveToCurrentRow();
			guardado = true;
		}
		catch (Exception e) {
			System.err.println("ERROR AL GUARDAR HOME POR PRIMERA VEZ "+e.getMessage());
			e.printStackTrace();
		}
		finally{
			try {
				if(rsHome != null){
					rsHome.close();
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
	
	// Metodo para guardar un documento en la Publicacion
	public boolean guardarFotoBanner(int homeId, String urlFotoBanner)
	{
		boolean actualizado = false;
		
		try
		{
			c = PoolConexion.getConnection();
			this.llenaRsHome(c);	
			rsHome.beforeFirst();
			while(rsHome.next())
			{
				if(rsHome.getInt("homeID")==homeId)
				{
					
					rsHome.updateString("banner", urlFotoBanner);
					//rsHome.updateInt("estado", 2);
					rsHome.updateRow();
					actualizado = true;
					break;
				}
			}
		}
		catch (Exception e) 
		{
			System.err.println("ERROR AL GUARDAR IMAGEN "+e.getMessage());
			e.printStackTrace();
		}
		finally
		{
			try {
				if(rsHome != null){
					rsHome.close();
				}
				if(c != null){
					PoolConexion.closeConnection(c);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return actualizado;
	}

}
