package entidades;

import java.sql.Timestamp;

public class RolUsuario {
	//Atributos
	private int Rol_usuarioID;
	private Timestamp fechaCreacion;
	private Timestamp fechaModificacion;
	private Timestamp fechaEliminacion;
	private int RolId;
	private int UsuarioID;
	
	//Metodos
	public int getRol_usuarioID() {
		return Rol_usuarioID;
	}
	public void setRol_usuarioID(int rol_usuarioID) {
		Rol_usuarioID = rol_usuarioID;
	}
	public Timestamp getFechaCreacion() {
		return fechaCreacion;
	}
	public void setFechaCreacion(Timestamp fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}
	public Timestamp getFechaModificacion() {
		return fechaModificacion;
	}
	public void setFechaModificacion(Timestamp fechaModificacion) {
		this.fechaModificacion = fechaModificacion;
	}
	public Timestamp getFechaEliminacion() {
		return fechaEliminacion;
	}
	public void setFechaEliminacion(Timestamp fechaEliminacion) {
		this.fechaEliminacion = fechaEliminacion;
	}
	public int getRolId() {
		return RolId;
	}
	public void setRolId(int rolId) {
		RolId = rolId;
	}
	public int getUsuarioID() {
		return UsuarioID;
	}
	public void setUsuarioID(int usuarioID) {
		UsuarioID = usuarioID;
	}
	
	
}
