package servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Rol;
import datos.Dt_Rol;
import negocio.Ng_Rol;
import negocio.Ng_Usuario;

/**
 * Servlet implementation class Sl_GestionRol
 */
@WebServlet("/Sl_GestionRol")

public class Sl_GestionRol extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Sl_GestionRol() {
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
	
		int RolID =0;
		RolID = Integer.parseInt(request.getParameter("RolID"));
		Dt_Rol dtro = new Dt_Rol();
		
		if(dtro.eliminarRol(RolID)) {
        	response.sendRedirect("tblRol.jsp?msj=5");
        }
        else {
        	response.sendRedirect("tblRol.jsp?msj=6");
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
		Dt_Rol dtro = new Dt_Rol();
		Rol rol = new Rol();
		Ng_Rol ngr = new Ng_Rol();
		
		//rol.setRolID(Integer.parseInt(request.getParameter("rolID")));
		rol.setRol(request.getParameter("txtRol"));
		rol.setRoldescripcion(request.getParameter("txtdesc"));

		switch (opc) {
		case 1: {

			try {
				// PARA GUARDAR LA FECHA Y HORA DE CREACION
				Date fechaSistema = new Date();
				rol.setFechaCreacion(new java.sql.Timestamp(fechaSistema.getTime()));
				System.out.println("rol.getFechaCreacion(): " + rol.getFechaCreacion());
				if (ngr.existeRol(rol.getRol())) {
					response.sendRedirect("NuevoRol.jsp?msj=existe");
				} else {
					if(dtro.guardarRol(rol)) {
			        	response.sendRedirect("tblRol.jsp?msj=1");
			        }
			        else {
			        	response.sendRedirect("tblRol.jsp?msj=2");
			        }
				}

			} catch (Exception e) {
				System.out.println("Sl_GestionRol, el error es: " + e.getMessage());
				e.printStackTrace();
			}

			break;
		}

		case 2: {

			try {
				rol.setRolID(Integer.parseInt(request.getParameter("RolID")));
				// PARA GUARDAR LA FECHA Y HORA DE MODIFICACION
				Date fechaSistema = new Date();
				rol.setFechaModificacion(new java.sql.Timestamp(fechaSistema.getTime()));
				System.out.println("rol.getFechaModificacion(): " + rol.getFechaModificacion());
				
				if(ngr.existeRolA(rol.getRolID(), rol.getRol())) {
		        	response.sendRedirect("EditarRol.jsp?RolID="+rol.getRolID()+"&msj=existe");
		        }else {
		        	if (dtro.modificarRol(rol)) {
						response.sendRedirect("tblRol.jsp?msj=3");
					} 
					else {
						response.sendRedirect("tblRol.jsp?msj=4");
					}
		        }

			} catch (Exception e) {
				System.out.println("Sl_GestionRol, el error es: " + e.getMessage());
				e.printStackTrace();
			}
			break;

		}

		default:
			response.sendRedirect("tblRol.jsp?msj=5");
			break;
		}
	}

}
