package entidades;

import java.sql.Timestamp;

public class RolOpciones {

	//Atributos
	private int Rol_opcionesID;
	private Timestamp fechaCreacion;
	private Timestamp fechaModificacion;
	private Timestamp fechaEliminacion;
	private String Rol;
	private String Opcion;
	private int OpcionesID;
	private int RolId;
	
	//Metodos
	public int getRol_opcionesID() {
		return Rol_opcionesID;
	}
	public void setRol_opcionesID(int rol_opcionesID) {
		Rol_opcionesID = rol_opcionesID;
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
	public int getOpcionesID() {
		return OpcionesID;
	}
	public void setOpcionesID(int opcionesID) {
		OpcionesID = opcionesID;
	}
	public int getRolId() {
		return RolId;
	}
	public void setRolId(int rolId) {
		RolId = rolId;
	}
	public String getRol() {
		return Rol;
	}
	public void setRol(String rol) {
		Rol = rol;
	}
	public String getOpcion() {
		return Opcion;
	}
	public void setOpcion(String opcion) {
		Opcion = opcion;
	}
	
	

}
