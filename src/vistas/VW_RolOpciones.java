package vistas;

public class VW_RolOpciones {

	//Atributos
	private int ID;
	private int rolid;
	private String Rol;
	private int opcionesid;
	private String Opcion;
	
		//Metodos
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public int getRolid() {
		return rolid;
	}
	public void setRolid(int rolid) {
		this.rolid = rolid;
	}
	public int getOpcionesid() {
		return opcionesid;
	}
	public void setOpcionesid(int opcionesid) {
		this.opcionesid = opcionesid;
	}

	public String getRol() {
		return Rol;
	}
	public void setRol(String rol) {
		Rol = rol;
	}
	public String getOpcion() {
		return Opcion;
	}
	public void setOpcion(String opcion) {
		Opcion = opcion;
	}
	
	
}
