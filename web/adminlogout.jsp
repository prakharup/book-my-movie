<%-- 
    Document   : adminlogout
    Created on : Jan 9, 2018, 3:21:46 PM
    Author     : PRAKHAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Cookie ck[] = request.getCookies();
    for(Cookie c:ck)
    {
       if(c.getName().equals("admin"))
       {
        c.setValue("");
        c.setMaxAge(0);
        response.addCookie(c);
        response.sendRedirect("index.jsp");
       }
    }
    %>