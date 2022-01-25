package servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Pais;
import negocio.Ng_Pais;
import datos.Dt_Pais;

/**
 * Servlet implementation class Sl_GestionPais
 */
@WebServlet("/Sl_GestionPais")

public class Sl_GestionPais extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Sl_GestionPais() {
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
	
		int PaisID =0;
		PaisID = Integer.parseInt(request.getParameter("PaisID"));
		Dt_Pais dtpa = new Dt_Pais();
		
		if(dtpa.eliminarPais(PaisID)) {
        	response.sendRedirect("tblPais.jsp?msj=5");
        }
        else {
        	response.sendRedirect("tblPais.jsp?msj=6");
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
		Dt_Pais dtpa = new Dt_Pais();
		Pais pa = new Pais();
		Ng_Pais ngpa = new Ng_Pais();
		
		//rol.setRolID(Integer.parseInt(request.getParameter("rolID")));
		pa.setNombre(request.getParameter("txtNombre"));
		
		String idr = "";
		idr = request.getParameter("cbxRegion");
		System.out.println("idr = " + idr);
		idr = idr == null?"0":idr;
		
		pa.setRegionID(Integer.parseInt(idr));

		switch (opc) {
		case 1: {

			try {
				// PARA GUARDAR LA FECHA Y HORA DE CREACION
				Date fechaSistema = new Date();
				pa.setFechaCreacion(new java.sql.Timestamp(fechaSistema.getTime()));
				System.out.println("pa.getFechaCreacion(): " + pa.getFechaCreacion());
				
					
				  if(ngpa.existePais(pa.getNombre())) {
			        	response.sendRedirect("NuevoPais.jsp?msj=existe");
			        }
			        else {
			        	if(dtpa.guardarPaisReg(pa)) {
				        	response.sendRedirect("tblPais.jsp?msj=1");
				        }
				        else {
				        	response.sendRedirect("tblPais.jsp?msj=2");
				        }
			        }
					

			} catch (Exception e) {
				System.out.println("Sl_GestionPais, el error es: " + e.getMessage());
				e.printStackTrace();
			}

			break;
		}

		case 2: {
			
			pa.setPaisID(Integer.parseInt(request.getParameter("PaisID")));
			pa.setEstado(2);

			try {
				//pa.setPaisID(Integer.parseInt(request.getParameter("PaisID")));
				// PARA GUARDAR LA FECHA Y HORA DE MODIFICACION
				Date fechaSistema = new Date();
				pa.setFechaModificacion(new java.sql.Timestamp(fechaSistema.getTime()));
				System.out.println("pa.getFechaModificacion(): " + pa.getFechaModificacion());

				if(ngpa.existePaisM(pa.getPaisID(), pa.getNombre())) {
		        	response.sendRedirect("EditarPais.jsp?paisID="+pa.getPaisID()+"&msj=existe");
		        }
		        else {
		        	if(dtpa.modificarPaisReg(pa)) {
			        	response.sendRedirect("tblPais.jsp?msj=3");
			        }
			        else {
			        	response.sendRedirect("tblPais.jsp?msj=4");
			        }
		        }

			} catch (Exception e) {
				System.out.println("Sl_GestionPais, el error es: " + e.getMessage());
				e.printStackTrace();
			}
			break;

		}

		default:
			response.sendRedirect("tblPais.jsp?msj=5");
			break;
		}
	}

}