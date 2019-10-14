package recipe;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.CheckType;


@WebServlet("/RecipeUpdateServlet")
public class RecipeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String[] rawIngredient = request.getParameterValues("rawIngredient");
		String[] mixRateBase = request.getParameterValues("mixRate");
		String[] ingredientPrimeNumBase = request.getParameterValues("ingredientPrimeNum");
		int recipePrimeNum = Integer.parseInt(request.getParameter("recipePrimeNum"));
				
		
		
		System.out.println(mixRateBase.length+","+rawIngredient.length+","+ingredientPrimeNumBase.length);
		double[] mixRate = new double[mixRateBase.length] ;
		int[] ingredientPrimeNum = new int[ingredientPrimeNumBase.length];
		for(int i=0; i<rawIngredient.length; i++) {
			if(CheckType.checkDouble(mixRateBase[i]) == false) {
				response.getWriter().write("-10");
				return;
			}
			mixRate[i] = Double.parseDouble(mixRateBase[i]);
			ingredientPrimeNum[i] = Integer.parseInt(ingredientPrimeNumBase[i]);
		}
		
		
		if(rawIngredient == null ||mixRate == null 
				||rawIngredient.equals("") ||mixRate.equals("") )
		{
			response.getWriter().write("0");
		}
		else {
			for(int i =0; i<rawIngredient.length; i++) {
				rawIngredient[i] = URLDecoder.decode(rawIngredient[i],"UTF-8");

			}

			response.getWriter().write(new RecipeDAO2().recipeUpdate(ingredientPrimeNum, rawIngredient, mixRate, recipePrimeNum)+"");
		}

	}

}
