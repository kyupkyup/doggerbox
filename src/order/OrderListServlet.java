package order;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/OrderListServlet")
public class OrderListServlet extends HttpServlet {
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
		OrderDAO2 orderDAO = new OrderDAO2();
		ArrayList<Order> orderList = orderDAO.getList(puppyPrimeNum);
		if(orderList.size()==0) return "";
		for(int i=0; i<orderList.size(); i++) {
			result.append("[{\"value\":\""+ orderList.get(i).getRoundPrimeNum()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getOrderPrimeNum()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getUserPrimeNum()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getPuppyPrimeNum()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getOrderBoxNum()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getOrderProductPuppyGram()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getOrderProductPuppyNum()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getOrderProductOriginalGram()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getOrderProductOriginalNum()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getOrderProductSeniorGram()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getOrderProductSeniorNum()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getOrderProductFishGram()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getOrderProductFishNum()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getOrderProductPorkGram()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getOrderProductPorkNum()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getOrderProductKangarooGram()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getOrderProductKangarooNum()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getOrderProductHorseGram()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getOrderProductHorseNum()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getOrderProductPuppyAvailable()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getOrderProductOriginalAvailable()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getOrderProductSeniorAvailable()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getOrderProductFishAvailable()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getOrderProductPorkAvailable()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getOrderProductKangarooAvailable()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getOrderProductHorseAvailable()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getOrderProductPuppyRecipePrimeNum()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getOrderProductOriginalRecipePrimeNum()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getOrderProductSeniorRecipePrimeNum()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getOrderProductFishRecipePrimeNum()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getOrderProductPorkRecipePrimeNum()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getOrderProductKangarooRecipePrimeNum()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getOrderProductHorseRecipePrimeNum()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getOrderTotalQuantity()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getOrderTotalPrice()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getOrderETC()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getOrderPack()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getDueDate()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getRoundTitle()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getDueDateAvailable()+"\"},");
			result.append("{\"value\":\""+ orderList.get(i).getOrderTitle()+"\"}]");

			if(i != orderList.size()-1) result.append(",");
		}
		result.append("]}");
		return result.toString();
		
	}

}
