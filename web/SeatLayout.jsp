<%-- 
    Document   : SeatLayout
    Created on : Jan 23, 2018, 9:13:04 PM
    Author     : PRAKHAR
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.Random"%>
<%
    int rno;
    Random r = new Random();
    rno = r.nextInt(Integer.MAX_VALUE);
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
  <script type="text/javascript" language="javascript">
            function calc()
            {
                var rate,price,tax,np;
                var a = document.getElementById("selc").value;
                document.getElementById("cclass").innerHTML = a;
                document.getElementById("tclass").value = a;
                var b = document.getElementById("tick").value;
                document.getElementById("ticks").innerHTML = b;
                document.getElementById("tticks").value = b;
                if (a == "Gold") {
                    rate = 280;
                }
                else
                {
                    rate=250;
                }
                price=rate*parseInt(b);
                tax=(price*15.6)/100;
                np=price+tax;
                document.getElementById("price").innerHTML=price;
                document.getElementById("tax").innerHTML=tax;
                document.getElementById("np").innerHTML=np;
            }
        </script>
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
                               <%--
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
                           
                             <ul class="nav navbar-nav navbar-right">
                                <li>
                                    <%=msg1%>
                                </li>
                                <li>
                                    <%=msg2%>                                    			
                                </li>
                            </ul>
                        </div>--%>
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
                                
                        </div>
                    </div>
                </div>
                                <div class="row">
                    <div class="col-md-12">
                        &nbsp;
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-1">

                    </div>
                    <div class="col-md-5" style="text-align: center;background-color: #f8f8f8;">
                        <form action="#">
                            <table class="table table-striped" style="width: 500px;">
                                <tr>
                                    <th>Movie Name</th>
                                    <td><input type="text" class="form-control" name="moviename" value="<%=request.getParameter("t")%>" readonly/></td>
                                </tr>
                                <tr>
                                    <th>Show Time</th>
                                    <td><input type="text" class="form-control" name="time" value="<%=request.getParameter("time")%>" readonly/></td>
                                </tr>
                                <tr>
                                    <th>Select Class</th>
                                    <td>
                                        <select name="class" id="selc" class="form-control">
                                            <option>Class</option>
                                            <option>Gold</option>
                                            <option>Silver</option>
                                        </select><br/>
                                        <input type="hidden" id="tclass"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Select Tickets</th>
                                    <td>
                                        <select id="tick" name="tickets" class="form-control">
                                            <option>Tickets</option>
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                            <option>6</option>
                                            <option>7</option>
                                            <option>8</option>
                                            <option>9</option>
                                            <option>10</option>
                                        </select><br/>
                                        <input type="hidden" id="tticks"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;">
                                        <input type="button" value="Calculate" class="btn btn-primary" onclick="calc()"/>
                                    </td>
                                    <td style="text-align: right;"><input type="submit" value="Proceed" class="btn btn-primary"/> </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: center;">
                                        </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                               <div class="col-md-5" style="text-align: right;background-color: #f8f8f8;">
                        <table class="table" style="border:1px;">
                            <tr>
                                <th colspan="2" style="text-align: center;">Rate List</th>
                            </tr>
                            <tr>
                                <th style="text-align: center;">Gold Class : Rs. 280</th>
                                <th style="text-align: center;">Silver Class : Rs. 250</th>
                            </tr>                            
                            <tr>
                                <th style="text-align: center;" colspan="2"><h3>Order Summary</h3></th>
                            </tr>
                            <tr>
                                <th>Class Selected : <label id="cclass"></label></th>
                                <th>Tickets Selected : <label id="ticks"></label></th>
                            </tr>
                            <tr>
                                <th>Price : <label id="price"></label> </th>
                                <th>Service Tax : <label id="tax"></label> </th>
                            </tr>
                            <tr>
                                <th colspan="2">Net Payable : <label id="np"></label> </th>
                            </tr>
                            <tr>
                                <th colspan="2" style="text-align: right;"><br/>&nbsp; </th>
                            </tr>
                        </table>
                    </div>
                    <div class="col-md-1">

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
      </body>
            </html>