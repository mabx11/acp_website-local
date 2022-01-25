package entidades;

import java.sql.Timestamp;

public class Arbol {
	
	private String descripcion;
	private int estado;
	private String geoma;
	private String nombrecientifico;
	private String nombrecomun;
    private Timestamp fechaCreacion;
	private Timestamp fechaModificacion;
	private Timestamp fechaEliminacion;
	private String imagen;
	private int arbolId;
	private int familiaID;
	private int generoID;
	private int floracionID;
	private int usuarioID;
	
	//Metodos
	
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public String getGeoma() {
		return geoma;
	}
	public void setGeoma(String geoma) {
		this.geoma = geoma;
	}
	public String getNombrecientifico() {
		return nombrecientifico;
	}
	public void setNombrecientifico(String nombrecientifico) {
		this.nombrecientifico = nombrecientifico;
	}
	public String getNombrecomun() {
		return nombrecomun;
	}
	public void setNombrecomun(String nombrecomun) {
		this.nombrecomun = nombrecomun;
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
	
	public String getImagen() {
		return imagen;
	}
	public void setImagen(String imagen) {
		this.imagen = imagen;
	}
	
	public int getArbolId() {
		return arbolId;
	}
	public void setArbolId(int arbolId) {
		this.arbolId = arbolId;
	}
	
	public int getFamiliaID() {
		return familiaID;
	}
	public void setFamiliaID(int familiaID) {
		this.familiaID = familiaID;
	}
	public int getGeneroID() {
		return generoID;
	}
	public void setGeneroID(int generoID) {
		this.generoID = generoID;
	}
	public int getFloracionID() {
		return floracionID;
	}
	public void setFloracionID(int floracionID) {
		this.floracionID = floracionID;
	}
	public int getUsuarioID() {
		return usuarioID;
	}
	public void setUsuarioID(int usuarioID) {
		this.usuarioID = usuarioID;
	}
	
	
}
