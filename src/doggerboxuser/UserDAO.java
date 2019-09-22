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
			String userIntroRoute, int userRoutine, int userTerm) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
	String SQL = "INSERT INTO user VALUES(NULL,?,?,?,?,?,?,?,NOW())";
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
  //�����ͺ��̽� ����
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
			String userIntroRoute, int userRoutine, int userTerm, int userPrimeNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	String SQL = "update user set userName=?, userAddress=?, userPhoneNum=?, userIntroRoute=?,"
			+ "userRoutine=?, userTerm=? where userPrimeNum=?";
	try {
		conn =dataSource.getConnection();
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, userName);
		pstmt.setString(2, userAddress);
		pstmt.setString(3, userPhoneNum);
		pstmt.setString(4, userIntroRoute);
		pstmt.setInt(5,userRoutine);
		pstmt.setInt(6,userTerm);
		pstmt.setInt(7,userPrimeNum);


		
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
	return -1;  //�����ͺ��̽� ����
}
	public int deleteUser(int userPrimeNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "delete user WHERE userPrimeNum = ?";
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
		return -1; //�����ͺ��̽� ���� 
		
		
	}
}