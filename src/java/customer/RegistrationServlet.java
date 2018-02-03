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
public class RegistrationServlet extends HttpServlet {
        String customer_id;
        String name, email, pass, phone_no,regmsg;
        PreparedStatement ps;
        Connection con;
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        customer_id = request.getParameter("Cust_ID");
        name = request.getParameter("Cust_Name");
        email = request.getParameter("EmailID");
        phone_no = request.getParameter("PhoneNo");
        pass = request.getParameter("passwd");
        out.println(customer_id);
          try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "prakhar");
            ps = con.prepareStatement("insert into customer values(?,?,?,?,?)");
             out.println(customer_id);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, pass);
            ps.setString(4, customer_id);
            ps.setString(5, phone_no);
             out.println("kl");
            ps.executeUpdate();
            ps.close();
            con.close();
            
             out.println("ng");
            RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
            regmsg = "Registration Successfull!!";
            request.setAttribute("regmsg", regmsg);
            rd.forward(request, response);
        } catch (Exception e) {
//            out.println(e.getMessage());
            e.printStackTrace();
        }
    }
    }
