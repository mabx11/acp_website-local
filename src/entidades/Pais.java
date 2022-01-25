package entidades;

import java.sql.Timestamp;

public class Pais {

	//Atributos
    private int Estado;
    private String Nombre;
    private Timestamp fechaCreacion;
	private Timestamp fechaModificacion;
	private Timestamp fechaEliminacion;
	private int PaisID;
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
	public int getPaisID() {
		return PaisID;
	}
	public void setPaisID(int paisID) {
		PaisID = paisID;
	}
	public int getRegionID() {
		return RegionID;
	}
	public void setRegionID(int regionID) {
		RegionID = regionID;
	}
	
	
	
	
	
	
}
