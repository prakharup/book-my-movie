
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection,java.sql.PreparedStatement,java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*"%>
<%
    int rno;
    Random r = new Random();
    rno = r.nextInt(Integer.MAX_VALUE);
    Date date = new java.util.Date();
    int d = date.getDate();
    int m = date.getMonth() + 1;
    int y = date.getYear() + 1900;
    String fbdt = String.valueOf(d) + "/" + String.valueOf(m) + "/" + String.valueOf(y);
    Connection con = null;
    Statement ps;
    ResultSet rs = null;
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "prakhar");
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!doctype html>
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
         <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                     <nav class="navbar navbar-default" role="navigation">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                            </button> <a class="navbar-brand" href="index.jsp">Home</a>
                        </div>
                          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav">
                                <li class="active">
                                    <a href="#">Movie</a>
                                </li>
                                <li>
                                    <a href="#">Reviews</a>
                                </li>
                            </ul>
                               <%
                                String info = "", msg1 = "", msg2 = "";
                                Cookie ck[] = request.getCookies();
                                for (Cookie c : ck) {
                                    if (c.getName().equals("user")) {
                                        info = c.getValue();
                                        msg1 = "<a href=\"#\">Welcome, " + info + "</a>";
                                        msg2 = "<a href=\"logout.jsp\">Logout</a>";
                                    } else {
                                        msg1 = "<a id=\"modal-850926\" href=\"#modal-container-850926\" role=\"button\" class=\"btn\" data-toggle=\"modal\">Sign In</a>";
                                        msg2 = "<a id = \"modal-850927\" href = \"#modal-container-850927\" role = \"button\" class=\"btn\" data-toggle=\"modal\">Register</a>";
                                    }
                                }
                            %>
                             <ul class="nav navbar-nav navbar-right">
                                <li>
                                    <%=msg1%>
                                </li>
                                <li>
                                    <%=msg2%>                                    			
                                </li>
                            </ul>
                        </div>
                    </nav>
                                <!--Sign in modal starts-->
                         <div class="col-md-12">
                        <div class="modal fade" id="modal-container-850926" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">

                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                            ×
                                        </button>
                                        <h4 class="modal-title" id="myModalLabel">
                                            Sign In Customer
                                        </h4>
                                    </div>    
                                    <div class="modal-body">
                                        <form role="form" action="CustomerLogin" method="post">
                                            <div class="form-group">                            
                                                <label for="email">
                                                    Email ID
                                                </label>
                                                <input required type="email" name="EmailID" class="form-control" id="email" />
                                            </div>
                                            <div class="form-group">

                                                <label for="password">
                                                    Password
                                                </label>
                                                <input required type="password" name="passwd" class="form-control" id="password" />
                                            </div>
                                            <input type="submit" value="Submit" class="btn btn-primary"><br/>
                                            <a href="forgotpwd.jsp">Forgot Password?</a>
                                        </form>
                                    </div>   
                                </div>

                            </div>

                        </div>                        
                        <!--Signin modal khatam-->
                        <!--Register Modal Begins-->
                          <div class="col-md-12">
                            <div class="modal fade" id="modal-container-850927" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">

                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                ×
                                            </button>
                                            <h4 class="modal-title" id="myModalLabel">
                                                Registration
                                            </h4>
                                        </div>
                                        <div class="modal-body">
                                            <form role="form" action="RegistrationServlet" method="post">
                                                <div class="form-group">

                                                    <label for="custid">
                                                        Customer ID
                                                    </label>
                                                    <input type="text" value="<%=rno%>" name="Cust_ID" class="form-control" id="custid" />
                                                </div>
                                                <div class="form-group">

                                                    <label for="custname">
                                                        Name
                                                    </label>
                                                    <input type="text" name="Cust_Name" class="form-control" id="custname" />
                                                </div>
                                                <div class="form-group">

                                                    <label for="email">
                                                        Email ID
                                                    </label>
                                                    <input type="email" name="EmailID" class="form-control" id="email" />
                                                </div>
                                                <div class="form-group">

                                                    <label for="phoneno">
                                                        Phone No
                                                    </label>
                                                    <input type="text" name="PhoneNo" class="form-control" id="phoneno" />
                                                </div>
                                                <div class="form-group">

                                                    <label for="password">
                                                        Password
                                                    </label>
                                                    <input type="password" name="passwd" class="form-control" id="password" />
                                                </div>

                                                <div class="form-group">

                                                    <label for="confpass">
                                                        Confirm Password
                                                    </label>
                                                    <input type="password" class="form-control" id="confpass" />
                                                </div>    
                                                <input type="submit" value="Submit" class="btn btn-primary">
                                            </form>
                                        </div>   
                                    </div>
                                </div>
                            </div>
                            <!--Register modal ends-->  
                          <p align="center" style="background-color: #f8f8f8;"><i>
                                    <%
                                        String regmsg = (String) request.getAttribute("regmsg");
                                        if (regmsg == null) {
                                            out.println("");
                                        } else {
                                            out.println(regmsg);
                                        }
                                    %>
                                </i></p>
                            <p align="center" style="background-color: #f8f8f8;"><i>
                                    <%
                                        String clogerr = (String) request.getAttribute("clogerr");
                                        if (clogerr == null) {
                                            out.println("");
                                        } else {
                                            out.println(clogerr);
                                        }
                                    %>
                                </i></p>
                            <p align="center" style="background-color: #f8f8f8;"><i>
                                    <%
                                        String alogerr = (String) request.getAttribute("alogerr");
                                        if (alogerr == null) {
                                            out.println("");
                                        } else {
                                            out.println(alogerr);
                                        }
                                    %>
                                </i></p>
                       </div>
                    </div>
                </div>
            </div>
                            <%--     <div class="row">
                <div class="col-md-12">&nbsp;</div>
            </div>
            <div class="row">
                <div class="col-md-1">
                    &nbsp;
                </div>
                <div class="col-md-10" style="background-color: #f8f8f8;">
                    <div class="row">
                        <div class="col-md-3">                            
                           <%-- <p><br/>
                                <img src="<%=request.getParameter("p")%>" width="200" height="250" alt="<%=request.getParameter("t")%>"/>
                            </p>
                        </div>
                        <div class="col-md-2">
                            <h2><%=request.getParameter("t")%></h2>
                        </div>
                        <div class="col-md-7">&nbsp;</div>                                             
                    </div>
                </div>
                <div class="col-md-1">
                    &nbsp;
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">&nbsp;</div>
            </div>
            <div class="row">
                <div class="col-md-1">
                    &nbsp;
                </div>--%>

                <div class="col-md-10" style="background-color: #f8f8f8;">
                    <table class="table table-striped">
                        <tr>
                            <th>Title</th>
                            <th>City Name</th>
                            <th>Theater Name</th>
                            <th>Show Date</th>
                            <th>Show Time</th>
                        </tr>
                        <%
                            ps = con.createStatement();
                            //ps.setString(1, request.getParameter("t"));
                            rs = ps.executeQuery("select * from mapping");
                            while (rs.next()) {
                        %>
                        <tr>
                            <td><%=rs.getString("title")%></td>
                            <td><%=rs.getString("city")%></td>
                            <td><%=rs.getString("theatre")%></td>
                            <td><%=rs.getString("mdate")%></td>
                            <td>
                                <a href="SeatLayout.jsp?t=<%=request.getParameter("t")%>&time=<%=rs.getString("time1")%>" class="btn" style="background-color: blue;color: white;border-radius:10px;"><%=rs.getString("time1")%></a>&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="SeatLayout.jsp?t=<%=request.getParameter("t")%>&time=<%=rs.getString("time2")%>" class="btn" style="background-color: blue;color: white;border-radius:10px;"><%=rs.getString("time2")%></a>&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="SeatLayout.jsp?t=<%=request.getParameter("t")%>&time=<%=rs.getString("time3")%>"  class="btn" style="background-color: blue;color: white;border-radius:10px;"><%=rs.getString("time3")%></a>&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="SeatLayout.jsp?t=<%=request.getParameter("t")%>&time=<%=rs.getString("time4")%>" class="btn" style="background-color: blue;color: white;border-radius:10px;"><%=rs.getString("time4")%></a>&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </table>

                </div>
            <div class="col-md-3">
                    &nbsp;
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    &nbsp;
                </div>
            </div>
                          <!-- admin sign in modal starts-->
                                    <div class="col-md-12">
                <div class="modal fade" id="modal-container-850928" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">

                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    ×
                                </button>
                                <h4 class="modal-title" id="myModalLabel">
                                    Sign In
                                </h4>
                            </div>    
                            <div class="modal-body">
                                <form role="form" action="AdminLogin" method="post">
                                    <div class="form-group">                            
                                        <label for="email">
                                            Email ID
                                        </label>
                                        <input type="text" name="adminid" class="form-control" id="email" />
                                    </div>
                                    <div class="form-group">

                                        <label for="password">
                                            Password
                                        </label>
                                        <input type="password" name="password" class="form-control" id="password" />
                                    </div>
                                    <input type="submit" value="Submit" class="btn btn-primary">

                                </form>
                            </div>   
                        </div>

                    </div>

                </div>                        
                <!--Admin Sign in modal ends-->
                <div class="row footer">
                    <div class="col-lg-4  col-md-4 col-sm-4">
                        <div class="footer_dv">
                            <a id="modal-850928" href="#modal-container-850928" role="button" class="btn" data-toggle="modal" style="color: #fcab0e;"><h4>Admin</h4></a>
                        </div>
                    </div>
                    <div class="col-lg-4  col-md-4 col-sm-4">
                        <div class="footer_dv">
                            <a href="Support.jsp" style="text-decoration: none;"><h4>Support</h4></a>                            
                        </div>
                    </div>
                    <div class="col-lg-4  col-md-4 col-sm-4">
                        <div class="footer_dv">
                            <a href="ContactUs.jsp" style="text-decoration: none;"><h4>Contact us</h4></a>
                        </div>
                    </div>
                </div>
            </div>
         </div>
        
    </body>
