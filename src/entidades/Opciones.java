package entidades;

public class Opciones {
	
	//Atributos
	
	private int OpcionesID;
	private String Opcion;
	private String Descripcion;
	private int Estado;
	
	//Metodos
	
	public int getOpcionesID() {
		return OpcionesID;
	}
	public void setOpcionesID(int opcionesID) {
		OpcionesID = opcionesID;
	}
	public String getOpcion() {
		return Opcion;
	}
	public void setOpcion(String opcion) {
		Opcion = opcion;
	}
	public String getDescripcion() {
		return Descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.Descripcion = descripcion;
	}
	public int getEstado() {
		return Estado;
	}
	public void setEstado(int estado) {
		Estado = estado;
	}
	
	

}
