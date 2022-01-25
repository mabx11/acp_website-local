package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import entidades.Arbol;
import vistas.VW_Arbol;


public class Dt_Arbol {

	PoolConexion pc = PoolConexion.getInstance(); 
	Connection c = null;
	private ResultSet rsArbol = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
	// Metodo para llenar el ResultSet
	public void llenaRsArbol(Connection c){
		try{
			ps = c.prepareStatement("select * from public.arbol", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rsArbol = ps.executeQuery();
		}
		catch (Exception e){
			System.out.println("DATOS: ERROR EN LISTAR Arboles "+ e.getMessage());
			e.printStackTrace();
		}
	}
	
	//Metodo para listar los arboles
	public ArrayList<VW_Arbol> listaArbol(){
		ArrayList<VW_Arbol> listArbol = new ArrayList<VW_Arbol>();
		try{
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.vw_arbol where \"Estado\" <> 3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rs = ps.executeQuery();
			while(rs.next()){
				VW_Arbol ds = new VW_Arbol();
				ds.setID(rs.getInt("iD"));
				ds.setNombreCientifico(rs.getString("nombreCientifico"));
				ds.setNombreComun(rs.getString("nombreComun"));
				ds.setDescripcion(rs.getString("descripcion"));
				ds.setEstado(rs.getInt("estado"));
				ds.setFamilia(rs.getString("familia"));
				ds.setGenero(rs.getString("genero"));
				ds.setEpocaFloracion(rs.getString("epocaFloracion"));
				//ds.setDescripDistribucion(rs.getString("descripDistribucion"));
				ds.setImagen(rs.getString("foto"));
				listArbol.add(ds);
			}
		}
		catch (Exception e){
			System.out.println("DATOS: ERROR EN LISTAR Arboles "+ e.getMessage());
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
	
	
	// Metodo para visualizar los datos de un arbol específico
	public VW_Arbol getArbol2(int iD) {
		VW_Arbol vwru = new VW_Arbol();
		try {

			System.out.println("Hasta aca todo bien");

			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.vw_arbol where \"ID\"=?",
					ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			ps.setInt(1, iD);
			rs = ps.executeQuery();
			System.out.println("Ya hizo el select");
			if (rs.next()) {
				vwru.setID(iD);
				vwru.setNombreCientifico(rs.getString("nombreCientifico"));
				vwru.setNombreComun(rs.getString("nombreComun"));
				vwru.setDescripcion(rs.getString("descripcion"));
				vwru.setEstado(rs.getInt("estado"));
				vwru.setFamilia(rs.getString("familia"));
				vwru.setGenero(rs.getString("genero"));
				vwru.setEpocaFloracion(rs.getString("epocaFloracion"));
				//vwru.setDescripDistribucion(rs.getString("nombreDistribucion"));
				vwru.setImagen(rs.getString("foto"));
				System.out.println("Ya te deberia de aparecer wtf");
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

		return vwru;
	}
	
	
	// Metodo para visualizar los datos de un árbol específico
	public Arbol getArbol(int arbolID)
	{
		Arbol arb = new Arbol();
		try
		{
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.\"arbol\" where estado <> 3 and \"arbolid\"=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			ps.setInt(1, arbolID);
			rs = ps.executeQuery();
			if(rs.next())
			{
				arb.setArbolId(arbolID);
				arb.setNombrecientifico(rs.getString("nombrecientifico"));
				arb.setNombrecomun(rs.getString("nombrecomun"));
				arb.setDescripcion(rs.getString("descripcion"));
				//arb.setDistribucionID(rs.getInt("distribucionID"));
				arb.setFamiliaID(rs.getInt("familiaID"));
				arb.setGeneroID(rs.getInt("generoID"));
				arb.setFloracionID(rs.getInt("floracionID"));
				arb.setImagen(rs.getString("imagen"));
				
				
			}
		}
		catch (Exception e)
		{
			System.out.println("DATOS ERROR getNIMA(): "+ e.getMessage());
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
		
		return arb;
	}
	
	
	//Metodo para guardar un arbol
	public boolean guardarArbol(Arbol a){
		boolean guardado = false;
		
		try{
			c = PoolConexion.getConnection();
			this.llenaRsArbol(c);
			rsArbol.moveToInsertRow();
			rsArbol.updateString("nombrecientifico", a.getNombrecientifico());
			rsArbol.updateString("nombrecomun", a.getNombrecomun());
			rsArbol.updateString("descripcion", a.getDescripcion());
			//rsArbol.updateInt("distribucionID", a.getDistribucionID());
			rsArbol.updateInt("generoID", a.getGeneroID());
			rsArbol.updateInt("familiaID", a.getFamiliaID());
			rsArbol.updateInt("floracionID", a.getFloracionID());
			rsArbol.updateInt("estado", 1);
			rsArbol.updateTimestamp("fechaCreacion", a.getFechaCreacion());
			rsArbol.insertRow();
			rsArbol.moveToCurrentRow();
			guardado = true;
		}
		catch (Exception e) {
			System.err.println("ERROR AL guardar Arbol "+e.getMessage());
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
	
	
	// Metodo para guardar la foto del Arbol
		public boolean guardarFotoArbol(int idArbol, String urlFoto)
		{
			boolean actualizado = false;
			
			try
			{
				c = PoolConexion.getConnection();
				this.llenaRsArbol(c);	
				rsArbol.beforeFirst();
				while(rsArbol.next())
				{
					if(rsArbol.getInt("arbolid")==idArbol)
					{
						
						rsArbol.updateString("imagen", urlFoto);
						rsArbol.updateInt("estado", 2);
						rsArbol.updateRow();
						actualizado = true;
						break;
					}
				}
			}
			catch (Exception e) 
			{
				System.err.println("ERROR AL GUARDAR FOTO "+e.getMessage());
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
			
			return actualizado;
		}
	
		// Metodo para modificar Arbol
		public boolean modificarArbol(Arbol arb)
		{
			boolean modificado=false;	
			try
			{
				c= PoolConexion.getConnection();
				this.llenaRsArbol(c);
				rsArbol.beforeFirst();
				while (rsArbol.next())
				{
					if(rsArbol.getInt(9)==arb.getArbolId())
					{
						rsArbol.updateString("nombrecientifico", arb.getNombrecientifico());
						rsArbol.updateString("nombrecomun", arb.getNombrecomun());
						rsArbol.updateString("descripcion", arb.getDescripcion());
						//rsArbol.updateInt("distribucionID", a.getDistribucionID());
						rsArbol.updateInt("generoID", arb.getGeneroID());
						rsArbol.updateInt("familiaID", arb.getFamiliaID());
						rsArbol.updateInt("floracionID", arb.getFloracionID());
						rsArbol.updateInt("estado", 2);
						rsArbol.updateTimestamp("fechaModificacion", arb.getFechaModificacion());
						rsArbol.updateRow();
						modificado=true;
						break;
					}
				}
			}
			catch (Exception e)
			{
				System.err.println("ERROR AL ACTUALIZAR ARBOL "+e.getMessage());
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
		
		
		// Metodo para eliminar Arbol
		public boolean eliminarArbol(int arbolID)
		{
			boolean eliminado=false;	
			try
			{
				c = PoolConexion.getConnection();
				this.llenaRsArbol(c);
				rsArbol.beforeFirst();
				Date fechaSistema = new Date();
				while (rsArbol.next())
				{
					if(rsArbol.getInt(9)==arbolID)
					{
						rsArbol.updateTimestamp("FechaEliminacion", new java.sql.Timestamp(fechaSistema.getTime()));
						rsArbol.updateInt("estado", 3);
						rsArbol.updateRow();
						eliminado=true;
						break;
					}
				}
			}
			catch (Exception e)
			{
				System.err.println("ERROR AL ACTUALIZAR Arbol "+e.getMessage());
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
					

		// Metodo para cargar combobox Arbol
		public ArrayList<Arbol> listaComboArbol(){
			ArrayList<Arbol> listArbol = new ArrayList<Arbol>();
			try{
				c = PoolConexion.getConnection();
				ps = c.prepareStatement("select * from public.\"arbol\" where \"estado\" <> 3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rs = ps.executeQuery();
				while(rs.next()){
					Arbol ds = new Arbol();
					ds.setArbolId(rs.getInt("arbolId"));
					ds.setEstado(rs.getInt("estado"));
					listArbol.add(ds);
				}
			}
			catch (Exception e){
				System.out.println("DATOS: ERROR EN LISTAR COMBO ARBOLES "+ e.getMessage());
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
	
}
