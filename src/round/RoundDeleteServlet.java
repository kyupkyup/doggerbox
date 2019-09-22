package round;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/RoundDeleteServlet")
public class RoundDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		int roundPrimeNum = Integer.parseInt(request.getParameter("roundPrimeNum"));
		

			response.getWriter().write("0");


			response.getWriter().write(new RoundDAO2().deleteRound(roundPrimeNum)+"");


	}

}
