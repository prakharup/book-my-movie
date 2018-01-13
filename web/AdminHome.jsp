<%-- 
    Document   : AdminHome
    Created on : Jan 7, 2018, 10:55:39 PM
    Author     : PRAKHAR
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <nav class="navbar navbar-default" ng-hide role="navigation">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="index.jsp">Home</a>
                            
                        </div>
                        <div class="collapse-navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li class="active">
                                <a href="AdminHome.jsp">Manage Theatres</a>
                                
                            </li>
                            <li><a href="AddMovie.jsp">Manage Movies</a></li>
                            <li><a href="Mapping.jsp">Map Theatres and Movies</a></li>
                            <li>
                                    <a href="#">Delete Mapping</a>
                                </li>
                           
                        </ul>
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="#">Welcome </a></li>
                                <li><a href="adminlogout.jsp">Logout</a></li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
            <div class="row" style="background-color:#f8f8f8;">
                <div class="col-md-12">
                    <p align="centre"> <i>
                            <% String thmsg = (String)request.getAttribute("thmsg");
                            if (thmsg == null) {
                            out.println("");
                        } else {
                            out.println(thmsg);
                        }
                    %>
                        </i>
                       
                    </p>
                        <h3>Add Theatres</h3>
                        <form role="form" class="form-inline" method="post" action="AddTheatre">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Theatre Name</th>
                                        <th>Theatre Location</th>
                                        <th>Theatre City</th>
                                    </tr>
                                </thead>
                                <tbody>
                                     <tr>
                                    <td>
                                        <input type="text" name="thname" size="25"/>
                                    </td>
                                    <td>
                                        <input type="text" name="thlocation" size="25"/>
                                    </td>
                                    <td>
                                        <input type="text" name="thcity" size="25"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" align="center">
                                        <input type="submit" name="Add theater" class="btn btn-lg btn-primary"/>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                        <h3>Theatres Added</h3>
                         <%
                        Connection con;
                        PreparedStatement st;
                        ResultSet rs;
                        try {
                            Class.forName("oracle.jdbc.driver.OracleDriver");
                            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "prakhar");
                            st = con.prepareStatement("select * from theatre");
                            rs = st.executeQuery();%>                        
                    <table class="table">
                        <thead>
                            <tr>
                                <th> Theater Name </th>
                                <th> City </th>
                                <th> Location </th>
                                <th> &nbsp; </th>                                
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            while(rs.next())
                            {
                                out.println("<tr>");
                                out.println("<td>"+rs.getString(2)+"</td>");
                                out.println("<td>"+rs.getString(3)+"</td>");
                                out.println("<td>"+rs.getString(4)+"</td>");
                                out.println("<td><a href=\"DeleteServlet?id="+rs.getString(1)+"\"><input type=\"button\" value=\"&times;\" class=\"btn btn-danger\"/></a></td>");
                                out.println("</tr>");
                            }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                </div>
            </div>
    </body>
</html>
