<%-- 
    Document   : logout
    Created on : Jan 18, 2018, 7:50:31 PM
    Author     : PRAKHAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Cookie ck[] = request.getCookies();
    for (Cookie c : ck) {
        if (c.getName().equals("user")) {
            c.setValue("");
            c.setMaxAge(0);
            response.addCookie(c);
            response.sendRedirect("index.jsp");
        }
    }
%>