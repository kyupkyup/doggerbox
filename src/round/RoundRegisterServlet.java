package round;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/RoundRegisterServlet")
public class RoundRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String roundTitle = request.getParameter("roundTitle");
		String roundDeliveryDate = request.getParameter("roundDeliveryDate");

		if(false)
		{
			response.getWriter().write("0");
		}
		else {
			roundTitle = URLDecoder.decode(roundTitle,"UTF-8");
			roundDeliveryDate=URLDecoder.decode(roundDeliveryDate, "UTF-8");

			response.getWriter().write(new RoundDAO2().roundAdd(roundDeliveryDate, roundTitle)+"");
		}
	}
}
