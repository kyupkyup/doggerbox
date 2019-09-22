package round;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/RoundUpdateServlet")
public class RoundUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		int roundPrimeNum = Integer.parseInt(request.getParameter("roundPrimeNum"));
		String roundTitle = request.getParameter("roundTitle");
		String roundDeliveryDate = request.getParameter("roundDeliveryDate");

		
		if(roundTitle == null ||
				roundDeliveryDate == null 
				||roundTitle.equals("") ||roundDeliveryDate.equals("")
				)
		{
			response.getWriter().write("0");
		}
		else {
			roundTitle = URLDecoder.decode(roundTitle,"UTF-8");
			roundDeliveryDate=URLDecoder.decode(roundDeliveryDate, "UTF-8");

			response.getWriter().write(new RoundDAO2().roundUpdate(roundTitle, roundDeliveryDate, roundPrimeNum)+"");
		}

	}

}
