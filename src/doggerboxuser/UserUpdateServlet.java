package doggerboxuser;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UserUpdateServlet")
public class UserUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		int userPrimeNum = Integer.parseInt(request.getParameter("userPrimeNum"));
		String userName = request.getParameter("userName");
		String userAddress = request.getParameter("userAddress");
		String userPhoneNum = request.getParameter("userPhoneNum");
		String userIntroRoute = request.getParameter("userIntroRoute");
		int userRoutine = Integer.parseInt(request.getParameter("userRoutine"));
		int userTerm = Integer.parseInt(request.getParameter("userTerm"));
		String introduceWho = request.getParameter("introduceWho");
		int paymentRoute = Integer.parseInt(request.getParameter("paymentRoute"));
		String userPhoneNum2 = request.getParameter("userPhoneNum2");
		String requests = request.getParameter("requests");

		
		if(userName == null ||userAddress == null ||userPhoneNum == null ||
				userIntroRoute == null 
				||userName.equals("") ||userAddress.equals("")  ||userPhoneNum.equals("")  ||
				userIntroRoute.equals(""))
		{
			response.getWriter().write("0");
		}
		else {
			userName = URLDecoder.decode(userName,"UTF-8");
			userAddress=URLDecoder.decode(userAddress, "UTF-8");
			userPhoneNum=URLDecoder.decode(userPhoneNum, "UTF-8");
			userIntroRoute=URLDecoder.decode(userIntroRoute, "UTF-8");
			introduceWho=URLDecoder.decode(introduceWho, "UTF-8");
			userPhoneNum2=URLDecoder.decode(userPhoneNum2, "UTF-8");
			requests=URLDecoder.decode(requests, "UTF-8");

			response.getWriter().write(new UserDAO().userUpdate(userName, userAddress, userPhoneNum, userIntroRoute, userRoutine, userTerm, introduceWho,paymentRoute,userPhoneNum2,requests, userPrimeNum)+"");
		}

	}

}
