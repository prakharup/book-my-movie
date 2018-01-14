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
public class AddMovie extends HttpServlet {
    String mname,myear,jsondata;
    String poster,title,year,lang,plot,movmsg;
    PreparedStatement ps;
    Connection con;
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        poster=request.getParameter("poster");
        title=request.getParameter("title");
        year=request.getParameter("year");
        lang=request.getParameter("language");
        plot=request.getParameter("plot");
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "prakhar");
            ps=con.prepareStatement("insert into movie(TITLE,YEAR,LANGUAGE,PLOT,POSTER,STATUS) values(?,?,?,?,?,?)");
            ps.setString(1, title);
            ps.setString(2, year);
            ps.setString(3, lang);
            ps.setString(4, plot);
            ps.setString(5, poster);
            ps.setString(6, "false");
            ps.executeUpdate();
        
        con.close();
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/AddMovie.jsp");
            movmsg = "Movie Added Successfully!!";
            request.setAttribute("movmsg", movmsg);
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }}
         @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    }