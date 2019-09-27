package doggerboxuser;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UserListServlet")
public class UserListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String userName = request.getParameter("userName");
		
		
		if(userName == null ||userName.equals(""))
		{
			response.getWriter().write("");
		}
		else {
			try {
				response.getWriter().write(getUserList(URLDecoder.decode(userName, "UTF-8")));
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}

	}
	
	public String getUserList(String userName) {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		UserDAO userDAO = new UserDAO();
		ArrayList<DoggerboxUser> userList = userDAO.getUserListByName(userName);
		if(userList.size()==0) return "";
		for(int i=0; i<userList.size(); i++) {
			result.append("[{\"value\":\""+ userList.get(i).getUserPrimeNum()+"\"},");
			result.append("{\"value\":\""+ userList.get(i).getUserName()+"\"},");
			result.append("{\"value\":\""+ userList.get(i).getUserAddress()+"\"},");
			result.append("{\"value\":\""+ userList.get(i).getUserPhoneNum()+"\"},");
			result.append("{\"value\":\""+ userList.get(i).getUserIntroRoute()+"\"},");
			result.append("{\"value\":\""+ userList.get(i).getUserRoutine()+"\"},");
			result.append("{\"value\":\""+ userList.get(i).getUserTerm()+"\"},");
			result.append("{\"value\":\""+ userList.get(i).getAddDate()+"\"},");
			result.append("{\"value\":\""+ userList.get(i).getIntroduceWho()+"\"}]");
			if(i != userList.size()-1) result.append(",");
		}
		result.append("]}");
		return result.toString();
		
	}

}
