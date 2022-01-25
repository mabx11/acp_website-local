package entidades;

import java.sql.Timestamp;

public class TipoProducto {

	private int tipoproductoid;
	private String tipoproducto;
	private String descripcion;
	private Timestamp fechaCreacion;
	private Timestamp fechaModificacion;
	private Timestamp fechaEliminacion;
	private int estado;
	
	//Metodos
	public int getTipoproductoid() {
		return tipoproductoid;
	}
	public void setTipoproductoid(int tipoproductoid) {
		this.tipoproductoid = tipoproductoid;
	}
	public String getTipoproducto() {
		return tipoproducto;
	}
	public void setTipoproducto(String tipoproducto) {
		this.tipoproducto = tipoproducto;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
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
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	
}
