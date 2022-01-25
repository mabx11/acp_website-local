package vistas;

public class VW_RolUsuario {
	//Atributos
	private int ID;
	private int usuarioid;
	private String Usuario;
	private String Nombres;
	private String Apellidos;
	private String contrasenia;
	private int rolid;
	private String Rol;
	private String key_encriptacion;
	private String cod_verificacion;
	
	//Métodos
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public int getUsuarioid() {
		return usuarioid;
	}
	public void setUsuarioid(int usuarioid) {
		this.usuarioid = usuarioid;
	}
	public String getUsuario() {
		return Usuario;
	}
	public void setUsuario(String usuario) {
		Usuario = usuario;
	}
	public String getNombres() {
		return Nombres;
	}
	public void setNombres(String nombres) {
		Nombres = nombres;
	}
	public String getApellidos() {
		return Apellidos;
	}
	public void setApellidos(String apellidos) {
		Apellidos = apellidos;
	}
	public String getContrasenia() {
		return contrasenia;
	}
	public void setContrasenia(String contrasenia) {
		this.contrasenia = contrasenia;
	}
	public int getRolid() {
		return rolid;
	}
	public void setRolid(int rolid) {
		this.rolid = rolid;
	}
	public String getRol() {
		return Rol;
	}
	public void setRol(String rol) {
		Rol = rol;
	}
	public String getKey_encriptacion() {
		return key_encriptacion;
	}
	public void setKey_encriptacion(String key_encriptacion) {
		this.key_encriptacion = key_encriptacion;
	}
	public String getCod_verificacion() {
		return cod_verificacion;
	}
	public void setCod_verificacion(String cod_verificacion) {
		this.cod_verificacion = cod_verificacion;
	}
	
}