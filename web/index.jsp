<%-- 
    Document   : index.jsp
    Author     : PRAKHAR
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.Random"%>
<%
    int rno;
    Random r = new Random();
    rno = r.nextInt(Integer.MAX_VALUE);//Integer.max_value is the largest possible value of integer
    Connection con;
    Statement st;
    ResultSet rs;
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
                           <div class="carousel slide" id="carousel-793811">
                                <ol class="carousel-indicators">
                                    <li class="active" data-slide-to="0" data-target="#carousel-793811">
                                    </li>
                                    <li data-slide-to="1" data-target="#carousel-793811">
                                    </li>
                                    <li data-slide-to="2" data-target="#carousel-793811">
                                    </li>
                                </ol>
                                <div class="carousel-inner">
                                    <div class="item active">
                                        <img alt="Carousel Bootstrap First" src="images/10.jpg">                                        
                                    </div>
                                    <div class="item">
                                        <img alt="Carousel Bootstrap Second" src="images/6.jpg">                                        
                                    </div>
                                    <div class="item">
                                        <img alt="Carousel Bootstrap Third" src="images/5.jpg">                                        
                                    </div>
                                </div> <a class="left carousel-control" href="#carousel-793811" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-793811" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
                            </div>
                        </div>
                    </div>
                </div>  
                      
                         
                </div>
                                 <div class="row">
                    <div class="col-md-12">&nbsp;
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-1">
                                </div>
                                <div class="col-md-3">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">
                                                Panel title
                                            </h3>
                                        </div>
                                        <div class="panel-body">
                                            Panel content
                                        </div>
                                        <div class="panel-footer">
                                            Panel footer
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-7">
                                    <div class="row">
                                        <%
                                            try {
                                                Class.forName("oracle.jdbc.driver.OracleDriver");
                                                con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "niit123");
                                                st = con.createStatement();
                                                rs = st.executeQuery("select * from movies where status='true'");
                                                while (rs.next()) {%>
                                        <div class="col-md-4">
                                            <div class="thumbnail">
                                                <img alt="<%=rs.getString("TITLE")%>" src="<%=rs.getString("poster")%>" width="180" height="150" />
                                                <div class="caption">
                                                    <p>
                                                        <%=rs.getString("TITLE")%><br>
                                                        <%=rs.getString("LANGUAGE")%><br>
                                                    </p>
                                                    <a href="bookingpage.jsp?t=<%=rs.getString("TITLE")%>&p=<%=rs.getString("poster")%>"><button class="btn btn-primary">Book Now</button></a>
                                                </div>
                                            </div>
                                        </div>
                                        <%
                                                }
                                                con.close();
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            }
                                        %>
                                    </div>
                                </div>
                                <div class="col-md-1">
                                </div>
                            </div>
                        </div>
                    </div>
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
        
       
    </body>
</html>
