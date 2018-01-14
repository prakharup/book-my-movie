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
public class MappingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String movie,city,theatre,date,mapmsg,time1,time2,time3,time4;
        PreparedStatement ps;
        Connection con;
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        movie=request.getParameter("movie");
        city=request.getParameter("city");
        theatre=request.getParameter("theater");
        date=request.getParameter("showdate");
        time1=request.getParameter("hour1")+" : "+request.getParameter("minute1")+" "+request.getParameter("ap1");
        time2=request.getParameter("hour2")+" : "+request.getParameter("minute2")+" "+request.getParameter("ap2");
        time3=request.getParameter("hour3")+" : "+request.getParameter("minute3")+" "+request.getParameter("ap3");
        time4=request.getParameter("hour4")+" : "+request.getParameter("minute4")+" "+request.getParameter("ap4");
        try
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "prakhar");
            ps=con.prepareStatement("insert into mapping(title,city,theatre,mdate,time1,time2,time3,time4) values(?,?,?,?,?,?,?,?)");
            ps.setString(1, movie);
            ps.setString(2, city);
            ps.setString(3, theatre);
            ps.setString(4, date);
            ps.setString(5, time1);
            ps.setString(6, time2);
            ps.setString(7, time3);
            ps.setString(8, time4);
            ps.executeUpdate();
            ps=con.prepareStatement("update movie set status='true' where title=?");
            ps.setString(1, movie);
            ps.executeUpdate();
            con.close();
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/Mapping.jsp");
            mapmsg = "Movie Mapped Successfull!!";
            request.setAttribute("mapmsg", mapmsg);
            rd.forward(request, response);
            out.println("success");
            
            
        }catch(Exception e)
        {
            out.println("exception "+e);
        }
    }

        
    }
