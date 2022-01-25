package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import entidades.TipoProducto;
//import entidades.Usuario;

public class Dt_TipoProd {
	
	//Atributos
	
			PoolConexion pc = PoolConexion.getInstance(); 
			Connection c = null;
			private ResultSet rsTipoProd = null;
			private ResultSet rs = null;
			private PreparedStatement ps = null;
			
			// Metodo para llenar el RusultSet
			
			public void llenaRsTipoProd(Connection c){
				try{
					ps = c.prepareStatement("SELECT * from tipoproducto", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					rsTipoProd = ps.executeQuery();
				}
				catch (Exception e){
					System.out.println("DATOS: ERROR EN LISTAR TIPO PRODUCTO "+ e.getMessage());
					e.printStackTrace();
				}
			}
			
			//Metodo para visualizar roles registrados y activos
			
			public ArrayList<TipoProducto> listaTipoProdActivos(){
				ArrayList<TipoProducto> listTipoProd = new ArrayList<TipoProducto>();
				try{
					c = PoolConexion.getConnection();
					ps = c.prepareStatement("select * from public.tipoproducto where estado <> 3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					rs = ps.executeQuery();
					while(rs.next()){
						TipoProducto tp = new TipoProducto();
						tp.setTipoproductoid(rs.getInt("tipoproductoid"));
						tp.setTipoproducto(rs.getString("tipoproducto"));
						tp.setDescripcion(rs.getString("descripcion"));
						tp.setEstado(rs.getInt("estado"));
      					tp.setFechaCreacion(rs.getTimestamp("fechaCreacion"));
						listTipoProd.add(tp);
					}
				}
				catch (Exception e){
					System.out.println("DATOS: ERROR EN LISTAR TIPO PRODUCTO "+ e.getMessage());
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
				return listTipoProd;
			}

			// Metodo para visualizar los datos de un rol específico
			public TipoProducto getTipoProd(int TipoProdId)
			{
				System.out.println("Esta acaaaaa");
				TipoProducto tp = new TipoProducto();
				try
				{
					c = PoolConexion.getConnection();
					ps = c.prepareStatement("select * from public.tipoproducto where estado <> 3 and tipoproductoid=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					ps.setInt(1, TipoProdId);
					rs = ps.executeQuery();
					if(rs.next())
					{
						tp.setTipoproductoid(TipoProdId);
						tp.setTipoproducto(rs.getString("tipoproducto"));
						tp.setDescripcion(rs.getString("descripcion"));
						tp.setEstado(rs.getInt("estado"));
						System.out.println("Entroooooo");
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
				
				return tp;
			}
			
			//Metodo para almacenar nuevo Rol
			public boolean guardarTipoProd(TipoProducto tipop){
				boolean guardado = false;
				
				try{
					c = PoolConexion.getConnection();
					this.llenaRsTipoProd(c);
					rsTipoProd.moveToInsertRow();
//					rsUsuario.updateInt("UsuarioID", 2);
					rsTipoProd.updateString("tipoproducto", tipop.getTipoproducto());
					rsTipoProd.updateString("descripcion", tipop.getDescripcion());
					rsTipoProd.updateTimestamp("fechaCreacion", tipop.getFechaCreacion());
					rsTipoProd.updateInt("estado", 1);
					rsTipoProd.insertRow();
					rsTipoProd.moveToCurrentRow();
					guardado = true;
				}
				catch (Exception e) {
					System.err.println("ERROR AL GUARDAR TIPO PRODUCTO "+e.getMessage());
					e.printStackTrace();
				}
				finally{
					try {
						if(rsTipoProd != null){
							rsTipoProd.close();
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
			
			// Metodo para modificar rol
			public boolean modificarTipoProd(TipoProducto tipop)
			{
				System.out.println("Esta en el modificar");
				boolean modificado=false;	
				try
				{
					c = PoolConexion.getConnection();
					this.llenaRsTipoProd(c);
					rsTipoProd.beforeFirst();
					while (rsTipoProd.next())
					{
						System.out.println("Esta en el while del modificar");
						System.out.println("este es el valor del while " + rsTipoProd.getInt("tipoproductoid") + " y este es el valor del rol a editar " + tipop.getTipoproductoid()) ;
						if(rsTipoProd.getInt("tipoproductoid")==tipop.getTipoproductoid())
						{
							System.out.println("Entro al if");
							rsTipoProd.updateString("tipoproducto", tipop.getTipoproducto());
							rsTipoProd.updateString("descripcion", tipop.getDescripcion());
							rsTipoProd.updateTimestamp("fechaModificacion", tipop.getFechaModificacion());
							rsTipoProd.updateInt("Estado", 2);
							rsTipoProd.updateRow();
							modificado=true;
							System.out.println("Yastaaa");
							break;
						}
					} 
				}
				catch (Exception e)
				{
					System.err.println("ERROR AL ACTUALIZAR TIPO PRODUCTO "+e.getMessage());
					e.printStackTrace();
				}
				finally
				{
					try {
						if(rsTipoProd != null){
							rsTipoProd.close();
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
			public boolean eliminarTipoProducto(int TipoProdID)
			{
				boolean eliminado=false;	
				try
				{
					c = PoolConexion.getConnection();
					this.llenaRsTipoProd(c);
					rsTipoProd.beforeFirst();
					Date fechaSistema = new Date();
					while (rsTipoProd.next())
					{
						if(rsTipoProd.getInt(7)==TipoProdID)
						{
							rsTipoProd.updateTimestamp("fechaEliminacion", new java.sql.Timestamp(fechaSistema.getTime()));
							rsTipoProd.updateInt("estado", 3);
							rsTipoProd.updateRow();
							eliminado=true;
							break;
						}
					}
				}
				catch (Exception e)
				{
					System.err.println("ERROR AL ELIMINAR ROL "+e.getMessage());
					e.printStackTrace();
				}
				finally
				{
					try {
						if(rsTipoProd != null){
							rsTipoProd.close();
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
