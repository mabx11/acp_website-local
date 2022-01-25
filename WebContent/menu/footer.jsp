<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="entidades.Info_Footer, datos.Dt_InfoFooter, java.util.*;" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
</head>

<body>
  <!-- ======= Footer ======= --> 
  <footer id="footer" class="footer">

    <div class="container">
    
    <%
	    ArrayList<Info_Footer> listFooter = new ArrayList<Info_Footer>();
	    Dt_InfoFooter dtfo = new Dt_InfoFooter();
	    listFooter = dtfo.listaFooter();
     %>

      <h4><strong>Contacto</strong></h4>
      <%
      	for (Info_Footer fo : listFooter) {
      %>
      <p>
        <%=fo.getDireccion() %><br>
        Managua, Nicaragua<br><br>
        <strong>Teléfono: </strong><%=fo.getTelefono() %><br>
        <strong>Ext: </strong><%=fo.getExtension() %><br>
        <strong>Correo: </strong><%=fo.getCorreo() %><br>
      </p>      
       <%
           }
       %>

      <br><center><hr></center>

      <div class="credits">
        Designed by Tiny Trees®
      </div>

    </div>
  </footer>
  <!-- End Footer -->
</body>

</html>