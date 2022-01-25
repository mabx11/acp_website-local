package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.Info_Footer;

public class Dt_InfoFooter {
	
	PoolConexion pc = PoolConexion.getInstance(); 
	Connection c = null;
	
	private ResultSet rsInfo_Footer = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
		// Metodo para llenar el ResultSet
		public void llenaRsInfo_Footer(Connection c){
			try{
				ps = c.prepareStatement("select * from public.\"info_footer\"", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rsInfo_Footer = ps.executeQuery();
			}
			catch (Exception e){
				System.out.println("DATOS: ERROR EN LISTAR DATOS FOOTER "+ e.getMessage());
				e.printStackTrace();
			}
		}
		
		
		//Metodo para visualizar opciones de footer
		public ArrayList<Info_Footer> listaFooter(){
			ArrayList<Info_Footer> listFooter = new ArrayList<Info_Footer>();
			try{
				c = PoolConexion.getConnection();
				ps = c.prepareStatement("select * from public.\"info_footer\"", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rs = ps.executeQuery();
				while(rs.next()){
					Info_Footer foo = new Info_Footer();
					foo.setInfo_footerID(rs.getInt("info_footerID"));
					foo.setTelefono(rs.getInt("telefono"));
					foo.setExtension(rs.getString("extencion"));
					foo.setDireccion(rs.getString("direccion"));
					foo.setCorreo(rs.getString("correo"));
					foo.setDescripcion(rs.getString("descripcion"));
					listFooter.add(foo);
				}
			}
			catch (Exception e){
				System.out.println("DATOS: ERROR EN LISTAR FOOTER "+ e.getMessage());
				e.printStackTrace();
			}
			finally{
				try {
					if(rs != null){
						rs.close();
					}
					if(ps != null){
						ps.close();
					}
					if(c != null){
						PoolConexion.closeConnection(c);
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			return listFooter;
		}
		
		// Metodo para visualizar los datos de footer específico
		public Info_Footer getInfo_Footer(int info_FooterID)
		{
			Info_Footer foo = new Info_Footer();
			try
			{
				c = PoolConexion.getConnection();
				ps = c.prepareStatement("select * from public.\"info_footer\" where \"info_footerid\"=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				ps.setInt(1, info_FooterID);
				rs = ps.executeQuery();
				if(rs.next())
				{
					foo.setInfo_footerID(info_FooterID);
					foo.setTelefono(rs.getInt("telefono"));
					foo.setExtension(rs.getString("extencion"));
					foo.setDireccion(rs.getString("direccion"));
					foo.setCorreo(rs.getString("correo"));
					foo.setDescripcion(rs.getString("descripcion"));
					foo.setUsuarioID(84);
					
				} 
			}
			catch (Exception e)
			{
				System.out.println("DATOS ERROR getInfo_FooterID(): "+ e.getMessage());
				e.printStackTrace();
			}
			finally
			{
				try {
					if(rs != null){
						rs.close();
					}
					if(ps != null){
						ps.close();
					}
					if(c != null){
						PoolConexion.closeConnection(c);
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			return foo;
		}
		
		// Metodo para modificar footer
		public boolean modificarFooter(Info_Footer foo)
		{
			boolean modificado=false;	
			try
			{
				c = PoolConexion.getConnection();
				this.llenaRsInfo_Footer(c);
				rsInfo_Footer.beforeFirst();
				while (rsInfo_Footer.next())
				{
					if(rsInfo_Footer.getInt(6)==foo.getInfo_footerID())
					{

						rsInfo_Footer.updateString("correo", foo.getCorreo());
						//rsInfo_Footer.updateString("descripcion", foo.getDescripcion());
						rsInfo_Footer.updateString("direccion", foo.getDireccion());
						rsInfo_Footer.updateString("extencion", foo.getExtension());
						rsInfo_Footer.updateInt("telefono", foo.getTelefono());
						rsInfo_Footer.updateTimestamp("fechamodificacion", foo.getFechaModificacion());
						rsInfo_Footer.updateRow();
						modificado=true;
						break;
					}
				}
			}
			catch (Exception e)
			{
				System.err.println("ERROR AL ACTUALIZAR FOOTER "+e.getMessage());
				e.printStackTrace();
			}
			finally
			{
				try {
					if(rsInfo_Footer != null){
						rsInfo_Footer.close();
					}
					if(c != null){
						PoolConexion.closeConnection(c);
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return modificado;
		}
}
