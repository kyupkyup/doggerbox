package order;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import puppy.PuppyDAO2;

@WebServlet("/UpdateDueDateServlet")
public class UpdateDueDateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		int orderPrimeNum = Integer.parseInt(request.getParameter("orderPrimeNum"));
		String dueDate = request.getParameter("dueDate");
		String color = request.getParameter("color");
/*		String dueYear = request.getParameter("dueYear");
		String dueMonth = request.getParameter("dueMonth");*/


		System.out.println(dueDate);
		
		if(false)
		{
			response.getWriter().write("0");
		}
		else {
			dueDate = URLDecoder.decode(dueDate,"UTF-8");

			if(color.equals("red")||color.equals("blue")) {
				response.getWriter().write(new OrderDAO2().updateDueDate(orderPrimeNum, dueDate)+"");

			}

			else if(color.equals("green")||color.equals("yellow")) {
				response.getWriter().write(new PuppyDAO2().updatePaymentDate(orderPrimeNum, dueDate)+"");

			}

		}
	}
}
