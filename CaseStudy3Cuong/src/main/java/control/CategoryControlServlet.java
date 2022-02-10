package control;

import dao.DAO;
import model.category;
import model.product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryControlServlet", value = "/category")
public class CategoryControlServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        String categoryID = request.getParameter("categoryID");
        DAO dao = new DAO();
        List<product> list = dao.getAllProductByCategory(categoryID);
        List<category> categories = dao.getAllCategory();
        String categoryTitle = categories.get(Integer.parseInt(categoryID) - 1).getName();
        request.setAttribute("listProductByCategory", list);
        request.setAttribute("categories", categories);
        request.setAttribute("categoryTitle", categoryTitle);
        request.getRequestDispatcher("tshirt.jsp").forward(request, response);
    }
}
