package entidades;

import java.sql.Timestamp;

public class Rol {
	
	//Atributos
	
	private int RolID;
	private String Rol;
	private String Roldescripcion;
	private Timestamp FechaCreacion;
	private Timestamp FechaModificacion;
	private Timestamp FechaEliminacion;
	private int Estado;
	
	//Metodos
	
	public int getRolID() {
		return RolID;
	}
	public void setRolID(int rolID) {
		RolID = rolID;
	}
	public String getRol() {
		return Rol;
	}
	public void setRol(String rol) {
		Rol = rol;
	}
	public String getRoldescripcion() {
		return Roldescripcion;
	}
	public void setRoldescripcion(String roldescripcion) {
		Roldescripcion = roldescripcion;
	}
	public Timestamp getFechaCreacion() {
		return FechaCreacion;
	}
	public void setFechaCreacion(Timestamp fechaCreacion) {
		FechaCreacion = fechaCreacion;
	}
	public Timestamp getFechaModificacion() {
		return FechaModificacion;
	}
	public void setFechaModificacion(Timestamp fechaModificacion) {
		FechaModificacion = fechaModificacion;
	}
	public Timestamp getFechaEliminacion() {
		return FechaEliminacion;
	}
	public void setFechaEliminacion(Timestamp fechaEliminacion) {
		FechaEliminacion = fechaEliminacion;
	}
	public int getEstado() {
		return Estado;
	}
	public void setEstado(int estado) {
		Estado = estado;
	}
	
	
	
	
	

}
