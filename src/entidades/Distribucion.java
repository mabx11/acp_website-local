package entidades;
import java.sql.Timestamp;

public class Distribucion {

	//Atributos
	private int DistribucionID;
	private String Nombre;
	private String Descripcion;
	private int PaisID;
	private Timestamp FechaCreacion;
	private Timestamp FechaModificacion;
	private Timestamp FechaEliminacion;
	private int Estado;
	
	//Metodos
	public int getDistribucionID() {
		return DistribucionID;
	}
	public void setDistribucionID(int distribucionID) {
		DistribucionID = distribucionID;
	}
	public String getNombre() {
		return Nombre;
	}
	public void setNombre(String nombre) {
		Nombre = nombre;
	}
	public String getDescripcion() {
		return Descripcion;
	}
	public void setDescripcion(String descripcion) {
		Descripcion = descripcion;
	}
	public int getPaisID() {
		return PaisID;
	}
	public void setPaisID(int paisID) {
		PaisID = paisID;
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
