package puppy;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/PuppyDeleteServlet")
public class PuppyDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		int puppyPrimeNum = Integer.parseInt(request.getParameter("puppyPrimeNum"));
		

			response.getWriter().write("0");


			response.getWriter().write(new PuppyDAO2().deletePuppy(puppyPrimeNum)+"");


	}

}
