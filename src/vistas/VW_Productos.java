package vistas;

public class VW_Productos {

	//Atributos
	private int ID;
	private String Nombre;
	private String TipoProducto;
	private String Foto;
	private String Descripcion;
	private String Disponibilidad;
	private int Estado;
	
	//Metodos
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getNombre() {
		return Nombre;
	}
	public void setNombre(String nombre) {
		Nombre = nombre;
	}
	public String getTipoProducto() {
		return TipoProducto;
	}
	public void setTipoProducto(String tipoProducto) {
		TipoProducto = tipoProducto;
	}
	public String getFoto() {
		return Foto;
	}
	public void setFoto(String foto) {
		Foto = foto;
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
	public String getDisponibilidad() {
		return Disponibilidad;
	}
	public void setDisponibilidad(String disponibilidad) {
		Disponibilidad = disponibilidad;
	}
	
	
}
