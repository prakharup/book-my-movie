package customer;
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
public class CustomerLogin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String email, pass,clogerr;
        Connection con;
        Statement st;
        ResultSet rs;
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        email = request.getParameter("EmailID");
        pass = request.getParameter("passwd");
       try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "prakhar");
            st = con.createStatement();
            /*st.setString(1, email);
            st.setString(2, pass);*/
             
             rs = st.executeQuery("select name,emailid,passwd from customers");
              
             rs.next();
              
             String n=rs.getString(1);
             String e=rs.getString(2);
             String p=rs.getString(3);
      
            if (e.equals(email)&&p.equals(pass)) {
                
                Cookie ck = new Cookie("user", rs.getString(1));
                ck.setMaxAge(24 * 60 * 60);
                response.addCookie(ck);
       
                response.sendRedirect("index.jsp");
            } else {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
                clogerr = "Invalid Login Details!!";
                request.setAttribute("clogerr", clogerr);
                rd.forward(request, response);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    }
 