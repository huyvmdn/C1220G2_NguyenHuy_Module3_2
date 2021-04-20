import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "display_discount_Servlet", urlPatterns = "/chieckhau")
public class display_discount_Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("tenSanPham");
        double gia = Double.parseDouble(request.getParameter("gia"));
        double chiecKhau = Double.parseDouble(request.getParameter("chiecKhau"));
        double discountAmount = gia * chiecKhau * 0.01;

        request.setAttribute("discountAmount",discountAmount);
        request.setAttribute("name",name);
        request.setAttribute("chiecKhau",chiecKhau);
        request.getRequestDispatcher("display-discount.jsp").forward(request,response);
    }
}
