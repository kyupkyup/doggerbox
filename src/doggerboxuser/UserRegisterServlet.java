package doggerboxuser;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String userName = request.getParameter("userName");
		String userAddress = request.getParameter("userAddress");
		String userPhoneNum = request.getParameter("userPhoneNum");
		String userIntroRoute = request.getParameter("userIntroRoute");
		int userRoutine = Integer.parseInt(request.getParameter("userRoutine"));
		int userTerm = Integer.parseInt(request.getParameter("userTerm"));
		String introduceWho = request.getParameter("introduceWho");

		
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

			response.getWriter().write(new UserDAO().userAdd(userName, userAddress, userPhoneNum, userIntroRoute, userRoutine, userTerm, introduceWho)+"");
		}

	}

}
