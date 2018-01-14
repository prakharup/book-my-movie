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
public class AddTheatre extends HttpServlet {
    String thname,thcity,thloc,thmsg;
    PreparedStatement ps;
    Connection con;
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        thname=request.getParameter("thname");
        thloc=request.getParameter("thlocation");
        thcity=request.getParameter("thcity");
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "prakhar");
            ps=con.prepareStatement("insert into theatre(name,city,location) values(?,?,?)");
            ps.setString(1, thname);
            ps.setString(2, thcity);
            ps.setString(3, thloc);
            ps.executeUpdate();
            con.close();
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/AdminHome.jsp");
            thmsg = "Theater Added Successfull!!";
            request.setAttribute("thmsg", thmsg);
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
        }
        
    

       