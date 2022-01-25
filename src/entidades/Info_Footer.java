package entidades;

import java.sql.Timestamp;

public class Info_Footer {

	//Atributos
	private String correo;
	private String descripcion;
	private String direccion;
	private String extension;
	private int telefono;
	private Timestamp fechaModificacion;
	private int info_footerID;
	private int usuarioID;

	//Metodos
	public String getCorreo() {
		return correo;
	}
	public void setCorreo(String correo) {
		this.correo = correo;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	
	public String getExtension() {
		return extension;
	}
	public void setExtension(String extension) {
		this.extension = extension;
	}
	public int getTelefono() {
		return telefono;
	}
	public void setTelefono(int telefono) {
		this.telefono = telefono;
	}
	public Timestamp getFechaModificacion() {
		return fechaModificacion;
	}
	public void setFechaModificacion(Timestamp fechaModificacion) {
		this.fechaModificacion = fechaModificacion;
	}
	public int getInfo_footerID() {
		return info_footerID;
	}
	public void setInfo_footerID(int info_footerID) {
		this.info_footerID = info_footerID;
	}
	public int getUsuarioID() {
		return usuarioID;
	}
	public void setUsuarioID(int usuarioID) {
		this.usuarioID = usuarioID;
	}

}