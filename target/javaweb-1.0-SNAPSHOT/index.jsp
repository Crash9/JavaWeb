<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/4d05cb5937.js" crossorigin="anonymous"></script>
        <title>Greetings</title>
    </head>
    <body>
        <%
            Connection con=null;
            Statement st=null;
            ResultSet rs=null;
        %>
        <div class="container mt-5">
            <div class="row">                
                <div class="col-sm">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col" colspan="4" class="text-center"><h3>Empleados</h3></th>
                                <th scope="col">
                                    <a href="nuevoEmpleado.jsp"><i class="fas fa-user-plus"></i></a>
                                </th>
                            </tr>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">País</th>
                                <th scope="col">Telefono</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    con = DriverManager.getConnection("jdbc:mysql://localhost/jsp?user=root&password=root");
                                    st = con.createStatement();
                                    rs = st.executeQuery("SELECT * FROM `empleados`");
                                    while (rs.next()) {
                            %>
                            <tr>
                                <th scope="row"><%=rs.getString(1)%></th>
                                <td><%=rs.getString(2)%></td>
                                <td><%=rs.getString(3)%></td>
                                <td><%=rs.getString(4)%></td>
                                <td>
                                    <a href="editarEmpleado.jsp?id=<%=rs.getString(1)%>&nombre=<%=rs.getString(2)%>&direccion=<%=rs.getString(3)%>&telefono=<%=rs.getString(4)%>"><i class="fas fa-pencil-alt"></i></a>
                                    <a href="borrarEmpleado.jsp?id=<%=rs.getString(1)%>" class="ml-2"><i class="fas fa-trash"></i></a>
                                </td>
                                
                            </tr>
                            <%
                                    }
                                } catch (Exception e) {
                                    out.print("Error mysql"+e);
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
