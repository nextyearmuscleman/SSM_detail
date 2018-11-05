import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class Servlet02 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println(request.getRequestURL());
       
        String id = request.getParameter("id");
        System.out.println(id);
        Book book = DB.getAll().get(id);  //得到用户想买的书

        HttpSession session = request.getSession();

        List<Book> list = (List<Book>) session.getAttribute("list");  //得到用户用于保存所有书的容器

        if(list==null){
            list = new ArrayList<Book>();
            session.setAttribute("list", list);
        }
        list.add(book);
        //response. encodeRedirectURL(java.lang.String url)用于对sendRedirect方法后的url地址进行重写
        String url = response.encodeURL(request.getContextPath()+"/Servlet03");
        System.out.println(request.getContextPath()+"/Servlet03");
        response.sendRedirect(request.getContextPath()+"/Servlet03");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request, response);
    }
}
