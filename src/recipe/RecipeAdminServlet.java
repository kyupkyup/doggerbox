package recipe;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import recipe.RecipeDAO2;

@WebServlet("/RecipeAdminServlet")
public class RecipeAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		int recipePrimeNum = Integer.parseInt(request.getParameter("recipePrimeNum"));
			

			try {
				response.getWriter().write(getRecipe(recipePrimeNum));
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		

	}
	
	public String getRecipe(int recipePrimeNum) {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		RecipeDAO2 recipeDAO = new RecipeDAO2();
		ArrayList<Recipe> recipeList = recipeDAO.getRecipe(recipePrimeNum);
		if(recipeList.size()==0) return "";
		for(int i=0; i<recipeList.size(); i++) {
			result.append("[{\"value\":\""+ recipeList.get(i).getProductPrimeNum()+"\"},");
			result.append("{\"value\":\""+ recipeList.get(i).getIngredientPrimeNum()+"\"},");
			result.append("{\"value\":\""+ recipeList.get(i).getRawIngredient()+"\"},");
			result.append("{\"value\":\""+ recipeList.get(i).getRecipePrimeNum()+"\"},");
			result.append("{\"value\":\""+ recipeList.get(i).getMixRate()+"\"},");
			result.append("{\"value\":\""+ recipeList.get(i).getPuppyPrimeNum()+"\"}]");
			if(i != recipeList.size()-1) result.append(",");
		}
		result.append("]}");
		return result.toString();
		
	}

}
