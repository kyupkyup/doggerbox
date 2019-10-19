package puppy;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.CheckType;

@WebServlet("/PuppyRegisterServlet")
public class PuppyRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		int userPrimeNum = Integer.parseInt(request.getParameter("userPrimeNum"));
		String puppyName = request.getParameter("puppyName");
		String puppySpecies = request.getParameter("puppySpecies");
		int puppyAge = Integer.parseInt(request.getParameter("puppyAge"));
		int puppyAgeMonth = Integer.parseInt(request.getParameter("puppyAgeMonth"));
		String puppyAgeETC =request.getParameter("puppyAgeETC");
		int puppyNeutralization = Integer.parseInt(request.getParameter("puppyNeutralization"));
		int puppyGender = Integer.parseInt(request.getParameter("puppyGender"));
		double puppyWeight = Double.parseDouble(request.getParameter("puppyWeight"));
		String puppyWeightETC = request.getParameter("puppyWeightETC");
		int recommendedQuantity = Integer.parseInt(request.getParameter("recommendedQuantity"));
		int puppyActivity = Integer.parseInt(request.getParameter("puppyActivity"));
		String puppyETC = request.getParameter("puppyETC");
		String puppyRestrict = request.getParameter("puppyRestrict");
		String paymentDate =  request.getParameter("paymentDate");
		int weightControl = Integer.parseInt(request.getParameter("weightControl"));
		int foodSpecies = Integer.parseInt(request.getParameter("foodSpecies"));

		if(CheckType.checkInt(request.getParameter("puppyAge")) == false) {
			response.getWriter().write("-10");
		}
		if(CheckType.checkInt(request.getParameter("puppyAgeMonth")) == false) {
			response.getWriter().write("-10");
		}
		if(CheckType.checkDouble(request.getParameter("puppyWeight")) == false) {
			response.getWriter().write("-10");
		}
		if(CheckType.checkInt(request.getParameter("recommendedQuantity")) == false) {
			response.getWriter().write("-10");
		}
		
		
		if(false
				
				)
		{
			response.getWriter().write("0");
		}
		else {
			puppyName = URLDecoder.decode(puppyName,"UTF-8");
			puppySpecies=URLDecoder.decode(puppySpecies, "UTF-8");
			puppyETC=URLDecoder.decode(puppyETC, "UTF-8");
			puppyRestrict=URLDecoder.decode(puppyRestrict, "UTF-8");
			puppyAgeETC=URLDecoder.decode(puppyAgeETC, "UTF-8");
			puppyWeightETC=URLDecoder.decode(puppyWeightETC, "UTF-8");

			response.getWriter().write(new PuppyDAO2().puppyAdd(userPrimeNum,  puppyName,  puppySpecies,  puppyAge,  puppyAgeMonth,
					 puppyAgeETC, puppyGender, puppyNeutralization,  puppyWeight, puppyWeightETC, recommendedQuantity,  puppyActivity,  puppyETC,  puppyRestrict, paymentDate,weightControl, foodSpecies)+"");
		}
	}
}
