package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.Mapa;

public class Dt_Mapa {
	
	PoolConexion pc = PoolConexion.getInstance(); 
	Connection c = null;
	private ResultSet rsMapa = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
	// Metodo para llenar el ResultSet
	public void llenaRsMapa(Connection c){
		try{
			ps = c.prepareStatement("SELECT * from mapa", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rsMapa = ps.executeQuery();
		}
		catch (Exception e){
			System.out.println("DATOS: ERROR EN LISTAR DATOS MAPA "+ e.getMessage());
			e.printStackTrace();
		}
	}
	
	
	//Metodo para visualizar opciones de home
	public ArrayList<Mapa> listaMapa(){
		ArrayList<Mapa> listMapa = new ArrayList<Mapa>();
		try{
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.mapa", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rs = ps.executeQuery();
			while(rs.next()){
				Mapa mp = new Mapa();
				mp.setMapaid(rs.getInt("mapaid"));
				mp.setNombre(rs.getString("nombre"));
				mp.setFotomapa(rs.getString("fotomapa"));
				mp.setFechaModificacion(rs.getTimestamp("fechaModificacion"));
				listMapa.add(mp);
			}
		}
		catch (Exception e){
			System.out.println("DATOS: ERROR EN LISTAR MAPA "+ e.getMessage());
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
		return listMapa;
	}
	
	// Metodo para visualizar los datos de home específico
	public Mapa getMapa(int mapaid)
	{
		Mapa mp = new Mapa();
		try
		{
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.\"mapa\" where \"mapaid\"=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			ps.setInt(1, mapaid);
			rs = ps.executeQuery();
			if(rs.next())
			{
				mp.setMapaid(mapaid);
				mp.setNombre(rs.getString("nombre"));
				mp.setFotomapa(rs.getString("fotomapa"));
				
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
		
		return mp;
	}
	
	//Metodo para modificar home
	public boolean modificarMapa(Mapa mp)
	{
		boolean modificado=false;	
		try
		{
			c = PoolConexion.getConnection();
			this.llenaRsMapa(c);
			rsMapa.beforeFirst();
			while (rsMapa.next())
			{
				if(rsMapa.getInt("mapaid")==mp.getMapaid())
				{
					rsMapa.updateString("nombre", mp.getNombre());					
					rsMapa.updateTimestamp("fechaModificacion", mp.getFechaModificacion());
					rsMapa.updateRow();
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
				if(rsMapa != null){
					rsMapa.close();
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
	
	/* Metodo para cargar datos por primera vez
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
	}*/
	
	// Metodo para guardar un documento en la Publicacion
	public boolean guardarFotoMapa(int mapaId, String urlFotoMapa)
	{
		boolean actualizado = false;
		
		try
		{
			c = PoolConexion.getConnection();
			this.llenaRsMapa(c);	
			rsMapa.beforeFirst();
			while(rsMapa.next())
			{
				if(rsMapa.getInt("mapaid")==mapaId)
				{
					
					rsMapa.updateString("fotomapa", urlFotoMapa);
					//rsMapa.updateInt("estado", 1);
					//rsMapa.updateString("nombre", map.getNombre());
					rsMapa.updateRow();
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
				if(rsMapa != null){
					rsMapa.close();
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
