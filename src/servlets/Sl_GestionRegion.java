package servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Region;
import negocio.Ng_Region;
import datos.Dt_Region;

/**
 * Servlet implementation class Sl_GestionRegion
 */
@WebServlet("/Sl_GestionRegion")

public class Sl_GestionRegion extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Sl_GestionRegion() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	
		int RegionID =0;
		RegionID = Integer.parseInt(request.getParameter("RegionID"));
		Dt_Region dtre = new Dt_Region();
		
		if(dtre.eliminarReg(RegionID)) {
        	response.sendRedirect("tblRegion.jsp?msj=5");
        }
        else {
        	response.sendRedirect("tblRegion.jsp?msj=6");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);

		// obtenemos el valor de opcion
		int opc = 0;
		opc = Integer.parseInt(request.getParameter("opcion"));

		// CONSTRUIR EL OBJETO ROL
		Dt_Region dtre = new Dt_Region();
		Region reg = new Region();
		Ng_Region ngre = new Ng_Region();
		
		reg.setNombre(request.getParameter("txtname"));
		
		//rol.setRolID(Integer.parseInt(request.getParameter("rolID")));
		//rol.setRol(request.getParameter("txtRol"));
		//rol.setRoldescripcion(request.getParameter("txtdesc"));

		switch (opc) {
		case 1: {

			try {
				// PARA GUARDAR LA FECHA Y HORA DE CREACION
				Date fechaSistema = new Date();
				reg.setFechaCreacion(new java.sql.Timestamp(fechaSistema.getTime()));
				System.out.println("reg.getFechaCreacion(): " + reg.getFechaCreacion());
				
				
				  if(ngre.existeRegion(reg.getNombre())) {
			        	response.sendRedirect("NuevaRegion.jsp?msj=existe");
			        }
			        else {
			        	if(dtre.guardarReg(reg)) {
				        	response.sendRedirect("tblRegion.jsp?msj=1");
				        }
				        else {
				        	response.sendRedirect("tblRegion.jsp?msj=2");
				        }
			        }
					

			} catch (Exception e) {
				System.out.println("Sl_GestionRegion, el error es: " + e.getMessage());
				e.printStackTrace();
			}

			break;
		}

		case 2: {

			try {
				reg.setRegionID(Integer.parseInt(request.getParameter("RegionID")));
				// PARA GUARDAR LA FECHA Y HORA DE MODIFICACION
				Date fechaSistema = new Date();
				reg.setFechaModificacion(new java.sql.Timestamp(fechaSistema.getTime()));
				System.out.println("reg.getFechaModificacion(): " + reg.getFechaModificacion());

					if(ngre.existeRegionM(reg.getRegionID(), reg.getNombre())) {
			        	response.sendRedirect("EditarRegion.jsp?regionID="+reg.getRegionID()+"&msj=existe");
			        }
			        else {
			        	if(dtre.modificarReg(reg)) {
				        	response.sendRedirect("tblRegion.jsp?msj=3");
				        }
				        else {
				        	response.sendRedirect("tblRegion.jsp?msj=4");
				        }
			        }

			} catch (Exception e) {
				System.out.println("Sl_GestionRegion, el error es: " + e.getMessage());
				e.printStackTrace();
			}
			break;

		}

		default:
			response.sendRedirect("tblRegion.jsp?msj=5");
			break;
		}
	}

}
