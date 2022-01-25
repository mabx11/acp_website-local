package entidades;

import java.sql.Timestamp;

public class Home {
  
	//Atributos
	private String descrip_pag;
	private String historia;
	private String mision;
	private String vision;
	private Timestamp fechaModificacion;
	private int homeID;
	private int usuarioID;
	private String banner;
	
	
	//Metodos
	public String getDescrip_pag() {
		return descrip_pag;
	}
	public void setDescrip_pag(String descrip_pag) {
		this.descrip_pag = descrip_pag;
	}
	public String getHistoria() {
		return historia;
	}
	public void setHistoria(String historia) {
		this.historia = historia;
	}
	public String getMision() {
		return mision;
	}
	public void setMision(String mision) {
		this.mision = mision;
	}
	public String getVision() {
		return vision;
	}
	public void setVision(String vision) {
		this.vision = vision;
	}
	public Timestamp getFechaModificacion() {
		return fechaModificacion;
	}
	public void setFechaModificacion(Timestamp fechaModificacion) {
		this.fechaModificacion = fechaModificacion;
	}
	public int getHomeID() {
		return homeID;
	}
	public void setHomeID(int homeID) {
		this.homeID = homeID;
	}
	public int getUsuarioID() {
		return usuarioID;
	}
	public void setUsuarioID(int usuarioID) {
		this.usuarioID = usuarioID;
	}
	public String getBanner() {
		return banner;
	}
	public void setBanner(String banner) {
		this.banner = banner;
	}
	
}
