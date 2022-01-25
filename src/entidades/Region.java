package entidades;

import java.sql.Timestamp;

public class Region {

	//Atributos
	private int Estado;
	private String Nombre;
	private Timestamp FechaCreacion;
	private Timestamp FechaModificacion;
	private Timestamp FechaEliminacion;
	private int RegionID;
	
	//Metodos
	
	public int getEstado() {
		return Estado;
	}
	public void setEstado(int estado) {
		Estado = estado;
	}
	
	public String getNombre() {
		return Nombre;
	}
	public void setNombre(String nombre) {
		Nombre = nombre;
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
	public int getRegionID() {
		return RegionID;
	}
	public void setRegionID(int regionID) {
		RegionID = regionID;
	}
	
	
}
