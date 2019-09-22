package order;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import puppy.PuppyDAO2;


@WebServlet("/SetDueDateAvailableServlet")
public class SetDueDateAvailableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		int orderPrimeNum = Integer.parseInt(request.getParameter("orderPrimeNum"));
		String color = request.getParameter("color");

		System.out.println(orderPrimeNum+" + " + color );
		
		if(false)
		{
			response.getWriter().write("0");
		}
		else {
			color = URLDecoder.decode(color,"UTF-8");

			if(color.equals("blue")) {
				response.getWriter().write(new OrderDAO2().setDueDateAvailable(orderPrimeNum, 0)+"");

			}
			else if(color.equals("red")) {
				response.getWriter().write(new OrderDAO2().setDueDateAvailable(orderPrimeNum, 1)+"");

			}
			else if(color.equals("green")) {
				response.getWriter().write(new PuppyDAO2().setPaymentAvailable(orderPrimeNum, 2)+"");

			}
			else if(color.equals("yellow")) {
				response.getWriter().write(new PuppyDAO2().setPaymentAvailable(orderPrimeNum, 3)+"");

			}
		}
	}
}
