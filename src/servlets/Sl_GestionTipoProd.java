package servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.TipoProducto;
import datos.Dt_TipoProd;
import negocio.Ng_TipoProd;

/**
 * Servlet implementation class Sl_GestionRol
 */
@WebServlet("/Sl_GestionTipoProd")

public class Sl_GestionTipoProd extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Sl_GestionTipoProd() {
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
	
		int TipoProdID =0;
		TipoProdID = Integer.parseInt(request.getParameter("TipoProdID"));
		Dt_TipoProd dttp = new Dt_TipoProd();
		
		if(dttp.eliminarTipoProducto(TipoProdID)) {
        	response.sendRedirect("tblTipoProd.jsp?msj=5");
        }
        else {
        	response.sendRedirect("tblTipoProd.jsp?msj=6");
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
		Dt_TipoProd dttp = new Dt_TipoProd();
		TipoProducto tp = new TipoProducto();
		Ng_TipoProd ngtp = new Ng_TipoProd();
		
		//rol.setRolID(Integer.parseInt(request.getParameter("rolID")));
		tp.setTipoproducto(request.getParameter("txtTipoProducto"));
		tp.setDescripcion(request.getParameter("txtDescripcion"));

		switch (opc) {
		case 1: {

			try {
				// PARA GUARDAR LA FECHA Y HORA DE CREACION
				Date fechaSistema = new Date();
				tp.setFechaCreacion(new java.sql.Timestamp(fechaSistema.getTime()));
				System.out.println("tp.getFechaCreacion(): " + tp.getFechaCreacion());
				if (ngtp.existeTipoProd(tp.getTipoproducto())) {
					response.sendRedirect("NuevoTipoProd.jsp?msj=existe");
				} else {
					if(dttp.guardarTipoProd(tp)) {
			        	response.sendRedirect("tblTipoProd.jsp?msj=1");
			        }
			        else {
			        	response.sendRedirect("tblTipoProd.jsp?msj=2");
			        }
				}

			} catch (Exception e) {
				System.out.println("Sl_GestionTipoProd, el error es: " + e.getMessage());
				e.printStackTrace();
			}

			break;
		}

		case 2: {

			try {
				tp.setTipoproductoid(Integer.parseInt(request.getParameter("TipoProdID")));
				// PARA GUARDAR LA FECHA Y HORA DE MODIFICACION
				Date fechaSistema = new Date();
				tp.setFechaModificacion(new java.sql.Timestamp(fechaSistema.getTime()));
				System.out.println("tp.getFechaModificacion(): " + tp.getFechaModificacion());
				
				if(ngtp.existeTipoProdA(tp.getTipoproductoid(), tp.getTipoproducto())) {
		        	response.sendRedirect("EditarTipoProd.jsp?TipoProdID="+tp.getTipoproductoid()+"&msj=existe");
		        }else {
		        	if (dttp.modificarTipoProd(tp)) {
						response.sendRedirect("tblTipoProd.jsp?msj=3");
					} 
					else {
						response.sendRedirect("tblTipoProd.jsp?msj=4");
					}
		        }

			} catch (Exception e) {
				System.out.println("Sl_GestionTipoProd, el error es: " + e.getMessage());
				e.printStackTrace();
			}
			break;

		}

		default:
			response.sendRedirect("tblTipoProd.jsp?msj=5");
			break;
		}
	}

}
