package servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Info_Footer;
import datos.Dt_InfoFooter;

/**
 * Servlet implementation class Sl_GestionInfo_Footer
 */
@WebServlet("/Sl_GestionInfo_Footer")

public class Sl_GestionInfo_Footer extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Sl_GestionInfo_Footer() {
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
	
		int Info_FooterID =0;
		Info_FooterID = Integer.parseInt(request.getParameter("info_footerID"));
		Dt_InfoFooter dtfoo = new Dt_InfoFooter();
		
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
		Dt_InfoFooter dtfoo = new Dt_InfoFooter();
		Info_Footer foo = new Info_Footer();
		
		foo.setCorreo(request.getParameter("txtCorreo"));
		//foo.setDescripcion(request.getParameter("txtDescripcion"));
		foo.setDireccion(request.getParameter("txtDireccion"));
		foo.setExtension(request.getParameter("txtExtension"));
		foo.setTelefono(Integer.parseInt(request.getParameter("txtTelefono")));
		
		
		//rol.setRolID(Integer.parseInt(request.getParameter("rolID")));
		//rol.setRol(request.getParameter("txtRol"));
		//rol.setRoldescripcion(request.getParameter("txtdesc"));

		switch (opc) {
		case 1: {

			try {
				foo.setInfo_footerID(Integer.parseInt(request.getParameter("info_footerID")));
				// PARA GUARDAR LA FECHA Y HORA DE MODIFICACION
				Date fechaSistema = new Date();
				foo.setFechaModificacion(new java.sql.Timestamp(fechaSistema.getTime()));
				System.out.println("foo.getFechaModificacion(): " + foo.getFechaModificacion());
				if (dtfoo.modificarFooter(foo)) {
					response.sendRedirect("index.jsp?msj=3");
				} 
				else {
					response.sendRedirect("index.jsp?msj=4");
				}

			} catch (Exception e) {
				System.out.println("Sl_GestionInfo_Footer, el error es: " + e.getMessage());
				e.printStackTrace();
			}
			break;

		}

		default:
			response.sendRedirect("index.jsp?msj=5");
			break;
		}
	}

}