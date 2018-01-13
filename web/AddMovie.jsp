<%-- 
    Document   : AddMovie
    Created on : Jan 9, 2018, 3:51:56 PM
    Author     : PRAKHAR
--%>
<%@page import="javax.json.JsonObject,org.json.simple.JSONArray,javax.json.JsonArray,org.json.simple.JSONObject,org.json.simple.parser.JSONParser,java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>book my movie</title>
         <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                     <nav class="navbar navbar-default" ng-hide role="navigation">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                            </button> <a class="navbar-brand" href="index.jsp">Home</a>
                        </div>
                         <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav">
                                <li>
                                    <a href="AdminHome.jsp">Manage Theaters</a>
                                </li>
                                <li class="active">
                                    <a href="AddMovie.jsp">Manage Movies</a>
                                </li>
                                <li>
                                    <a href="Mapping.jsp">Map Theaters and Movies</a>
                                </li>
                                <li>
                                    <a href="#">Delete Mapping</a>
                                </li>
                            </ul>                            
                        </div>
                    </nav>
                </div>
            </div>
            <div class="row" style="background-color: #f8f8f8;">
                <div class="col-md-12">
                    <h3>Add Movies</h3>
                    <form role="form" class="form-inline" method="get" action="SearchMovie">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Movie Name</th>
                                    <th>Year Of Release</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input type="text" name="movname" size="25"/>
                                    </td>
                                    <td>
                                        <input type="text" name="movieyear" size="25"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <td colspan="2" align="center">
                                        <input type="submit" value="Search Movie" class="btn btn-lg btn-primary"/>
                                    </td>

                            
                                </tr>
                            </tbody>
                        </table>
                                </form>
                               <p align="center"><i>
                            <%
                                String movmsg = (String) request.getAttribute("movmsg");
                                if (movmsg == null) {
                                    out.println("");
                                } else {
                                    out.println(movmsg);
                                }
                            %>
                        </i></p>
                    <form action="AddMovie" method="post">
                        <table class="table table-striped">
                            <tr>
                                <th>Poster</th>
                                <th>Title</th>
                                <th>Release Year</th>
                                <th>Language</th>
                                <th>Plot</th>
                                 <th>&nbsp;</th>
                                <th>&nbsp;</th>
                            </tr>      
                            <%
                                String jsonstr = (String) request.getAttribute("jsonstr");
                                if (jsonstr == null) {
                                    out.println("");
                                }%><% else {
                                        JSONParser parser = new JSONParser();
                                        try {

                                            Object json = parser.parse(jsonstr);
                                            JSONObject jsonobj = (JSONObject) json;
                                            JSONArray jsonarray = (JSONArray) jsonobj.get("results");
                                            JSONObject jsonobj1 = (JSONObject) jsonarray.get(0);
                                            String base_url = "http://image.tmdb.org/t/p/w92";
                                            String poster = base_url.concat(jsonobj1.get("poster_path").toString());
                                            //hidden fields start
                                            out.println("<tr>");
                                            out.println("<td><input type=\"hidden\" name=\"poster\" value=\"" + poster + "\"/></td>");
                                            out.println("<td><input type=\"hidden\" name=\"title\" value=\"" + jsonobj1.get("title") + "\"/></td>");
                                            out.println("<td><input type=\"hidden\" name=\"year\" value=\"" +jsonobj1.get("release_date").toString().substring(0,4) + "\"/></td>");
                                            out.println("<td><input type=\"hidden\" name=\"language\" value=\"" + jsonobj1.get("original_language").toString() + "\"/></td>");
                                            out.println("<td><input type=\"hidden\" name=\"plot\" value=\"" + jsonobj1.get("overview") + "\"/></td>");
                                            out.println("</tr>");
                                            //hidden fields end
                                            out.println("<tr>");
                                            out.println("<td><img src=\"" + poster + "\" width=\"100\" height=\"100\" alt=\"no image\"/></td>");
                                            out.println("<td>" + jsonobj1.get("title") + "</td>");
                                            out.println("<td>" + jsonobj1.get("release_date").toString().substring(0,4) + "</td>");
                                            out.println("<td>" + jsonobj1.get("original_language").toString() + "</td>");
                                            out.println("<td>" + jsonobj1.get("overview") + "</td>");
                                            out.println("</tr>");
                                        } catch (Exception ex) {
                                            ex.printStackTrace();
                                        }

                                    }
                            %>
                            <tr>
                                <td colspan="5" style="text-align: center;">
                                    <input type="submit" value="Add Movie" class="btn btn-primary"/></td>
                            </tr>
                        </table>
                    </form>
                    <%
                        Connection con;
                        PreparedStatement st;
                        ResultSet rs;
                        try {
                            Class.forName("oracle.jdbc.driver.OracleDriver");
                            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "prakhar");
                            st = con.prepareStatement("select * from movie");
                            rs = st.executeQuery();%>                        
                            <h3>Added Movies</h3>
                        <table class="table" align="center">
                        <thead>
                            <tr>
                                <th>Title</th>
                                <th>Release Year</th>
                                <th>Language</th>
                                <th>Plot</th>
                               
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                    while (rs.next()) {
                                        out.println("<tr>");
                                        out.println("<td width=\"20%\">" + rs.getString(6) + "</td>");
                                        out.println("<td width=\"20%\">" + rs.getString(1) + "</td>");
                                        out.println("<td width=\"20%\">" + rs.getString(5) + "</td>");
                                        out.println("<td width=\"20%\">" + rs.getString(2) + "</td>");
                                       out.println("<td><a href=\"DeleteServlet?id=" + rs.getString(6) + "\"><input type=\"button\" value=\"&times;\" class=\"btn btn-danger\"/></a></td>");
                                        out.println("</tr>");
                                    }
                                    con.close();
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
