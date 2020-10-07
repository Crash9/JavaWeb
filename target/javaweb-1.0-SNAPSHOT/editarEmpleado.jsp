<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/4d05cb5937.js" crossorigin="anonymous"></script>
        <title>Editar Empleado</title>
    </head>
    <body>
        <%
            String id = request.getParameter("id");
            String nombre = request.getParameter("nombre");
            String direccion = request.getParameter("direccion");
            String telefono = request.getParameter("telefono");

        %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form action="editarEmpleado.jsp" method="get">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" id="nombre" value="<%=nombre%>" name="nombre" placeholder="Ingrese su nombre" required="required">
                        </div>
                        <div class="form-group">
                            <label for="direccion">País</label>
                            <input type="text" class="form-control" id="direccion" value="<%=direccion%>"name="direccion" placeholder="Ingrese su direccion" required="required">
                        </div>
                        <div class="form-group">
                            <label for="telefono">Telefono</label>
                            <input type="text" class="form-control" id="telefono" value="<%=telefono%>" name="telefono" placeholder="Ingrese su telefono" required="required">
                        </div>
                        <button type="submit" name="enviar" class="btn btn-primary" id="enviar">Guardar <i class="fas fa-save"></i></button>
                        <input type="hidden" name="id" value="<%=id%>">
                        <a href="index.jsp" class="btn btn-danger">Cancelar <i class="fa fa-ban" aria-hidden="true"></i></a>
                    </form>
                </div>
            </div>
        </div>
        <%
            if (request.getParameter("enviar") != null) {

                try {
                    Connection con = null;
                    Statement st = null;

                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/jsp?user=root&password=root");
                    st = con.createStatement();
                    st.executeUpdate("update empleados set nombre='" + nombre + "',direccion='" + direccion + "',telefono='" + telefono + "' where id='"+id+"';");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e);
                }

            }
        %>
    </body>
</html>
