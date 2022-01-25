package servlets;

import java.io.File;	
import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import datos.Dt_Arbol;
import datos.Dt_Mapa;
import entidades.Arbol;
import entidades.Mapa;
import negocio.Ng_Arbol;

/**
 * Servlet implementation class Sl_FotoMapa
 */
@WebServlet("/Sl_FotoMapa")
public class Sl_FotoMapa extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sl_FotoMapa() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		//Dt_Mapa dtmp = new Dt_Mapa();
		Mapa mp = new Mapa();
		
		
		
		//fam.setArbolID(Integer.parseInt(request.getParameter("ArbolID")));
//		/mp.setNombre(request.getParameter("txtNombre"));
		
		
		try
		{
			Dt_Mapa dtmp = new Dt_Mapa();
			//mp.setMapaid(Integer.parseInt(request.getParameter("idMapa")));
			
			//Date fechaSistema = new Date();
	        //mp.setFechaModificacion(new java.sql.Timestamp(fechaSistema.getTime()));
			
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			String path = getServletContext().getRealPath("/");
			List<FileItem> items = upload.parseRequest(request);
			File fichero = null;
			
			String idmapa = null;
			String rutaFichero = null;
			
			for(FileItem item: items)
			{
				FileItem uploaded = item;
				if(uploaded.isFormField())
				{
					String key = uploaded.getFieldName();
					String valor = uploaded.getString();
					if(key.equals("idmapa"))
					{
						idmapa = valor;
					}
					
				}
			}
			for(FileItem item : items)
			{
				FileItem uploaded = item;
				if(!uploaded.isFormField())
				{
					/////////TAMA�O DEL ARCHIVO ////////
					long size = uploaded.getSize();
					System.out.println("size: "+size);
					
					/////// GUARDAMOS EN UN ARREGLO LOS FORMATOS QUE SE DESEAN PERMITIR
					List<String> formatos = Arrays.asList("image/jpeg");
					
					////// COMPROBAR SI EL TAMA�O Y FORMATO SON PERMITIDOS //////////
//					if(formatos.contains(uploaded.getContentType()) && size <= 102400)
					if(formatos.contains(uploaded.getContentType()))
					{
						System.out.println("Filetype: "+uploaded.getContentType());
						
						rutaFichero = "fotoMapa_"+idmapa+".jpg";
						path = "C:\\payara5\\glassfish\\PWACP-fotos_mapa\\";
						System.out.println(path+rutaFichero);
						
						fichero = new File(path+rutaFichero);
						System.out.println(path+rutaFichero);
						
						///////// GUARDAR EN EL SERVIDOR //////////////
						uploaded.write(fichero);
						
						System.out.println("SERVIDOR: FOTO GUARDADA CON EXITO!!!");
						/////// ACTUALIZAMOS EL CAMPO URLFOTO EN LA BASE DE DATOS
						String url = "PWACP-fotos_mapa/"+rutaFichero;
						
						if(dtmp.guardarFotoMapa(Integer.parseInt(idmapa),url))
						{
							
							response.sendRedirect("mapa.jsp?msj=1");
							
						}
						else
						{
							response.sendRedirect("mapa.jsp?msj=2");
						}
					}
					else
					{
						System.out.println("SERVIDOR: VERIFIQUE QUE EL ARCHIVO CUMPLA CON LAS ESPECIFICACIONES REQUERIDAS!!!");
						response.sendRedirect("mapa.jsp?msj=3");						
					}
				}
				
				
			}
		}
		catch(Exception e)
		{
			System.out.println("SERVLET: ERROR AL SUBIR LA FOTO: " + e.getMessage());
		}
		
		
		
		
		
		
		
		
		
	}

}
