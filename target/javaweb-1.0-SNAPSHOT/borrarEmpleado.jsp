<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/4d05cb5937.js" crossorigin="anonymous"></script>
        <title>Borrar Empleado</title>
    </head>
    <body>
        <%
                Connection con = null;
                Statement st = null;

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/jsp?user=root&password=root");
                    st = con.createStatement();
                    st.executeUpdate("DELETE FROM `empleados` WHERE id='"+request.getParameter("id") +"';");
                    request.getRequestDispatcher("index.jsp").forward(request,response);  
                }
            catch (Exception e) {
                out.print("Error mysql" + e);
            }
        %>


    </body>
</html>
