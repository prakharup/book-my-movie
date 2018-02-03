package customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EmailSendingServlet extends HttpServlet {

    private String host;
    private String port;
    private String user;
    private String pass;
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // reads form fields
        RequestDispatcher rd;
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String recipient = request.getParameter("emailid");
        String subject = "Password Recovery Mail";
        Random rand = new Random();
        String passwd = "mm" + rand.nextInt(Integer.MAX_VALUE);
        String content = "your Password is : " + passwd;

        String resultMessage = "";
        rd = getServletContext().getRequestDispatcher("/forgotpwd.jsp");

        try {

            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "prakhar");
            ps = con.prepareStatement("select email from customer where email=?");
            ps.setString(1, recipient);
            rs = ps.executeQuery();
            if(rs.next())
            {               
                mailutility.sendEmail(host, port, user, pass, recipient, subject, content);
                resultMessage = "The e-mail was sent successfully";
                request.setAttribute("resmsg", resultMessage);
                rd.forward(request, response);
            } else {
                resultMessage = "No User Found with the given email ID";
                request.setAttribute("resmsg", resultMessage);
                rd.forward(request, response);
            }
        } catch (Exception ex) {
            resultMessage = "There were an error: " + ex.getMessage();
            request.setAttribute("resmsg", resultMessage);
//            rd.forward(request, response);
        } 

    }
}
