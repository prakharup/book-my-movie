<%-- 
    Document   : Mapping.jsp
    Created on : Jan 11, 2018, 7:17:27 PM
    Author     : PRAKHAR
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection con;
    PreparedStatement mvst, thst, ctst;
    ResultSet mvrs = null, thrs = null, ctrs = null;
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "prakhar");
        mvst = con.prepareStatement("select title from movie");
        mvrs = mvst.executeQuery();
        thst = con.prepareStatement("select unique name from theatre");
        thrs = thst.executeQuery();
        ctst = con.prepareStatement("select unique city from theatre");
        ctrs = ctst.executeQuery();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>          
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>book my movie</title>
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
                                <li>
                                    <a href="AddMovie.jsp">Manage Movies</a>
                                </li>
                                <li class="active">
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
                    <h3>Map Movies &AMP; Theatres</h3>
                    <form role="form" class="form-inline" method="post" action="MappingServlet">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th> Select Movie</th>
                                    <td><select name="movie" class="form-control">
                                            <option selected>Select Movie</option>
                                            <%
                                                while(mvrs.next())
                                                {
                                                    out.println("<option>"+mvrs.getString(1)+"</option>");
                                                }
                                                %>
                                        </select>  </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Select city
                                        </th>
                                        <td>
                                            <select name="city" class="form-control">
                                                <option selected>Select City</option>
                                                <%
                                                    while(ctrs.next())
                                                    {
                                                        out.println("<option>"+ctrs.getString(1)+"</option>");
                                                    }
                                                    %>
                                                    
                                                
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                    <th> Select Theater</th>
                                    <td><select name="theater" class="form-control">
                                            <option selected>Select Theater</option>
                                            <%
                                                while (thrs.next()) {
                                                    out.println("<option>" + thrs.getString(1) + "</option>");
                                                }
                                            %>
                                        </select></td>
                                </tr>

                                    <tr>
                                        <th>
                                            Select Date
                                        </th>
                                        <td>
                                            <input tupe="date" name="showdate" class="form-control">
                                        </td>
                                    </tr>
                                    <tr>
                                    <th rowspan="4" style="vertical-align: middle;">Add Show Timings</th>
                                    <td>
                                   <select class="form-control" id="hours" name="hour1">
                                            <option>Hours</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="6">6</option>
                                            <option value="7">7</option>
                                            <option value="8">8</option>
                                            <option value="9">9</option>
                                            <option value="10">10</option>
                                            <option value="11">11</option>
                                            <option value="12">12</option>
                                        </select> : <select class="form-control" id="minutes" name="minute1">
                                            <option>Minutes</option>
                                            <option value="00">00</option>
                                            <option value="05">05</option>
                                            <option value="10">10</option>
                                            <option value="15">15</option>
                                            <option value="20">20</option>
                                            <option value="25">25</option>
                                            <option value="30">30</option>
                                            <option value="35">35</option>
                                            <option value="40">40</option>
                                            <option value="45">45</option>
                                            <option value="50">50</option>
                                            <option value="55">55</option>
                                        </select> &nbsp;&nbsp; <select class="form-control" id="ampm" name="ap1">
                                            <option>AM/PM</option>
                                            <option value="AM">AM</option>
                                            <option value="PM">PM</option>
                                        </select>
                                    </td>
                                     <tr>
                                    <td>
                                        <select class="form-control" id="hours" name="hour2">
                                            <option>Hours</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="6">6</option>
                                            <option value="7">7</option>
                                            <option value="8">8</option>
                                            <option value="9">9</option>
                                            <option value="10">10</option>
                                            <option value="11">11</option>
                                            <option value="12">12</option>
                                        </select> : <select class="form-control" id="minutes" name="minute2">
                                            <option>Minutes</option>
                                            <option value="00">00</option>
                                            <option value="05">05</option>
                                            <option value="10">10</option>
                                            <option value="15">15</option>
                                            <option value="20">20</option>
                                            <option value="25">25</option>
                                            <option value="30">30</option>
                                            <option value="35">35</option>
                                            <option value="40">40</option>
                                            <option value="45">45</option>
                                            <option value="50">50</option>
                                            <option value="55">55</option>
                                        </select> &nbsp;&nbsp; <select class="form-control" id="ampm" name="ap2">
                                            <option>AM/PM</option>
                                            <option value="AM">AM</option>
                                            <option value="PM">PM</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <select class="form-control" id="hours" name="hour3">
                                            <option>Hours</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="6">6</option>
                                            <option value="7">7</option>
                                            <option value="8">8</option>
                                            <option value="9">9</option>
                                            <option value="10">10</option>
                                            <option value="11">11</option>
                                            <option value="12">12</option>
                                        </select> : <select class="form-control" id="minutes" name="minute3">
                                            <option>Minutes</option>
                                            <option value="00">00</option>
                                            <option value="05">05</option>
                                            <option value="10">10</option>
                                            <option value="15">15</option>
                                            <option value="20">20</option>
                                            <option value="25">25</option>
                                            <option value="30">30</option>
                                            <option value="35">35</option>
                                            <option value="40">40</option>
                                            <option value="45">45</option>
                                            <option value="50">50</option>
                                            <option value="55">55</option>
                                        </select> &nbsp;&nbsp; <select class="form-control" id="ampm" name="ap3">
                                            <option>AM/PM</option>
                                            <option value="AM">AM</option>
                                            <option value="PM">PM</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <select class="form-control" id="hours" name="hour4">
                                            <option>Hours</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="6">6</option>
                                            <option value="7">7</option>
                                            <option value="8">8</option>
                                            <option value="9">9</option>
                                            <option value="10">10</option>
                                            <option value="11">11</option>
                                            <option value="12">12</option>
                                        </select> : <select class="form-control" id="minutes" name="minute4">
                                            <option>Minutes</option>
                                            <option value="00">00</option>
                                            <option value="05">05</option>
                                            <option value="10">10</option>
                                            <option value="15">15</option>
                                            <option value="20">20</option>
                                            <option value="25">25</option>
                                            <option value="30">30</option>
                                            <option value="35">35</option>
                                            <option value="40">40</option>
                                            <option value="45">45</option>
                                            <option value="50">50</option>
                                            <option value="55">55</option>
                                        </select> &nbsp;&nbsp; <select class="form-control" id="ampm" name="ap4">
                                            <option>AM/PM</option>
                                            <option value="AM">AM</option>
                                            <option value="PM">PM</option>
                                        </select>
                                    </td>
                                </tr>
                            </thead>
                           
                            <tr>
                                <td colspan="3" align="center">
                            <input type="submit" value="Map" class="btn btn-lg btn-primary">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                                                    
                    </form>
                </div>
             </div>
        </div>
        
    </body>
</html>