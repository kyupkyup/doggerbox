package recipeList;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import recipe.RecipeDAO2;

@WebServlet("/RecipeListServlet")
public class RecipeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		int puppyPrimeNum = Integer.parseInt(request.getParameter("puppyPrimeNum"));
			

			try {
				response.getWriter().write(getOrderList(puppyPrimeNum));
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		

	}
	
	public String getOrderList(int puppyPrimeNum) {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		RecipeListDAO2 recipeListDAO = new RecipeListDAO2();
		ArrayList<RecipeList> recipeList = recipeListDAO.getRecipeList(puppyPrimeNum);
		if(recipeList.size()==0) return "";
		for(int i=0; i<recipeList.size(); i++) {
			result.append("[{\"value\":\""+ recipeList.get(i).getRecipePrimeNum()+"\"},");
			result.append("{\"value\":\""+ recipeList.get(i).getPuppyPrimeNum()+"\"},");
			result.append("{\"value\":\""+ recipeList.get(i).getProductName()+"\"},");
			result.append("{\"value\":\""+ recipeList.get(i).getRecipeAvailable()+"\"},");
			result.append("{\"value\":\""+ recipeList.get(i).getProductPrimeNum()+"\"},");
			result.append("{\"value\":\""+ recipeList.get(i).getRecipeDate()+"\"}]");
			if(i != recipeList.size()-1) result.append(",");
		}
		result.append("]}");
		return result.toString();
		
	}

}
