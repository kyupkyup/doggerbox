package puppy;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class PuppyListServlet
 */
@WebServlet("/PuppyListServlet")
public class PuppyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		int userPrimeNum = Integer.parseInt(request.getParameter("userPrimeNum"));
		
		if(userPrimeNum == 0)
		{
			response.getWriter().write("");
		}
		else {
			try {
				response.getWriter().write(getPuppyList(userPrimeNum));
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}

	}
	
	public String getPuppyList(int userPrimeNum) {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		PuppyDAO2 puppyDAO = new PuppyDAO2();
		ArrayList<Puppy> puppyList = puppyDAO.getPuppyListByUserPrimeNum(userPrimeNum);
		if(puppyList.size()==0) return "";
		for(int i=0; i<puppyList.size(); i++) {
			result.append("[{\"value\":\""+ puppyList.get(i).getUserPrimeNum()+"\"},");
			result.append("{\"value\":\""+ puppyList.get(i).getPuppyPrimeNum()+"\"},");
			result.append("{\"value\":\""+ puppyList.get(i).getPuppyName()+"\"},");
			result.append("{\"value\":\""+ puppyList.get(i).getPuppySpecies()+"\"},");
			result.append("{\"value\":\""+ puppyList.get(i).getPuppyAge()+"\"},");
			result.append("{\"value\":\""+ puppyList.get(i).getPuppyAgeMonth()+"\"},");
			result.append("{\"value\":\""+ puppyList.get(i).getPuppyAgeETC()+"\"},");
			result.append("{\"value\":\""+ puppyList.get(i).getPuppyGender()+"\"},");
			result.append("{\"value\":\""+ puppyList.get(i).getPuppyNeutralization()+"\"},");
			result.append("{\"value\":\""+ puppyList.get(i).getPuppyWeight()+"\"},");
			result.append("{\"value\":\""+ puppyList.get(i).getPuppyWeightETC()+"\"},");
			result.append("{\"value\":\""+ puppyList.get(i).getPuppyActivity()+"\"},");
			result.append("{\"value\":\""+ puppyList.get(i).getRecommendedQuantity()+"\"},");
			result.append("{\"value\":\""+ puppyList.get(i).getPuppyETC()+"\"},");
			result.append("{\"value\":\""+ puppyList.get(i).getPuppyRestrict()+"\"},");
			result.append("{\"value\":\""+ puppyList.get(i).getPaymentDate()+"\"},");
			result.append("{\"value\":\""+ puppyList.get(i).getWeightControl()+"\"},");
			result.append("{\"value\":\""+ puppyList.get(i).getFoodSpecies()+"\"}]");
			if(i != puppyList.size()-1) result.append(",");
		}
		result.append("]}");
		return result.toString();
		
	}


}
