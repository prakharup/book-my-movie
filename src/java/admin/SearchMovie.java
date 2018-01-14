package admin;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.Charset;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class SearchMovie extends HttpServlet {
 String movname, movyear,jsondata;
 public static String callURL(String myURL) {
        //System.out.println("Requeted URL:" + myURL);
        StringBuilder sb = new StringBuilder();
        URLConnection urlConn = null;
        InputStreamReader in = null;
        try {
            URL url = new URL(myURL);
            urlConn = url.openConnection();
            if (urlConn != null) {
                urlConn.setReadTimeout(60 * 1000);
            }
            if (urlConn != null && urlConn.getInputStream() != null) {
                in = new InputStreamReader(urlConn.getInputStream(),
                        Charset.defaultCharset());
                BufferedReader bufferedReader = new BufferedReader(in);
                if (bufferedReader != null) {
                    int cp;
                    while ((cp = bufferedReader.read()) != -1) {
                        sb.append((char) cp);
                    }
                    bufferedReader.close();
                }
            }
            in.close();
        } catch (Exception e) {
            throw new RuntimeException("Exception while calling URL:" + myURL, e);
        }

        return sb.toString();
    }

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        movname = request.getParameter("movname");
        movname=movname.replace(' ', '+');
//        System.out.println(movname);
        movyear = request.getParameter("movieyear");
        String jsondata = callURL("https://api.themoviedb.org/3/search/movie?api_key=37db07b50049f7c848bf9809c02cd243&query=" + movname);
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/AddMovie.jsp");        
        request.setAttribute("jsonstr", jsondata);
        request.setAttribute("year", movyear);
        rd.forward(request, response);
    }}
