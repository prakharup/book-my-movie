package admin;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class AdminLogin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String adminid, pass,alogerr;
        Connection con;
        Statement st;
        ResultSet rs;
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        adminid = request.getParameter("adminid");
        pass = request.getParameter("password");
            try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "prakhar");
             st=con.createStatement();
             rs=st.executeQuery("select username,passwd from admin");
             rs.next();
             String s=rs.getString(1);
             String p=rs.getString(2);
      
        if(s.equals(adminid)&&p.equals(pass)) {
                    out.println(adminid);
                    Cookie ck = new Cookie("admin", rs.getString(2));
                    ck.setMaxAge(24 * 60 * 60);
                    response.addCookie(ck);
                    response.sendRedirect("AdminHome.jsp");
                }
            else
            {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
                alogerr = "Invalid Login Details!!";
                request.setAttribute("alogerr", alogerr);
                rd.forward(request, response);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
