package order;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/OrderDeleteServlet")
public class OrderDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		int orderPrimeNum = Integer.parseInt(request.getParameter("orderPrimeNum"));
		

			response.getWriter().write("0");


			response.getWriter().write(new OrderDAO2().deleteOrder(orderPrimeNum)+"");


	}

}
