package doggerboxuser;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class UserDAO {

	DataSource dataSource;
	
	public UserDAO() {
		try {
			InitialContext initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/doggerbox1");
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public int userAdd( String userName, String userAddress, String userPhoneNum,
			String userIntroRoute, int userRoutine, int userTerm, String introduceWho, int paymentRoute, String userPhoneNum2, String requests) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
	String SQL = "INSERT INTO user VALUES(NULL,?,?,?,?,?,?,?,NOW(),?,?,?,?)";
	try {
		conn =dataSource.getConnection();
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1,userName);
		pstmt.setInt(2,0);
		pstmt.setString(3,userAddress);
		pstmt.setString(4,userPhoneNum);
		pstmt.setString(5,userIntroRoute);
		pstmt.setInt(6,userRoutine);
		pstmt.setInt(7,userTerm);
		pstmt.setString(8,introduceWho);
		pstmt.setInt(9,paymentRoute);
		pstmt.setString(10,userPhoneNum2);
		pstmt.setString(11,requests);

		int r = 0;
		r = pstmt.executeUpdate();
		
		return r;
		
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	
	finally {
		try {
			if(rs!=null) {
				rs.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
			if(conn!=null) {
				conn.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	return -1;
  //데이터베이스 오류
}
	
	public ArrayList<DoggerboxUser> getUserListByName(String userName){
		 ArrayList<DoggerboxUser> userList = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			
		String SQL = "SELECT * FROM user WHERE userName = ?";
		try {
			conn =dataSource.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userName);
			
			rs = pstmt.executeQuery();
			userList = new ArrayList<DoggerboxUser>();
			while(rs.next()) {
				DoggerboxUser user = new DoggerboxUser();
				user.setUserPrimeNum(rs.getInt("userPrimeNum"));
				user.setUserName(rs.getString("userName").replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				user.setUserAddress(rs.getString("userAddress").replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				user.setUserPhoneNum(rs.getString("userPhoneNum").replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				user.setUserIntroRoute(rs.getString("userIntroRoute").replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				user.setUserRoutine(rs.getInt("userRoutine"));
				user.setUserTerm(rs.getInt("userTerm"));
				user.setAddDate(rs.getString("addDate").substring(0,10));
				user.setIntroduceWho(rs.getString("introduceWho").replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				user.setPaymentRoute(rs.getInt("paymentRoute"));
				user.setUserPhoneNum2(rs.getString("userPhoneNum2").replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				user.setRequests(rs.getString("requests").replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));

				userList.add(user);
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
		return userList;
	}
	
	public DoggerboxUser getUserByUserPrimeNum(int userPrimeNum){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DoggerboxUser user = new DoggerboxUser();

		String SQL = "SELECT * FROM user WHERE userPrimeNum = ?";
		try {
			conn =dataSource.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, userPrimeNum);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				user.setUserPrimeNum(rs.getInt("userPrimeNum"));
				user.setUserName(rs.getString("userName").replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				user.setUserAddress(rs.getString("userAddress").replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				user.setUserPhoneNum(rs.getString("userPhoneNum").replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				user.setUserIntroRoute(rs.getString("userIntroRoute").replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				user.setUserRoutine(rs.getInt("userRoutine"));
				user.setUserTerm(rs.getInt("userTerm"));
				user.setAddDate(rs.getString("addDate").substring(0,10));
				user.setUserIntroRoute(rs.getString("introduceWho").replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				user.setPaymentRoute(rs.getInt("paymentRoute"));
				user.setUserPhoneNum2(rs.getString("userPhoneNum2").replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				user.setRequests(rs.getString("requests").replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));

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
		return user;
	}
	public int userUpdate( String userName, String userAddress, String userPhoneNum,
			String userIntroRoute, int userRoutine, int userTerm, String introduceWho, int paymentRoute, String userPhoneNum2, String requests, int userPrimeNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	String SQL = "update user set userName=?, userAddress=?, userPhoneNum=?, userIntroRoute=?,"
			+ "userRoutine=?, userTerm=?, introduceWho=?, paymentRoute=?, userPhoneNum2=? where userPrimeNum=?";
	try {
		conn =dataSource.getConnection();
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, userName);
		pstmt.setString(2, userAddress);
		pstmt.setString(3, userPhoneNum);
		pstmt.setString(4, userIntroRoute);
		pstmt.setInt(5,userRoutine);
		pstmt.setInt(6,userTerm);
		pstmt.setString(7,introduceWho);
		pstmt.setInt(8,paymentRoute);
		pstmt.setString(9,userPhoneNum2);
		pstmt.setInt(10,userPrimeNum);
		pstmt.setString(11,requests);


		
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
	public int deleteUser(int userPrimeNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String SQL = "delete from user WHERE userPrimeNum = ?";
		try {
			conn =dataSource.getConnection();

			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, userPrimeNum);
		
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
