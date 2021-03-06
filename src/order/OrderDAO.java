package order;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import puppy.Puppy;

	public class OrderDAO {
		private Connection conn;
		private PreparedStatement pstmt;
		private ResultSet rs;
		
		public OrderDAO() {
			try {
				String dbURL = "jdbc:mysql://localhost/doggerbox1?serverTimezone=UTC";	//서버 선언
				String dbID = "doggerbox1";
				String dbPassword = "a1870523!!";
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(dbURL, dbID, dbPassword);	//연결시켜서 conn에 저장
				
			}
			
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		public int getNext() {
			String SQL = "SELECT orderPrimeNum FROM order1 ORDER BY orderPrimeNum DESC";
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					return rs.getInt(1) + 1;
					 
				}
				return 1; // 첫번째 게시글인 경우
				
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return -1; //데이터베이스 오류

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
				String orderETC, int orderPack) {
		String SQL = "INSERT INTO order1 VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, roundPrimeNum);
			pstmt.setInt(2, getNext());
			pstmt.setInt(3, userPrimeNum);
			pstmt.setInt(4, puppyPrimeNum);
			pstmt.setInt(5, orderBoxNum);
			pstmt.setInt(6, orderProductPuppyGram);
			pstmt.setInt(7, orderProductPuppyNum);
			pstmt.setInt(8,orderProductOriginalGram);
			pstmt.setInt(9,orderProductOriginalNum);
			pstmt.setInt(10,orderProductSeniorGram);
			pstmt.setInt(11, orderProductSeniorNum);
			pstmt.setInt(12, orderProductFishGram); 	
			pstmt.setInt(13, orderProductFishNum);
			pstmt.setInt(14, orderProductPorkGram);
			pstmt.setInt(15, orderProductPorkNum);
			pstmt.setInt(16, orderProductKangarooGram);
			pstmt.setInt(17,orderProductKangarooNum);
			pstmt.setInt(18, orderProductHorseGram);
			pstmt.setInt(19,orderProductHorseNum);
			pstmt.setInt(20, orderProductPuppyAvailable);
			pstmt.setInt(21,orderProductOriginalAvailable);
			pstmt.setInt(22,orderProductSeniorAvailable);
			pstmt.setInt(23,orderProductFishAvailable);
			pstmt.setInt(24,orderProductPorkAvailable);
			pstmt.setInt(25,orderProductKangarooAvailable);
			pstmt.setInt(26,orderProductHorseAvailable);
			pstmt.setInt(27, orderProductPuppyRecipePrimeNum);
			pstmt.setInt(28,orderProductOriginalRecipePrimeNum);
			pstmt.setInt(29,orderProductSeniorRecipePrimeNum);
			pstmt.setInt(30,orderProductFishRecipePrimeNum);
			pstmt.setInt(31,orderProductPorkRecipePrimeNum);
			pstmt.setInt(32,orderProductKangarooRecipePrimeNum);
			pstmt.setInt(33,orderProductHorseRecipePrimeNum);
			pstmt.setInt(34,orderTotalQuantity);
			pstmt.setInt(35,orderTotalPrice);
			pstmt.setString(36,orderETC);
			pstmt.setInt(37,orderPack);
			pstmt.setInt(38,1);

			

			
			return pstmt.executeUpdate();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;  //데이터베이스 오류
	}
		public ArrayList<Order> getList(int roundPrimeNum){
			String SQL = "SELECT * FROM order1 where roundPrimeNum =?";
			
			ArrayList<Order> list = new ArrayList<Order>();
			
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1,  roundPrimeNum);

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
					order.setOrderETC(rs.getString(36));
					order.setOrderPack(rs.getInt(37));
					list.add(order);
									 
				}
				
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
		
			return list; //데이터 반환
			
		}	
		public ArrayList<Order> getListByPuppy(int puppyPrimeNum){
			String SQL = "SELECT * FROM order1 where puppyPrimeNum =? and orderAvailable = 1 ";
			
			ArrayList<Order> list = new ArrayList<Order>();
			
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1,  puppyPrimeNum);

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
					order.setOrderETC(rs.getString(36));
					order.setOrderPack(rs.getInt(37));
					list.add(order);
									 
				}
				
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
		
			return list; //데이터 반환
			
		}	
		public Order getOrder(int orderPrimeNum) {
			String SQL = "SELECT * FROM order1 WHERE orderPrimeNum = ?";
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1,  orderPrimeNum);
				
				rs = pstmt.executeQuery();
					if(rs.next()) {
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
						order.setOrderETC(rs.getString(36));
						order.setOrderPack(rs.getInt(37));
	 
						return order;
				}
				
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return null; // 불러오기 실패
		}
		
		public int orderUpdate(int userPrimeNum,
				int orderBoxNum, int orderProductPuppyGram, int orderProductPuppyNum, 
				int orderProductOriginalGram, int orderProductOriginalNum,
				int orderProductSeniorGram, int orderProductSeniorNum, int orderProductFishGram,
				int orderProductFishNum,
				int orderProductPorkGram, int orderProductPorkNum, int orderProductKangarooGram, 
				int orderProductKangarooNum,  int orderProductHorseGram, 
				int orderProductPuppyAvailable,int orderProductOriginalAvailable, int orderProductSeniorAvailable, int orderProductFishAvailable, int orderProductPorkAvailable, int orderProductKangarooAvailable, 
				int orderProductHorseAvailable, 
				int orderProductIndividualNum,int orderTotalQuantity,int orderTotalPrice, 
				String orderETC, int orderPack, int orderPrimeNum) {
		String SQL = "update order1 set userPrimeNum=?,orderBoxNum=?,orderProductPuppyGram=?,orderProductPuppyNum=?,"
				+ "orderProductOriginalGram=?,orderProductOriginalNum=?,orderProductSeniorGram=?,orderProductSeniorNum=?,orderProductFishGram=?,"
				+ "orderProductFishNum=?,orderProductPorkGram=?,"
				+ "orderProductPorkNum=?,orderProductKangarooGram=?,orderProductKangarooNum=?,"
				+ "orderProductHorseGram=?, orderProductHorseNum=?,orderProductPuppyAvailable=?,orderProductOriginalAvailable=?,orderProductSeniorAvailable=?,orderProductFishAvailable=?,"
				+ "orderProductPorkAvailable=?,orderProductKangarooAvailable=?,orderProductHorseAvailable=?,orderTotalQuantity=?,orderTotalPrice=?,"
				+ "orderETC=?,orderPack=? where orderPrimeNum=? ";
		try {
			pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1, userPrimeNum);
			pstmt.setInt(2, orderBoxNum);
			pstmt.setInt(3, orderProductPuppyGram);
			pstmt.setInt(4, orderProductPuppyNum);
			pstmt.setInt(5,orderProductOriginalGram);
			pstmt.setInt(6,orderProductOriginalNum);
			pstmt.setInt(7,orderProductSeniorGram);
			pstmt.setInt(8, orderProductSeniorNum);
			pstmt.setInt(9, orderProductFishGram);
			pstmt.setInt(10, orderProductFishNum);
			pstmt.setInt(11, orderProductPorkGram);
			pstmt.setInt(12, orderProductPorkNum);
			pstmt.setInt(13, orderProductKangarooGram);
			pstmt.setInt(14,orderProductKangarooNum);
			pstmt.setInt(15, orderProductHorseGram);
			pstmt.setInt(16,orderProductPuppyAvailable);
			pstmt.setInt(17, orderProductOriginalAvailable);
			pstmt.setInt(18,orderProductSeniorAvailable);
			pstmt.setInt(19, orderProductFishAvailable);
			pstmt.setInt(20,orderProductPorkAvailable);
			pstmt.setInt(21, orderProductKangarooAvailable);
			pstmt.setInt(22, orderProductHorseAvailable);
			pstmt.setInt(23,orderProductIndividualNum);
			pstmt.setInt(24,orderTotalQuantity);
			pstmt.setInt(25,orderTotalPrice);
			pstmt.setString(26,orderETC);
			pstmt.setInt(27,orderPack);
			pstmt.setInt(28, orderPrimeNum);
			return pstmt.executeUpdate();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;  //데이터베이스 오류
	}
		public int deleteOrder(int orderPrimeNum) {
			
			String SQL = "update order1 set orderAvailable = 0 WHERE orderPrimeNum = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, orderPrimeNum);
			
				return pstmt.executeUpdate(); 
				
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return -1; //데이터베이스 오류 
			
			
		}

	}
