package order;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.CheckType;


@WebServlet("/OrderRegisterServlet")
public class OrderRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		int roundPrimeNum = Integer.parseInt(request.getParameter("roundPrimeNum"));
		int userPrimeNum = Integer.parseInt(request.getParameter("userPrimeNum"));
		int puppyPrimeNum = Integer.parseInt(request.getParameter("puppyPrimeNum"));
		int puppyRecipePrimeNum = Integer.parseInt(request.getParameter("puppyRecipePrimeNum"));
		int originalRecipePrimeNum =Integer.parseInt(request.getParameter("originalRecipePrimeNum"));
		int seniorRecipePrimeNum =Integer.parseInt(request.getParameter("seniorRecipePrimeNum"));
		int fishRecipePrimeNum = Integer.parseInt(request.getParameter("fishRecipePrimeNum"));
		int porkRecipePrimeNum = Integer.parseInt(request.getParameter("porkRecipePrimeNum"));
		int kangarooRecipePrimeNum =Integer.parseInt(request.getParameter("kangarooRecipePrimeNum"));
		int horseRecipePrimeNum = Integer.parseInt(request.getParameter("horseRecipePrimeNum"));
		int puppyGram = 0;
		int puppyNum = 0;
		int originalGram = 0;
		int originalNum = 0;
		int seniorGram =0;
		int seniorNum = 0;
		int fishGram = 0;
		int fishNum = 0;
		int porkGram = 0;
		int porkNum = 0;
		int kangarooGram =0;
		int kangarooNum = 0;
		int horseGram = 0;
		int horseNum =0;
		if(request.getParameter("puppyGram").equals("")) {
			 puppyGram = 0;
		}else
		{
			 puppyGram = Integer.parseInt(request.getParameter("puppyGram"));
		}
		if(request.getParameter("puppyNum").equals("")) {
			 puppyNum = 0;
		}else
		{
			 puppyNum = Integer.parseInt(request.getParameter("puppyNum"));
		}
		if(request.getParameter("originalGram").equals("")) {
			 originalGram = 0;
		}else
		{
			 originalGram = Integer.parseInt(request.getParameter("originalGram"));
		}
		if(request.getParameter("originalNum").equals("")) {
			 originalNum = 0;
		}else
		{
			 originalNum = Integer.parseInt(request.getParameter("originalNum"));
		}
		if(request.getParameter("seniorGram").equals("")) {
			 seniorGram = 0;
		}
		else
		{
			 seniorGram = Integer.parseInt(request.getParameter("seniorGram"));
		}
		
		if(request.getParameter("seniorNum").equals("")) {
			 seniorNum = 0;
		}
		else
		{
			 seniorNum = Integer.parseInt(request.getParameter("seniorNum"));
		}
		if(request.getParameter("fishGram").equals("")) {
			 fishGram = 0;
		}else
		{
			 fishGram = Integer.parseInt(request.getParameter("fishGram"));
		}
		if(request.getParameter("fishNum").equals("")) {
			 fishNum = 0;
		}else
		{
			 fishNum = Integer.parseInt(request.getParameter("fishNum"));
		}
		if(request.getParameter("porkGram").equals("")) {
			 porkGram = 0;
		}else
		{
			 porkGram = Integer.parseInt(request.getParameter("porkGram"));
		}
		if(request.getParameter("porkNum").equals("")) {
			 porkNum = 0;
		}else
		{
			 porkNum = Integer.parseInt(request.getParameter("porkNum"));
		}
		if(request.getParameter("kangarooGram").equals("")) {
			 kangarooGram = 0;
		}else
		{
			 kangarooGram = Integer.parseInt(request.getParameter("kangarooGram"));
		}
		if(request.getParameter("kangarooNum").equals("")) {
			 kangarooNum = 0;
		}else
		{
			 kangarooNum = Integer.parseInt(request.getParameter("kangarooNum"));
		}
		if(request.getParameter("horseGram").equals("")) {
			 horseGram = 0;
		}else
		{
			 horseGram = Integer.parseInt(request.getParameter("horseGram"));
		}
		if(request.getParameter("horseNum").equals("")) {
			 horseNum = 0;
		}else
		{
			 horseNum = Integer.parseInt(request.getParameter("horseNum"));
		}

		int orderProductPuppyAvailable = Integer.parseInt(request.getParameter("orderProductPuppyAvailable"));
		int orderProductOriginalAvailable =Integer.parseInt(request.getParameter("orderProductOriginalAvailable"));
		int orderProductSeniorAvailable =Integer.parseInt(request.getParameter("orderProductSeniorAvailable"));
		int orderProductFishAvailable = Integer.parseInt(request.getParameter("orderProductFishAvailable"));
		int orderProductPorkAvailable =Integer.parseInt(request.getParameter("orderProductPorkAvailable"));
		int orderProductKangarooAvailable =Integer.parseInt(request.getParameter("orderProductKangarooAvailable"));
		int orderProductHorseAvailable = Integer.parseInt(request.getParameter("orderProductHorseAvailable"));
		int totalQuantity = Integer.parseInt(request.getParameter("totalQuantity"));
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		String orderETC = request.getParameter("orderETC");
		int orderPack =Integer.parseInt(request.getParameter("orderPack"));
		String dueDate = request.getParameter("dueDate");

		String roundTitle = request.getParameter("roundTitle");

		if(CheckType.checkInt(request.getParameter("roundPrimeNum")) == false) {
			response.getWriter().write("-10");
		}
		if(CheckType.checkInt(request.getParameter("userPrimeNum")) == false) {
			response.getWriter().write("-10");
		}
		if(CheckType.checkInt(request.getParameter("puppyPrimeNum")) == false) {
			response.getWriter().write("-10");
		}
		if(CheckType.checkInt(request.getParameter("puppyRecipePrimeNum")) == false) {
			response.getWriter().write("-10");
		}
		if(CheckType.checkInt(request.getParameter("originalRecipePrimeNum")) == false) {
			response.getWriter().write("-10");
		}
		if(CheckType.checkInt(request.getParameter("seniorRecipePrimeNum")) == false) {
			response.getWriter().write("-10");
		}
		if(CheckType.checkInt(request.getParameter("fishRecipePrimeNum")) == false) {
			response.getWriter().write("-10");
		}
		if(CheckType.checkInt(request.getParameter("porkRecipePrimeNum")) == false) {
			response.getWriter().write("-10");
		}
		if(CheckType.checkInt(request.getParameter("kangarooRecipePrimeNum")) == false) {
			response.getWriter().write("-10");
		}
		if(CheckType.checkInt(request.getParameter("horseRecipePrimeNum")) == false) {
			response.getWriter().write("-10");
		}
		if(CheckType.checkInt(request.getParameter("puppyGram")) == false) {
			response.getWriter().write("-10");
		}
		if(CheckType.checkInt(request.getParameter("puppyNum")) == false) {
			response.getWriter().write("-10");
		}
		if(CheckType.checkInt(request.getParameter("originalGram")) == false) {
			response.getWriter().write("-10");
		}
		if(CheckType.checkInt(request.getParameter("originalNum")) == false) {
			response.getWriter().write("-10");
		}
		if(CheckType.checkInt(request.getParameter("seniorGram")) == false) {
			response.getWriter().write("-10");
		}
		if(CheckType.checkInt(request.getParameter("seniorNum")) == false) {
			response.getWriter().write("-10");
		}
		if(CheckType.checkInt(request.getParameter("fishGram")) == false) {
			response.getWriter().write("-10");
		}
		if(CheckType.checkInt(request.getParameter("fishNum")) == false) {
			response.getWriter().write("-10");
		}
		if(CheckType.checkInt(request.getParameter("porkGram")) == false) {
			response.getWriter().write("-10");
		}
		if(CheckType.checkInt(request.getParameter("porkNum")) == false) {
			response.getWriter().write("-10");
		}
		if(CheckType.checkInt(request.getParameter("kangarooGram")) == false) {
			response.getWriter().write("-10");
		}
		if(CheckType.checkInt(request.getParameter("kangarooNum")) == false) {
			response.getWriter().write("-10");
		}
		if(CheckType.checkInt(request.getParameter("horseGram")) == false) {
			response.getWriter().write("-10");
		}
		if(CheckType.checkInt(request.getParameter("horseNum")) == false) {
			response.getWriter().write("-10");
		}
		
		
		if(false)
		{
			response.getWriter().write("0");
		}
		else {
			orderETC = URLDecoder.decode(orderETC,"UTF-8");
			roundTitle = URLDecoder.decode(roundTitle,"UTF-8");
			dueDate = URLDecoder.decode(dueDate,"UTF-8");

			response.getWriter().write(new OrderDAO2().orderAdd(
					 roundPrimeNum,  userPrimeNum,  puppyPrimeNum, 
					 0,puppyGram, puppyNum, 
					 originalGram,  originalNum,
					 seniorGram,  seniorNum,  fishGram,
					 fishNum,
					 porkGram, porkNum,  kangarooGram, 
					 kangarooNum,  horseGram,  horseNum, 
					 orderProductPuppyAvailable, orderProductOriginalAvailable,  orderProductSeniorAvailable, 
					 orderProductFishAvailable,  orderProductPorkAvailable,  orderProductKangarooAvailable, 
					 orderProductHorseAvailable, 
					 puppyRecipePrimeNum,
					 originalRecipePrimeNum,
					 seniorRecipePrimeNum ,
					 fishRecipePrimeNum ,
					 porkRecipePrimeNum,
					 kangarooRecipePrimeNum,
					 horseRecipePrimeNum ,
					 totalQuantity, totalPrice, 
					 orderETC,  orderPack,dueDate, roundTitle)+"");
		}

	}

}
