package puppy;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/PuppyUpdateServlet")
public class PuppyUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		int puppyPrimeNum = Integer.parseInt(request.getParameter("puppyPrimeNum"));
		String puppyName = request.getParameter("puppyName");
		String puppySpecies = request.getParameter("puppySpecies");
		int puppyAge = Integer.parseInt(request.getParameter("puppyAge"));
		int puppyAgeMonth = Integer.parseInt(request.getParameter("puppyAgeMonth"));
		int puppyNeutralization = Integer.parseInt(request.getParameter("puppyNeutralization"));
		int puppyGender = Integer.parseInt(request.getParameter("puppyGender"));
		int puppyWeight = Integer.parseInt(request.getParameter("puppyWeight"));
		int recommendedQuantity = Integer.parseInt(request.getParameter("recommendedQuantity"));
		int puppyActivity = Integer.parseInt(request.getParameter("puppyActivity"));
		String puppyETC = request.getParameter("puppyETC");
		String puppyRestrict = request.getParameter("puppyRestrict");
		String paymentDate =  request.getParameter("paymentDate");
		
		if(puppyName == null ||puppySpecies == null ||puppyETC == null ||
				puppyRestrict == null 
				||puppyName.equals("") ||puppySpecies.equals("")  ||puppyETC.equals("")  ||
				puppyRestrict.equals(""))
		{
			response.getWriter().write("0");
		}
		else {
			puppyName = URLDecoder.decode(puppyName,"UTF-8");
			puppySpecies=URLDecoder.decode(puppySpecies, "UTF-8");
			puppyETC=URLDecoder.decode(puppyETC, "UTF-8");
			puppyRestrict=URLDecoder.decode(puppyRestrict, "UTF-8");
			response.getWriter().write(new PuppyDAO2().puppyUpdate(puppyName,  puppySpecies,  puppyAge,  puppyAgeMonth,
					 puppyGender, puppyNeutralization,  puppyWeight, recommendedQuantity,  puppyActivity,  puppyETC,  puppyRestrict, paymentDate, puppyPrimeNum)+"");
		}

	}

}
