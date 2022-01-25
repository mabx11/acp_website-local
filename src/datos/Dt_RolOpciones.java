package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.RolOpciones;
import entidades.RolUsuario;
import vistas.VW_RolOpciones;
import vistas.VW_RolUsuario;

public class Dt_RolOpciones {

	// Atributos
	PoolConexion pc = PoolConexion.getInstance();
	Connection c = null;
	private ResultSet rsRolOpc = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;

	// Metodo para llenar el ResultSet
	public void llenaRsRolOpc(Connection c) {
		try {
			ps = c.prepareStatement("select * from public.rol_opciones", ResultSet.TYPE_SCROLL_SENSITIVE,
					ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rsRolOpc = ps.executeQuery();
		} catch (Exception e) {
			System.out.println("DATOS: ERROR EN LISTAR Rol_opciones " + e.getMessage());
			e.printStackTrace();
		}
	}

	// Metodo para listar los Roles con Opciones asignadas
	/*public ArrayList<VW_RolOpciones> listaRolOpc2(int rolid) {
		ArrayList<VW_RolOpciones> listRolOpc = new ArrayList<VW_RolOpciones>();
		try {
			
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.vw_rolopciones where rolid=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rs = ps.executeQuery();
			ps.setInt(1, rolid);
			while (rs.next()) {
				VW_RolOpciones ropc = new VW_RolOpciones();
				ropc.setID(rs.getInt("iD"));
				ropc.setRolid(rs.getInt("rolid"));
				ropc.setRol(rs.getString("rol"));
				ropc.setRolid(rs.getInt("opcionesid"));
				ropc.setOpcion(rs.getString("opcion"));
				listRolOpc.add(ropc);
			}
		} catch (Exception e) {
			System.out.println("DATOS: ERROR EN LISTAR ROLES CON OPCIONES " + e.getMessage());
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
		return listRolOpc;
	}*/
	//Metodo para visualizar las opciones de un rol
		public ArrayList<VW_RolOpciones> listaRolOpc2(int idRol){
			ArrayList<VW_RolOpciones> listropc = new ArrayList<VW_RolOpciones>();
			try{
				c = PoolConexion.getConnection();
				ps = c.prepareStatement("select * from public.vw_rolopciones where rolid=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				ps.setInt(1, idRol);
				rs = ps.executeQuery();
				while(rs.next()){
					VW_RolOpciones vwrop = new VW_RolOpciones();
					vwrop.setID(rs.getInt("iD"));
					vwrop.setRolid(rs.getInt("rolid"));
					vwrop.setRol(rs.getString("rol"));
					vwrop.setOpcionesid(rs.getInt("opcionesid"));
					vwrop.setOpcion(rs.getString("opcion"));
					listropc.add(vwrop);
				}
			}
			catch (Exception e){
				System.out.println("DATOS: ERROR EN listaRolOpc "+ e.getMessage());
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
			return listropc;
		}
	
	// Metodo para listar los Roles con Opciones asignadas
		public ArrayList<VW_RolOpciones> listaRolOpc() {
			ArrayList<VW_RolOpciones> listRolOpc = new ArrayList<VW_RolOpciones>();
			try {
				c = PoolConexion.getConnection();
				ps = c.prepareStatement("select * from public.vw_rolopciones", ResultSet.TYPE_SCROLL_SENSITIVE,
						ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rs = ps.executeQuery();
				
				while (rs.next()) {
					VW_RolOpciones ropc = new VW_RolOpciones();
					ropc.setID(rs.getInt("iD"));
					//ropc.setRolid(rs.getInt("rolid"));
					ropc.setRol(rs.getString("rol"));
					//ropc.setRolid(rs.getInt("opcionesid"));
					ropc.setOpcion(rs.getString("opcion"));
					listRolOpc.add(ropc);
				}
			} catch (Exception e) {
				System.out.println("DATOS: ERROR EN LISTAR ROLES CON OPCIONES " + e.getMessage());
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
			return listRolOpc;
		}
	
	// Metodo para visualizar los datos de un usuario específico
		public RolOpciones getRolOpciones(int rol_opcionesID) {
			RolOpciones ro = new RolOpciones();
			try {

				System.out.println("Hasta aca todo bien");

				c = PoolConexion.getConnection();
				ps = c.prepareStatement("select * from public.rol_opciones where rol_opcionesid=?",
						ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				ps.setInt(1, rol_opcionesID);
				rs = ps.executeQuery();
				System.out.println("Ya hizo el select");
				if (rs.next()) {
					ro.setRol_opcionesID(rol_opcionesID);
					ro.setRolId(rs.getInt("rolId"));
					ro.setOpcionesID(rs.getInt("opcionesID"));
					ro.setFechaCreacion(rs.getTimestamp("fechaCreacion"));
					ro.setFechaModificacion(rs.getTimestamp("fechaModoficacion"));
					ro.setFechaEliminacion(rs.getTimestamp("fechaEliminacion"));
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

			return ro;
		}
		
		// Metodo para visualizar los datos de un usuario específico
		public VW_RolOpciones getRolOpciones2(int iD) {
			VW_RolOpciones vwro = new VW_RolOpciones();
			try {

				System.out.println("Hasta aca todo bien");

				c = PoolConexion.getConnection();
				ps = c.prepareStatement("select * from public.vw_rolopciones where \"ID\"=?",
						ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				ps.setInt(1, iD);
				rs = ps.executeQuery();
				System.out.println("Ya hizo el select");
				if (rs.next()) {
					vwro.setID(iD);
					vwro.setRol(rs.getString("rol"));
					vwro.setOpcion(rs.getString("opcion"));
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

			return vwro;
		}
		

	// Metodo para asignar opciones a rol
	public boolean guardarRolOpc(RolOpciones ro) {
		boolean guardado = false;

		try {
			c = PoolConexion.getConnection();
			this.llenaRsRolOpc(c);
			rsRolOpc.moveToInsertRow();
			rsRolOpc.updateInt("opcionesId", ro.getOpcionesID());
			rsRolOpc.updateInt("rolId", ro.getRolId());
			rsRolOpc.updateTimestamp("fechaCreacion", ro.getFechaCreacion());
			rsRolOpc.insertRow();
			rsRolOpc.moveToCurrentRow();
			guardado = true;
		} catch (Exception e) {
			System.err.println("ERROR AL guardar RolOpciones " + e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				if (rsRolOpc != null) {
					rsRolOpc.close();
				}
				if (c != null) {
					PoolConexion.closeConnection(c);
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return guardado;
	}
	
	// Metodo para modificar rol a usuarios
		public boolean modificarRolOpc(RolOpciones ropc) {
			System.out.println("Ya entro al metodo");
			boolean modificado = false;
			try {
				c = PoolConexion.getConnection();
				this.llenaRsRolOpc(c);
				rsRolOpc.beforeFirst();
				while (rsRolOpc.next()) {
					System.out.println("Ya entro al while");
					// System.out.println("este es el valor del while " + rsUsuario.getInt(1) + " y
					// este es el valor del rol a editar " + user.getUsuarioID()) ;
					if (rsRolOpc.getInt(1) == ropc.getRol_opcionesID()) {
						System.out.println("Ya entro al if");
						rsRolOpc.updateInt("rolId", ropc.getRolId());
						rsRolOpc.updateInt("opcionesID", ropc.getOpcionesID());
						rsRolOpc.updateTimestamp("fechaModificacion", ropc.getFechaModificacion());
						rsRolOpc.updateRow();
						modificado = true;
						System.out.println("Se supone que ya");
						break;
					}
				}
			} catch (Exception e) {
				System.err.println("ERROR AL ACTUALIZAR LA OPCION AL ROL " + e.getMessage());
				e.printStackTrace();
			} finally {
				try {
					if (rsRolOpc != null) {
						rsRolOpc.close();
					}
					if (c != null) {
						PoolConexion.closeConnection(c);
					}

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return modificado;
		}
		
		// Metodo para eliminar RolUsuario
		public boolean eliminaRolOpc(int rol_opcionesID) {
			boolean eliminado = false;
			try {
				c = PoolConexion.getConnection();
				this.llenaRsRolOpc(c);
				rsRolOpc.beforeFirst();
				while (rsRolOpc.next()) {
					if (rsRolOpc.getInt(1) == rol_opcionesID) {
						rsRolOpc.deleteRow();
						eliminado = true;
						break;
					}
				}
			} catch (Exception e) {
				System.err.println("ERROR AL ELIMINAR ROL_OPCIONES " + e.getMessage());
				e.printStackTrace();
			} finally {
				try {
					if (rsRolOpc != null) {
						rsRolOpc.close();
					}
					if (c != null) {
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