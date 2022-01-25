package entidades;

import java.sql.Date;

public class Eventos {

	private int eventoid;
	private int usuarioid;
	private String nombre;
	private String descripcion;
	private String tipoevento;
	private String ubicacion;
	private String hipervinculo; // ??, revisar
	private Date fechainicio;
	private Date fechafin;
	private String hora;
	private String horaf;
	private int estado;
	
	//Metodos
	public int getEventoid() {
		return eventoid;
	}
	public void setEventoid(int eventoid) {
		this.eventoid = eventoid;
	}
	public int getUsuarioid() {
		return usuarioid;
	}
	public void setUsuarioid(int usuarioid) {
		this.usuarioid = usuarioid;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getTipoevento() {
		return tipoevento;
	}
	public void setTipoevento(String tipoevento) {
		this.tipoevento = tipoevento;
	}
	public String getUbicacion() {
		return ubicacion;
	}
	public void setUbicacion(String ubicacion) {
		this.ubicacion = ubicacion;
	}
	public String getHipervinculo() {
		return hipervinculo;
	}
	public void setHipervinculo(String hipervinculo) {
		this.hipervinculo = hipervinculo;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public Date getFechainicio() {
		return fechainicio;
	}
	public void setFechainicio(Date fechainicio) {
		this.fechainicio = fechainicio;
	}
	public Date getFechafin() {
		return fechafin;
	}
	public void setFechafin(Date fechafin) {
		this.fechafin = fechafin;
	}
	public String getHora() {
		return hora;
	}
	public void setHora(String hora) {
		this.hora = hora;
	}
	public String getHoraf() {
		return horaf;
	}
	public void setHoraf(String horaf) {
		this.horaf = horaf;
	}
	
}
