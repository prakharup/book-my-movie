package admin;
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
public class DeleteServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
           PrintWriter out = response.getWriter();
        Connection con;
        PreparedStatement ps;
   String ref = request.getHeader("referer");//to get URL from where request came
        String id = request.getParameter("id");
        String query=null, rdt = "";
        try {
            if (ref.contains("AdminHome.jsp")) {
                query = "delete from theatre where id='"+id+"'";
                rdt = "/AdminHome.jsp";
                Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "prakhar");
            ps = con.prepareStatement(query);
            ps.executeUpdate();
           /* RequestDispatcher rd = getServletContext().getRequestDispatcher(rdt);
            rd.forward(request, response);*/
           response.sendRedirect("AdminHome.jsp");
            con.close();
            }
            else if (ref.contains("AddMovie.jsp"))
            {
                query = "delete from movie where title='"+id+"'";
               // rdt = "/AddMovie.jsp";
                out.println(query);
                 out.println(ref);
                Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "prakhar");
            ps = con.prepareStatement(query);
            ps.executeUpdate();
            /*RequestDispatcher rd = getServletContext().getRequestDispatcher(rdt);
            rd.forward(request, response);*/
            response.sendRedirect("AddMovie.jsp");
            con.close();
            }
              
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
