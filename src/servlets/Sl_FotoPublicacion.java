package servlets;

import java.io.File;	
import java.io.IOException;
import java.util.Arrays;
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

import datos.Dt_Publicaciones;
import entidades.Publicaciones;

/**
 * Servlet implementation class Sl_FotoPublicacion
 */
@WebServlet("/Sl_FotoPublicacion")
public class Sl_FotoPublicacion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sl_FotoPublicacion() {
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
		
		try
		{
			Dt_Publicaciones dtpu = new Dt_Publicaciones();
			
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			String path = getServletContext().getRealPath("/");
			List<FileItem> items = upload.parseRequest(request);
			File fichero = null;
			
			String idpubli = null;
			String rutaFichero = null;
			
			for(FileItem item: items)
			{
				FileItem uploaded = item;
				if(uploaded.isFormField())
				{
					String key = uploaded.getFieldName();
					String valor = uploaded.getString();
					if(key.equals("idpubli"))
					{
						idpubli = valor;
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
						
						rutaFichero = "fotoPubli_"+idpubli+".jpg";
						path = "C:\\payara5\\glassfish\\PWACP-fotos_publicaciones\\";
						System.out.println(path+rutaFichero);
						
						fichero = new File(path+rutaFichero);
						System.out.println(path+rutaFichero);
						
						///////// GUARDAR EN EL SERVIDOR //////////////
						uploaded.write(fichero);
						
						System.out.println("SERVIDOR: FOTO GUARDADA CON EXITO!!!");
						/////// ACTUALIZAMOS EL CAMPO URLFOTO EN LA BASE DE DATOS
						String url = "PWACP-fotos_publicaciones/"+rutaFichero;
						
						if(dtpu.guardarFotoPubli(Integer.parseInt(idpubli),url))
						{
							response.sendRedirect("tblPublicaciones.jsp?msj=7");
						}
						else
						{
							response.sendRedirect("tblPublicaciones.jsp?msj=8");
						}
					}
					else
					{
						System.out.println("SERVIDOR: VERIFIQUE QUE EL ARCHIVO CUMPLA CON LAS ESPECIFICACIONES REQUERIDAS!!!");
						response.sendRedirect("tblPublicaciones.jsp?msj=9");						
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
