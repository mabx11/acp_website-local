package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import entidades.Opciones;
import entidades.Rol;

public class Dt_Opciones {
	
	//Atributos
	
	PoolConexion pc = PoolConexion.getInstance(); 
	Connection c = null;
	private ResultSet rsOpc = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
	// Metodo para llenar el RusultSet
	
	public void llenaRsOpc(Connection c){
		try{
			ps = c.prepareStatement("SELECT * from opciones", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rsOpc = ps.executeQuery();
		}
		catch (Exception e){
			System.out.println("DATOS: ERROR EN LISTAR OPCIONES "+ e.getMessage());
			e.printStackTrace();
		}
	}
	
	//Metodo para visualizar opciones registradas y activas
	
	public ArrayList<Opciones> listaOpcActivos(){
		ArrayList<Opciones> listOpc = new ArrayList<Opciones>();
		try{
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.opciones where estado<>3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rs = ps.executeQuery();
			while(rs.next()){
				Opciones opc = new Opciones();
				opc.setOpcionesID(rs.getInt("opcionesID"));
				opc.setOpcion(rs.getString("opcion"));
				opc.setDescripcion(rs.getString("descripcion"));
				opc.setEstado(rs.getInt("estado"));
				listOpc.add(opc);
			}
		}
		catch (Exception e){
			System.out.println("DATOS: ERROR EN LISTAR OPCIONES "+ e.getMessage());
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
		return listOpc;
	}
	
	// Metodo para visualizar los datos de un rol específico
			public Opciones getOpc(int OpcionesID)
			{
				Opciones opc = new Opciones();
				try
				{
					c = PoolConexion.getConnection();
					ps = c.prepareStatement("select * from public.opciones where estado <> 3 and opcionesid=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					ps.setInt(1, OpcionesID);
					rs = ps.executeQuery();
					if(rs.next())
					{
						opc.setOpcionesID(OpcionesID);
						opc.setDescripcion(rs.getString("descripcion"));
						opc.setEstado(rs.getInt("estado"));
					}
				}
				catch (Exception e)
				{
					System.out.println("DATOS ERROR getOpc(): "+ e.getMessage());
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
				
				return opc;
			}

}
