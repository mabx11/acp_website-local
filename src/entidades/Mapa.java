package entidades;
import java.sql.Timestamp;

public class Mapa {
	
	//Atributos
	private int arbolid;
	private int sectorid;
	private String nombre;
	private String fotomapa;
	private Timestamp fechaModificacion;
	private Timestamp fechaEliminacion;
	private int estado;
	private int mapaid;
	
	//Metodos
	
	public int getMapaid() {
		return mapaid;
	}
	public void setMapaid(int mapaid) {
		this.mapaid = mapaid;
	}
	public int getArbolid() {
		return arbolid;
	}
	public void setArbolid(int arbolid) {
		this.arbolid = arbolid;
	}
	public int getSectorid() {
		return sectorid;
	}
	public void setSectorid(int sectorid) {
		this.sectorid = sectorid;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getFotomapa() {
		return fotomapa;
	}
	public void setFotomapa(String fotomapa) {
		this.fotomapa = fotomapa;
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
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}

}	