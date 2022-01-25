package entidades;
import java.sql.Timestamp;

public class Banner {
	
	//Atributos
	private int BannerID;
	private String Descripcion;
	private int Estado;
	private String Imagen; //Tengo dudas con este
	private Timestamp FechaCreacion;
	private Timestamp FechaModificacion;
	private Timestamp FechaEliminacion;
	private int UsuarioID;
	
	//Metodos
	public int getBannerID() {
		return BannerID;
	}
	public void setBannerID(int bannerID) {
		BannerID = bannerID;
	}
	public String getDescripcion() {
		return Descripcion;
	}
	public void setDescripcion(String descripcion) {
		Descripcion = descripcion;
	}
	public int getEstado() {
		return Estado;
	}
	public void setEstado(int estado) {
		Estado = estado;
	}
	public String getImagen() {
		return Imagen;
	}
	public void setImagen(String imagen) {
		Imagen = imagen;
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
	public int getUsuarioID() {
		return UsuarioID;
	}
	public void setUsuarioID(int usuarioID) {
		UsuarioID = usuarioID;
	}
}
