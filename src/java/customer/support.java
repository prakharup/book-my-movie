package customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class support extends HttpServlet {
    private String supmsg;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String dt, name, email, phno, sub, query;
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        dt = request.getParameter("fbdt");
        name = request.getParameter("name");
        email = request.getParameter("email");
        phno = request.getParameter("phone");
        sub = request.getParameter("sbjct");
        query = request.getParameter("query");
        Connection con;
        PreparedStatement ps;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "prakhar");
            ps=con.prepareStatement("insert into support values(?,?,?,?,?,?)");
            ps.setString(1, dt);            
            ps.setString(2, name);            
            ps.setString(3, email);            
            ps.setString(4, phno);            
            ps.setString(5, sub);            
            ps.setString(6, query);
            ps.executeUpdate();
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/Support.jsp");
            supmsg = "Thank you for your feedback... Your query will be resolved shortly";
            request.setAttribute("supmsg", supmsg);
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
