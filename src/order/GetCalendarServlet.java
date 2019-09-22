package order;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.xdevapi.JsonArray;

import doggerboxuser.DoggerboxUserDAO;
import puppy.PuppyDAO2;
import puppy.PuppyDAO;

import puppy.Puppy;

@WebServlet("/GetCalendarServlet")
public class GetCalendarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String start = request.getParameter("start");
		String end = request.getParameter("end");

			try {
				response.getWriter().write(getCalendar(start, end));
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		

	}
	
	public String getCalendar(String start, String end) {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		OrderDAO2 orderDAO = new OrderDAO2();
		DoggerboxUserDAO userDAO = new DoggerboxUserDAO();
		PuppyDAO2 puppyDAO2 = new PuppyDAO2();
		PuppyDAO puppyDAO = new PuppyDAO();

		ArrayList<Order> orderList = orderDAO.getDate(start, end);
		ArrayList<Puppy> puppyList = puppyDAO2.getPaymentDate(start, end);

		if(orderList.size()==0) return "";
		for(int i=0; i<orderList.size(); i++) {
			int userPrimeNum = orderList.get(i).getUserPrimeNum();
			int  puppyPrimeNum = orderList.get(i).getPuppyPrimeNum();
			result.append("[{\"value\":\""+orderList.get(i).getOrderPrimeNum()+"\"},");
			result.append("{\"value\":\""+userDAO.getUserName(userPrimeNum)+"-"+puppyDAO.getPuppyName(puppyPrimeNum)+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getDueDate().substring(0,4)+"-"+orderList.get(i).getDueDate().substring(4,6)+"-"+orderList.get(i).getDueDate().substring(6,8)+"\"},");
			result.append("{\"value\":\""+orderList.get(i).getDueDateAvailable()+"\"}]");
			if(i != orderList.size()-1) result.append(",");
		}
		if(puppyList.size()!=0) result.append(",");
		for(int i=0; i<puppyList.size(); i++) {
			int userPrimeNum = puppyList.get(i).getUserPrimeNum();
			int  puppyPrimeNum = puppyList.get(i).getPuppyPrimeNum();
			result.append("[{\"value\":\""+puppyList.get(i).getPuppyPrimeNum()+"\"},");
			result.append("{\"value\":\""+userDAO.getUserName(userPrimeNum)+"-"+puppyDAO.getPuppyName(puppyPrimeNum)+"\"},");
			result.append("{\"value\":\""+ puppyList.get(i).getPaymentDate()+"\"},");
			result.append("{\"value\":\""+puppyList.get(i).getPaymentAvailable()+"\"}]");
			if(i != puppyList.size()-1) result.append(",");
		}
		result.append("]}");

		System.out.println(result);
			return result.toString();
		
	}

}
