package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.RolUsuario;
import entidades.Usuario;
import vistas.VW_RolUsuario;

public class Dt_RolUsuario {

	// Atributos
	PoolConexion pc = PoolConexion.getInstance();
	Connection c = null;
	private ResultSet rsRolUser = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;

	// Metodo para llenar el ResultSet
	public void llenaRsRolUser(Connection c) {
		try {
			ps = c.prepareStatement("select * from public.rol_usuario", ResultSet.TYPE_SCROLL_SENSITIVE,
					ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rsRolUser = ps.executeQuery();
		} catch (Exception e) {
			System.out.println("DATOS: ERROR EN LISTAR rol_usuario " + e.getMessage());
			e.printStackTrace();
		}
	}

	// Metodo para listar los Usuarios con Roles asignados
	public ArrayList<VW_RolUsuario> listaRolUser() {
		ArrayList<VW_RolUsuario> listRolUser = new ArrayList<VW_RolUsuario>();
		try {
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.vw_rolusuario", ResultSet.TYPE_SCROLL_SENSITIVE,
					ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rs = ps.executeQuery();
			while (rs.next()) {
				VW_RolUsuario rous = new VW_RolUsuario();
				rous.setID(rs.getInt("iD"));
				rous.setUsuario(rs.getString("usuario"));
				rous.setNombres(rs.getString("nombres"));
				rous.setApellidos(rs.getString("apellidos"));
				rous.setRol(rs.getString("rol"));
				listRolUser.add(rous);
			}
		} catch (Exception e) {
			System.out.println("DATOS: ERROR EN LISTAR USUARIOS CON ROLES " + e.getMessage());
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
		return listRolUser;
	}

	// Metodo para visualizar los datos de un usuario específico
	public VW_RolUsuario getRolUsuario2(int iD) {
		VW_RolUsuario vwru = new VW_RolUsuario();
		try {

			System.out.println("Hasta aca todo bien");

			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.vw_rolusuario where \"ID\"=?",
					ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			ps.setInt(1, iD);
			rs = ps.executeQuery();
			System.out.println("Ya hizo el select");
			if (rs.next()) {
				vwru.setID(iD);
				vwru.setUsuario(rs.getString("usuario"));
				vwru.setNombres(rs.getString("nombres"));
				vwru.setApellidos(rs.getString("apellidos"));
				vwru.setRol(rs.getString("rol"));
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

	// Metodo para asignar rol a usuario
	public boolean guardarRolUser(RolUsuario ru) {
		boolean guardado = false;

		try {
			c = PoolConexion.getConnection();
			this.llenaRsRolUser(c);
			rsRolUser.moveToInsertRow();
			rsRolUser.updateInt("usuarioId", ru.getUsuarioID());
			rsRolUser.updateInt("rolId", ru.getRolId());
			rsRolUser.updateTimestamp("fechaCreacion", ru.getFechaCreacion());
			rsRolUser.insertRow();
			rsRolUser.moveToCurrentRow();
			guardado = true;
		} catch (Exception e) {
			System.err.println("ERROR AL guardar RolUsuario " + e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				if (rsRolUser != null) {
					rsRolUser.close();
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

	// Metodo para visualizar los datos de un usuario específico
	public RolUsuario getRolUsuario(int rol_usuarioID) {
		RolUsuario ru = new RolUsuario();
		try {

			System.out.println("Hasta aca todo bien");

			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.rol_usuario where rol_usuarioid=?",
					ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			ps.setInt(1, rol_usuarioID);
			rs = ps.executeQuery();
			System.out.println("Ya hizo el select");
			if (rs.next()) {
				ru.setRol_usuarioID(rol_usuarioID);
				ru.setUsuarioID(rs.getInt("usuarioID"));
				ru.setRolId(rs.getInt("rolId"));
				ru.setFechaCreacion(rs.getTimestamp("fechaCreacion"));
				ru.setFechaModificacion(rs.getTimestamp("fechaModoficacion"));
				ru.setFechaEliminacion(rs.getTimestamp("fechaEliminacion"));
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

		return ru;
	}
	
	// Metodo para modificar rol a usuarios
	public boolean modificarRolUser(RolUsuario rous) {
		System.out.println("Ya entro al metodo");
		boolean modificado = false;
		try {
			c = PoolConexion.getConnection();
			this.llenaRsRolUser(c);
			rsRolUser.beforeFirst();
			while (rsRolUser.next()) {
				System.out.println("Ya entro al while");
				// System.out.println("este es el valor del while " + rsUsuario.getInt(1) + " y
				// este es el valor del rol a editar " + user.getUsuarioID()) ;
				if (rsRolUser.getInt(1) == rous.getRol_usuarioID()) {
					System.out.println("Ya entro al if");
					rsRolUser.updateInt("usuarioID", rous.getUsuarioID());
					rsRolUser.updateInt("rolId", rous.getRolId());
					rsRolUser.updateTimestamp("fechaModificacion", rous.getFechaModificacion());
					rsRolUser.updateRow();
					modificado = true;
					System.out.println("Se supone que ya");
					break;
				}
			}
		} catch (Exception e) {
			System.err.println("ERROR AL ACTUALIZAR EL ROL AL USUARIO " + e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				if (rsRolUser != null) {
					rsRolUser.close();
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
	public boolean eliminaRolUser(int rol_usuarioID) {
		boolean eliminado = false;
		try {
			c = PoolConexion.getConnection();
			this.llenaRsRolUser(c);
			rsRolUser.beforeFirst();
			while (rsRolUser.next()) {
				if (rsRolUser.getInt(1) == rol_usuarioID) {
					rsRolUser.deleteRow();
					eliminado = true;
					break;
				}
			}
		} catch (Exception e) {
			System.err.println("ERROR AL ELIMINAR ROL_USER " + e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				if (rsRolUser != null) {
					rsRolUser.close();
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
