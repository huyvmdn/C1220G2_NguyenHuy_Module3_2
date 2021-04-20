package servlet;

import bean.KhacgHang;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "khachHangServlet", urlPatterns = {"","/list"})
public class khachHangServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<KhacgHang> arrayList=new ArrayList();
        arrayList.add(new KhacgHang("Thuy", "12/12/1997","123 CodeGym- Đà Nẵng","https://vnn-imgs-f.vgcloud.vn/2019/08/02/09/2-co-gai-tre-duoc-tung-ho-dep-ngan-nam-co-mot-o-nhat-va-trung-quoc-600x400.jpg"));
        arrayList.add(new KhacgHang("Tien", "12/12/1998","789 CodeGym- Đà Nẵng","https://vnn-imgs-a1.vgcloud.vn/cdn.24h.com.vn/upload/1-2020/images/2020-03-16/1584324285-90-anh-2-1584088794-width650height867.jpg"));
        arrayList.add(new KhacgHang("Ngoc", "12/12/1999","567 CodeGym- Đà Nẵng","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrRz8lpT9y2xQrbOYkZQrl9sfJZ1Qy0FaMNA&usqp=CAU"));

        request.setAttribute("arrayListServlet",arrayList);
        request.getRequestDispatcher("index.jsp").forward(request,response);

    }
}
