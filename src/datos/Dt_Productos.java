package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import entidades.Arbol;
import entidades.CatProductos;
import vistas.VW_Arbol;
import vistas.VW_Productos;

public class Dt_Productos {
	
	//Atributos
	
		PoolConexion pc = PoolConexion.getInstance(); 
		Connection c = null;
		private ResultSet rsProductos = null;
		private ResultSet rs = null;
		private PreparedStatement ps = null;
		
		
		// Metodo para llenar el RusultSet
		
		public void llenaRsProductos(Connection c){
			try{
				ps = c.prepareStatement("SELECT * from catalogodeproductos", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rsProductos = ps.executeQuery();
			}
			catch (Exception e){
				System.out.println("DATOS: ERROR EN LISTAR PRODUCTOS "+ e.getMessage());
				e.printStackTrace();
			}
		}
		
		//Metodo para visualizar productos registrados y activos
		
		public ArrayList<CatProductos> listaProductos(){
			ArrayList<CatProductos> listProductos = new ArrayList<CatProductos>();
			try{
				c = PoolConexion.getConnection();
				ps = c.prepareStatement("select * from public.catalogodeproductos where estado<>3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rs = ps.executeQuery(); 
				while(rs.next()){
					CatProductos prod = new CatProductos();
					prod.setCatalogodeproductosid(rs.getInt("catalogodeproductosid"));
					prod.setDescripcion(rs.getString("descripcion"));
					prod.setEstado(rs.getInt("estado"));
					prod.setFoto(rs.getString("foto"));
					prod.setNombre(rs.getString("nombre"));
					prod.setDisponibilidad(rs.getString("disponibilidad"));
					prod.setTipoproductoid(rs.getInt("tipoproductoid"));
					prod.setFechaCreacion(rs.getTimestamp("fechaCreacion"));
					listProductos.add(prod);
				}
			}
			catch (Exception e){
				System.out.println("DATOS: ERROR EN LISTAR PRODUCTOS "+ e.getMessage());
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
			return listProductos;
		}
		
		public ArrayList<VW_Productos> listaVwProductos(){
			ArrayList<VW_Productos> listVwProductos = new ArrayList<VW_Productos>();
			try{
				c = PoolConexion.getConnection();
				ps = c.prepareStatement("select * from public.vw_productos where \"Estado\"<>3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rs = ps.executeQuery(); 
				while(rs.next()){
					VW_Productos vwp = new VW_Productos();
					vwp.setID(rs.getInt("iD"));
					vwp.setDescripcion(rs.getString("descripcion"));
					vwp.setTipoProducto(rs.getString("tipoProducto"));
					vwp.setEstado(rs.getInt("estado"));
					vwp.setFoto(rs.getString("foto"));
					vwp.setNombre(rs.getString("nombre"));
					vwp.setDisponibilidad(rs.getString("disponibilidad"));
					//vwp.setTipoproductoid(rs.getInt("tipoproductoid"));
					//prod.setFechaCreacion(rs.getTimestamp("fechacreacion"));
					listVwProductos.add(vwp);
				}
			}
			catch (Exception e){
				System.out.println("DATOS: ERROR EN LISTAR PRODUCTOS "+ e.getMessage());
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
			return listVwProductos;
		}
		
		// Metodo para visualizar los datos de un arbol específico
		public VW_Productos getVwProducto(int iD) {
			VW_Productos vwp = new VW_Productos();
			try {

				System.out.println("Hasta aca todo bien");

				c = PoolConexion.getConnection();
				ps = c.prepareStatement("select * from public.vw_productos where \"ID\"=?",
						ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				ps.setInt(1, iD);
				rs = ps.executeQuery();
				System.out.println("Ya hizo el select");
				if (rs.next()) {
					vwp.setID(iD);
					vwp.setNombre(rs.getString("nombre"));
					vwp.setTipoProducto(rs.getString("tipoProducto"));
					vwp.setDescripcion(rs.getString("descripcion"));
					vwp.setEstado(rs.getInt("estado"));
					vwp.setDisponibilidad(rs.getString("disponibilidad"));
					//vwru.setDescripDistribucion(rs.getString("nombreDistribucion"));
					vwp.setFoto(rs.getString("foto"));
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

			return vwp;
		}
		
		
		// Metodo para visualizar los datos de un árbol específico
		public CatProductos getProducto(int productoID) {
			CatProductos prod = new CatProductos();
			try {

				System.out.println("Hasta aca todo bien");

				c = PoolConexion.getConnection();
				ps = c.prepareStatement("select * from public.catalogodeproductos where catalogodeproductosid=?",
						ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				ps.setInt(1, productoID);
				rs = ps.executeQuery();
				System.out.println("Ya hizo el select");
				if (rs.next()) {
					prod.setCatalogodeproductosid(productoID);;
					prod.setNombre(rs.getString("nombre"));
					prod.setTipoproductoid(rs.getInt("tipoproductoid"));
					prod.setDescripcion(rs.getString("descripcion"));
					prod.setEstado(rs.getInt("estado"));
					prod.setDisponibilidad(rs.getString("disponibilidad"));
					//vwru.setDescripDistribucion(rs.getString("nombreDistribucion"));
					prod.setFoto(rs.getString("foto"));
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

			return prod;
		}
		
		
		//Metodo para guardar un arbol
		public boolean guardarProducto(CatProductos pr){
			boolean guardado = false;
			
			try{
				c = PoolConexion.getConnection();
				this.llenaRsProductos(c);
				rsProductos.moveToInsertRow();
				rsProductos.updateString("nombre", pr.getNombre());
				rsProductos.updateInt("tipoproductoid", pr.getTipoproductoid());
				rsProductos.updateString("descripcion", pr.getDescripcion());
				rsProductos.updateString("disponibilidad", pr.getDisponibilidad());
				rsProductos.updateInt("estado", 1);
				rsProductos.updateTimestamp("fechaCreacion", pr.getFechaCreacion());
				rsProductos.insertRow();
				rsProductos.moveToCurrentRow();
				guardado = true;
			}
			catch (Exception e) {
				System.err.println("ERROR AL guardar Arbol "+e.getMessage());
				e.printStackTrace();
			}
			finally{
				try {
					if(rsProductos != null){
						rsProductos.close();
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
			public boolean guardarFotoProducto(int idProducto, String urlFoto)
			{
				boolean actualizado = false;
				
				try
				{
					c = PoolConexion.getConnection();
					this.llenaRsProductos(c);	
					rsProductos.beforeFirst();
					while(rsProductos.next())
					{
						if(rsProductos.getInt("catalogodeproductosid")==idProducto)
						{
							
							rsProductos.updateString("foto", urlFoto);
							rsProductos.updateInt("estado", 2);
							rsProductos.updateRow();
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
						if(rsProductos != null){
							rsProductos.close();
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
			public boolean modificarProducto(CatProductos prod)
			{
				boolean modificado=false;	
				try
				{
					c= PoolConexion.getConnection();
					this.llenaRsProductos(c);
					rsProductos.beforeFirst();
					while (rsProductos.next())
					{
						if(rsProductos.getInt("catalogodeproductosid")==prod.getCatalogodeproductosid())
						{
							rsProductos.updateString("nombre", prod.getNombre());
							rsProductos.updateInt("tipoproductoid", prod.getTipoproductoid());
							rsProductos.updateString("descripcion", prod.getDescripcion());
							rsProductos.updateString("disponibilidad", prod.getDisponibilidad());
							rsProductos.updateInt("estado", 2);
							rsProductos.updateTimestamp("fechaModificacion", prod.getFechaModificacion());
							rsProductos.updateRow();
							modificado=true;
							break;
						}
					}
				}
				catch (Exception e)
				{
					System.err.println("ERROR AL ACTUALIZAR PRODUCTO "+e.getMessage());
					e.printStackTrace();
				}
				finally
				{
					try {
						if(rsProductos != null){
							rsProductos.close();
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
			public boolean eliminarProducto(int productoID)
			{
				boolean eliminado=false;	
				try
				{
					c = PoolConexion.getConnection();
					this.llenaRsProductos(c);
					rsProductos.beforeFirst();
					Date fechaSistema = new Date();
					while (rsProductos.next())
					{
						if(rsProductos.getInt("catalogodeproductosid")==productoID)
						{
							rsProductos.updateTimestamp("fechaEliminacion", new java.sql.Timestamp(fechaSistema.getTime()));
							rsProductos.updateInt("estado", 3);
							rsProductos.updateRow();
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
						if(rsProductos != null){
							rsProductos.close();
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
