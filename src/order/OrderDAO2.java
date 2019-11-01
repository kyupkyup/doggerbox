package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import doggerboxuser.DoggerboxUser;

public class OrderDAO2 {
	
	DataSource dataSource;

	public OrderDAO2() {
		try {
			InitialContext initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/doggerbox1");
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Order> getList(int puppyPrimeNum){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Order> orderList = new ArrayList<Order>();
		String SQL = "SELECT * FROM order1 WHERE puppyPrimeNum = ?";
		try {
			conn =dataSource.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, puppyPrimeNum);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Order order = new Order();
				order.setRoundPrimeNum(rs.getInt(1));
				order.setOrderPrimeNum(rs.getInt(2));
				order.setUserPrimeNum(rs.getInt(3));
				order.setPuppyPrimeNum(rs.getInt(4));
				order.setOrderBoxNum(rs.getInt(5));
				order.setOrderProductPuppyGram(rs.getInt(6));
				order.setOrderProductPuppyNum(rs.getInt(7));
				order.setOrderProductOriginalGram(rs.getInt(8));
				order.setOrderProductOriginalNum(rs.getInt(9));
				order.setOrderProductSeniorGram(rs.getInt(10));
				order.setOrderProductSeniorNum(rs.getInt(11));
				order.setOrderProductFishGram(rs.getInt(12));
				order.setOrderProductFishNum(rs.getInt(13));
				order.setOrderProductPorkGram(rs.getInt(14));
				order.setOrderProductPorkNum(rs.getInt(15));
				order.setOrderProductKangarooGram(rs.getInt(16));
				order.setOrderProductKangarooNum(rs.getInt(17));
				order.setOrderProductHorseGram(rs.getInt(18));
				order.setOrderProductHorseNum(rs.getInt(19));
				order.setOrderProductPuppyAvailable(rs.getInt(20));
				order.setOrderProductOriginalAvailable(rs.getInt(21));
				order.setOrderProductSeniorAvailable(rs.getInt(22));
				order.setOrderProductFishAvailable(rs.getInt(23));
				order.setOrderProductPorkAvailable(rs.getInt(24));
				order.setOrderProductKangarooAvailable(rs.getInt(25));
				order.setOrderProductHorseAvailable(rs.getInt(26));
				order.setOrderProductPuppyRecipePrimeNum(rs.getInt(27));
				order.setOrderProductOriginalRecipePrimeNum(rs.getInt(28));
				order.setOrderProductSeniorRecipePrimeNum(rs.getInt(29));
				order.setOrderProductFishRecipePrimeNum(rs.getInt(30));
				order.setOrderProductPorkRecipePrimeNum(rs.getInt(31));
				order.setOrderProductKangarooRecipePrimeNum(rs.getInt(32));
				order.setOrderProductHorseRecipePrimeNum(rs.getInt(33));
				order.setOrderTotalQuantity(rs.getInt(34));
				order.setOrderTotalPrice(rs.getInt(35));
				order.setOrderETC(rs.getString(36).replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				order.setOrderPack(rs.getInt(37));
				order.setDueDate(rs.getString(38).replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				order.setRoundTitle(rs.getString(39).replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				order.setDueDateAvailable(rs.getInt(40));
				order.setOrderTitle(rs.getString(41).replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));

				orderList.add(order);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn != null) conn.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}

		}
		return orderList;
	}
	public ArrayList<Order> getListByRound(int roundPrimeNum){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Order> orderList = new ArrayList<Order>();
		String SQL = "SELECT * FROM order1 WHERE roundPrimeNum = ?";
		try {
			conn =dataSource.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, roundPrimeNum);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Order order = new Order();
				order.setRoundPrimeNum(rs.getInt(1));
				order.setOrderPrimeNum(rs.getInt(2));
				order.setUserPrimeNum(rs.getInt(3));
				order.setPuppyPrimeNum(rs.getInt(4));
				order.setOrderBoxNum(rs.getInt(5));
				order.setOrderProductPuppyGram(rs.getInt(6));
				order.setOrderProductPuppyNum(rs.getInt(7));
				order.setOrderProductOriginalGram(rs.getInt(8));
				order.setOrderProductOriginalNum(rs.getInt(9));
				order.setOrderProductSeniorGram(rs.getInt(10));
				order.setOrderProductSeniorNum(rs.getInt(11));
				order.setOrderProductFishGram(rs.getInt(12));
				order.setOrderProductFishNum(rs.getInt(13));
				order.setOrderProductPorkGram(rs.getInt(14));
				order.setOrderProductPorkNum(rs.getInt(15));
				order.setOrderProductKangarooGram(rs.getInt(16));
				order.setOrderProductKangarooNum(rs.getInt(17));
				order.setOrderProductHorseGram(rs.getInt(18));
				order.setOrderProductHorseNum(rs.getInt(19));
				order.setOrderProductPuppyAvailable(rs.getInt(20));
				order.setOrderProductOriginalAvailable(rs.getInt(21));
				order.setOrderProductSeniorAvailable(rs.getInt(22));
				order.setOrderProductFishAvailable(rs.getInt(23));
				order.setOrderProductPorkAvailable(rs.getInt(24));
				order.setOrderProductKangarooAvailable(rs.getInt(25));
				order.setOrderProductHorseAvailable(rs.getInt(26));
				order.setOrderProductPuppyRecipePrimeNum(rs.getInt(27));
				order.setOrderProductOriginalRecipePrimeNum(rs.getInt(28));
				order.setOrderProductSeniorRecipePrimeNum(rs.getInt(29));
				order.setOrderProductFishRecipePrimeNum(rs.getInt(30));
				order.setOrderProductPorkRecipePrimeNum(rs.getInt(31));
				order.setOrderProductKangarooRecipePrimeNum(rs.getInt(32));
				order.setOrderProductHorseRecipePrimeNum(rs.getInt(33));
				order.setOrderTotalQuantity(rs.getInt(34));
				order.setOrderTotalPrice(rs.getInt(35));
				order.setOrderETC(rs.getString(36).replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				order.setOrderPack(rs.getInt(37));
				order.setDueDate(rs.getString(38).replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				order.setRoundTitle(rs.getString(39).replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				order.setDueDateAvailable(rs.getInt(40));
				order.setOrderTitle(rs.getString(41).replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));

				orderList.add(order);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn != null) conn.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}

		}
		return orderList;
	}
	public int orderAdd(int roundPrimeNum, int userPrimeNum, int puppyPrimeNum, 
			int orderBoxNum, int orderProductPuppyGram, int orderProductPuppyNum, 
			int orderProductOriginalGram, int orderProductOriginalNum,
			int orderProductSeniorGram, int orderProductSeniorNum, int orderProductFishGram,
			int orderProductFishNum,
			int orderProductPorkGram, int orderProductPorkNum, int orderProductKangarooGram, 
			int orderProductKangarooNum, int orderProductHorseGram, int orderProductHorseNum, 
			int orderProductPuppyAvailable,int orderProductOriginalAvailable, int orderProductSeniorAvailable, int orderProductFishAvailable, int orderProductPorkAvailable, int orderProductKangarooAvailable, 
			int orderProductHorseAvailable, 
			int orderProductPuppyRecipePrimeNum,
			int orderProductOriginalRecipePrimeNum,
			int orderProductSeniorRecipePrimeNum ,
			int orderProductFishRecipePrimeNum ,
			int orderProductPorkRecipePrimeNum,
			int orderProductKangarooRecipePrimeNum,
			int orderProductHorseRecipePrimeNum ,
			 int orderTotalQuantity,int orderTotalPrice, 
			String orderETC, int orderPack, String dueDate, String roundTitle, String orderTitle) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	String SQL = "INSERT INTO order1 VALUES(?,NULL,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,1,?)";
	try {
		conn =dataSource.getConnection();
		pstmt = conn.prepareStatement(SQL);
		
		pstmt.setInt(1, roundPrimeNum);
		pstmt.setInt(2, userPrimeNum);
		pstmt.setInt(3, puppyPrimeNum);
		pstmt.setInt(4, orderBoxNum);
		pstmt.setInt(5, orderProductPuppyGram);
		pstmt.setInt(6, orderProductPuppyNum);
		pstmt.setInt(7,orderProductOriginalGram);
		pstmt.setInt(8,orderProductOriginalNum);
		pstmt.setInt(9,orderProductSeniorGram);
		pstmt.setInt(10, orderProductSeniorNum);
		pstmt.setInt(11, orderProductFishGram); 	
		pstmt.setInt(12, orderProductFishNum);
		pstmt.setInt(13, orderProductPorkGram);
		pstmt.setInt(14, orderProductPorkNum);
		pstmt.setInt(15, orderProductKangarooGram);
		pstmt.setInt(16,orderProductKangarooNum);
		pstmt.setInt(17, orderProductHorseGram);
		pstmt.setInt(18,orderProductHorseNum);
		pstmt.setInt(19, orderProductPuppyAvailable);
		pstmt.setInt(20,orderProductOriginalAvailable);
		pstmt.setInt(21,orderProductSeniorAvailable);
		pstmt.setInt(22,orderProductFishAvailable);
		pstmt.setInt(23,orderProductPorkAvailable);
		pstmt.setInt(24,orderProductKangarooAvailable);
		pstmt.setInt(25,orderProductHorseAvailable);
		pstmt.setInt(26, orderProductPuppyRecipePrimeNum);
		pstmt.setInt(27,orderProductOriginalRecipePrimeNum);
		pstmt.setInt(28,orderProductSeniorRecipePrimeNum);
		pstmt.setInt(29,orderProductFishRecipePrimeNum);
		pstmt.setInt(30,orderProductPorkRecipePrimeNum);
		pstmt.setInt(31,orderProductKangarooRecipePrimeNum);
		pstmt.setInt(32,orderProductHorseRecipePrimeNum);
		pstmt.setInt(33,orderTotalQuantity);
		pstmt.setInt(34,orderTotalPrice);
		pstmt.setString(35,orderETC);
		pstmt.setInt(36,orderPack);
		pstmt.setString(37,dueDate);
		pstmt.setString(38,roundTitle);
		pstmt.setString(39,orderTitle);

		return pstmt.executeUpdate();
		
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	finally {
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn != null) conn.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}

	}
	return -1;  //데이터베이스 오류
}
	
	public ArrayList<Order> getDate(String start, String end) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "SELECT * FROM order1 WHERE dueDate >= ? and dueDate <= ?";
		ArrayList<Order> orderList = new ArrayList<Order>();
		
		
		try {
			conn =dataSource.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, start);
			pstmt.setString(2, end);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Order order = new Order();
				order.setRoundPrimeNum(rs.getInt(1));
				order.setOrderPrimeNum(rs.getInt(2));
				order.setUserPrimeNum(rs.getInt(3));
				order.setPuppyPrimeNum(rs.getInt(4));
				order.setOrderBoxNum(rs.getInt(5));
				order.setOrderProductPuppyGram(rs.getInt(6));
				order.setOrderProductPuppyNum(rs.getInt(7));
				order.setOrderProductOriginalGram(rs.getInt(8));
				order.setOrderProductOriginalNum(rs.getInt(9));
				order.setOrderProductSeniorGram(rs.getInt(10));
				order.setOrderProductSeniorNum(rs.getInt(11));
				order.setOrderProductFishGram(rs.getInt(12));
				order.setOrderProductFishNum(rs.getInt(13));
				order.setOrderProductPorkGram(rs.getInt(14));
				order.setOrderProductPorkNum(rs.getInt(15));
				order.setOrderProductKangarooGram(rs.getInt(16));
				order.setOrderProductKangarooNum(rs.getInt(17));
				order.setOrderProductHorseGram(rs.getInt(18));
				order.setOrderProductHorseNum(rs.getInt(19));
				order.setOrderProductPuppyAvailable(rs.getInt(20));
				order.setOrderProductOriginalAvailable(rs.getInt(21));
				order.setOrderProductSeniorAvailable(rs.getInt(22));
				order.setOrderProductFishAvailable(rs.getInt(23));
				order.setOrderProductPorkAvailable(rs.getInt(24));
				order.setOrderProductKangarooAvailable(rs.getInt(25));
				order.setOrderProductHorseAvailable(rs.getInt(26));
				order.setOrderProductPuppyRecipePrimeNum(rs.getInt(27));
				order.setOrderProductOriginalRecipePrimeNum(rs.getInt(28));
				order.setOrderProductSeniorRecipePrimeNum(rs.getInt(29));
				order.setOrderProductFishRecipePrimeNum(rs.getInt(30));
				order.setOrderProductPorkRecipePrimeNum(rs.getInt(31));
				order.setOrderProductKangarooRecipePrimeNum(rs.getInt(32));
				order.setOrderProductHorseRecipePrimeNum(rs.getInt(33));
				order.setOrderTotalQuantity(rs.getInt(34));
				order.setOrderTotalPrice(rs.getInt(35));
				order.setOrderETC(rs.getString(36).replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				order.setOrderPack(rs.getInt(37));
				order.setDueDate(rs.getString(38).replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				order.setRoundTitle(rs.getString(39).replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				order.setDueDateAvailable(rs.getInt(40));
				order.setOrderTitle(rs.getString(41));

				orderList.add(order);
		}
			
		}
		catch(Exception e){
			e.printStackTrace();

		}
		finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn != null) conn.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return orderList;
		}
	
	public int setDueDateAvailable(int orderPrimeNum , int dueDateAvailable) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "UPDATE order1 SET dueDateAvailable = ? WHERE orderPrimeNum = ?";
		
		try {
			conn =dataSource.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, dueDateAvailable);
			pstmt.setInt(2, orderPrimeNum);
			
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn != null) conn.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}
	
	public int updateDueDate(int orderPrimeNum , String dueDate) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "UPDATE order1 SET dueDate = ? WHERE orderPrimeNum = ?";
		
		try {
			conn =dataSource.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, dueDate);
			pstmt.setInt(2, orderPrimeNum);
			
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn != null) conn.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}
	
	public int orderUpdate(int roundPrimeNum, int userPrimeNum, int puppyPrimeNum, 
			int orderBoxNum, int orderProductPuppyGram, int orderProductPuppyNum, 
			int orderProductOriginalGram, int orderProductOriginalNum,
			int orderProductSeniorGram, int orderProductSeniorNum, int orderProductFishGram,
			int orderProductFishNum,
			int orderProductPorkGram, int orderProductPorkNum, int orderProductKangarooGram, 
			int orderProductKangarooNum, int orderProductHorseGram, int orderProductHorseNum, 
			int orderProductPuppyAvailable,int orderProductOriginalAvailable, int orderProductSeniorAvailable, int orderProductFishAvailable, int orderProductPorkAvailable, int orderProductKangarooAvailable, 
			int orderProductHorseAvailable, 
			int orderProductPuppyRecipePrimeNum,
			int orderProductOriginalRecipePrimeNum,
			int orderProductSeniorRecipePrimeNum ,
			int orderProductFishRecipePrimeNum ,
			int orderProductPorkRecipePrimeNum,
			int orderProductKangarooRecipePrimeNum,
			int orderProductHorseRecipePrimeNum ,
			 int orderTotalQuantity,int orderTotalPrice, 
			String orderETC, int orderPack, String dueDate, String roundTitle,String orderTitle, int orderPrimeNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "update order1 set roundPrimeNum = ?, userPrimeNum=?, puppyPrimeNum =? , orderBoxNum=?,orderProductPuppyGram=?,orderProductPuppyNum=?,"
				+ "orderProductOriginalGram=?,orderProductOriginalNum=?,orderProductSeniorGram=?,orderProductSeniorNum=?,orderProductFishGram=?,"
				+ "orderProductFishNum=?,orderProductPorkGram=?,"
				+ "orderProductPorkNum=?,orderProductKangarooGram=?,orderProductKangarooNum=?,"
				+ "orderProductHorseGram=?, orderProductHorseNum=?,orderProductPuppyAvailable=?,orderProductOriginalAvailable=?,orderProductSeniorAvailable=?,orderProductFishAvailable=?,"
				+ "orderProductPorkAvailable=?,orderProductKangarooAvailable=?,orderProductHorseAvailable=?,"
				+ "	orderProductPuppyRecipePrimeNum =?," 
				+"	orderProductOriginalRecipePrimeNum =?," 
				+"	orderProductSeniorRecipePrimeNum=? ,"
				+"	orderProductFishRecipePrimeNum =?," 
				+"	orderProductPorkRecipePrimeNum=?," 
				+"	orderProductKangarooRecipePrimeNum=?," 
				+"	orderProductHorseRecipePrimeNum=? ,"
				+ "orderTotalQuantity=?,orderTotalPrice=?,"
				+ "orderETC=?,orderPack=?, dueDate=?, roundTitle=?, orderTitle =?  where orderPrimeNum=? ";
	try {
		conn =dataSource.getConnection();
		pstmt = conn.prepareStatement(SQL);
		pstmt.setInt(1, roundPrimeNum);
		pstmt.setInt(2, userPrimeNum);
		pstmt.setInt(3, puppyPrimeNum);
		pstmt.setInt(4, orderBoxNum);
		pstmt.setInt(5, orderProductPuppyGram);
		pstmt.setInt(6, orderProductPuppyNum);
		pstmt.setInt(7,orderProductOriginalGram);
		pstmt.setInt(8,orderProductOriginalNum);
		pstmt.setInt(9,orderProductSeniorGram);
		pstmt.setInt(10, orderProductSeniorNum);
		pstmt.setInt(11, orderProductFishGram); 	
		pstmt.setInt(12, orderProductFishNum);
		pstmt.setInt(13, orderProductPorkGram);
		pstmt.setInt(14, orderProductPorkNum);
		pstmt.setInt(15, orderProductKangarooGram);
		pstmt.setInt(16,orderProductKangarooNum);
		pstmt.setInt(17, orderProductHorseGram);
		pstmt.setInt(18,orderProductHorseNum);
		pstmt.setInt(19, orderProductPuppyAvailable);
		pstmt.setInt(20,orderProductOriginalAvailable);
		pstmt.setInt(21,orderProductSeniorAvailable);
		pstmt.setInt(22,orderProductFishAvailable);
		pstmt.setInt(23,orderProductPorkAvailable);
		pstmt.setInt(24,orderProductKangarooAvailable);
		pstmt.setInt(25,orderProductHorseAvailable);
		pstmt.setInt(26, orderProductPuppyRecipePrimeNum);
		pstmt.setInt(27,orderProductOriginalRecipePrimeNum);
		pstmt.setInt(28,orderProductSeniorRecipePrimeNum);
		pstmt.setInt(29,orderProductFishRecipePrimeNum);
		pstmt.setInt(30,orderProductPorkRecipePrimeNum);
		pstmt.setInt(31,orderProductKangarooRecipePrimeNum);
		pstmt.setInt(32,orderProductHorseRecipePrimeNum);
		pstmt.setInt(33,orderTotalQuantity);
		pstmt.setInt(34,orderTotalPrice);
		pstmt.setString(35,orderETC);
		pstmt.setInt(36,orderPack);
		pstmt.setString(37,dueDate);
		pstmt.setString(38,roundTitle);
		pstmt.setString(39,orderTitle);
		pstmt.setInt(40,orderPrimeNum);


		
		return pstmt.executeUpdate();
		
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	finally {
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn != null) conn.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}

	}
	return -1;  //데이터베이스 오류
}
	public int deleteOrder(int orderPrimeNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "delete from order1 WHERE orderPrimeNum = ?";
		try {
			conn =dataSource.getConnection();

			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, orderPrimeNum);
		
			return pstmt.executeUpdate(); 
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn != null) conn.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}

		}
		return -1; //데이터베이스 오류 
		
		
	}
}


