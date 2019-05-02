package doggerboxuser;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DoggerboxUserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public DoggerboxUserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost/luppyworld?serverTimezone=UTC";	//���� ����
			String dbID = "luppyworld";
			String dbPassword = "a1870523!!";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);	//������Ѽ� conn�� ����
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	public int getNext() {
		String SQL = "SELECT userPrimeNum FROM doggerboxUser ORDER BY userPrimeNum DESC";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1) + 1;
				 
			}
			return 1; // ù��° �Խñ��� ���
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����

	}
	
	public int userAdd( String userName, int userBasicAddressNum, String userAddress, String userPhoneNum,
				String userIntroRoute, int userRoutine, int userTerm) {
		String SQL = "INSERT INTO doggerboxUser VALUES(?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, userName);
			pstmt.setInt(3, userBasicAddressNum);
			pstmt.setString(4, userAddress);
			pstmt.setString(5, userPhoneNum);
			pstmt.setString(6, userIntroRoute);
			pstmt.setInt(7,userRoutine);
			pstmt.setInt(8,userTerm);

			
			return pstmt.executeUpdate();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;  //�����ͺ��̽� ����
	}
	
	public DoggerboxUser getUser(int userPrimeNum) {
		String SQL = "SELECT * FROM doggerboxUser WHERE userPrimeNum = ? ";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  userPrimeNum);
			
			rs = pstmt.executeQuery();
				if(rs.next()) {
					DoggerboxUser user = new DoggerboxUser();
					user.setUserPrimeNum(rs.getInt(1));
					user.setUserName(rs.getString(2));
					user.setUserBasicAddressNum(rs.getInt(3));
					user.setUserAddress(rs.getString(4));
					user.setUserPhoneNum(rs.getString(5));
					user.setUserIntroRoute(rs.getString(6));
					user.setUserRoutine(rs.getInt(7));
					user.setUserTerm(rs.getInt(8));
						 
					return user;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return null; // �ҷ����� ����
	}
	public ArrayList<DoggerboxUser> getList(){
		String SQL = "SELECT * FROM doggerboxUser";
		
		ArrayList<DoggerboxUser> list = new ArrayList<DoggerboxUser>();
		
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				DoggerboxUser user = new DoggerboxUser();
				user.setUserPrimeNum(rs.getInt(1));
				user.setUserName(rs.getString(2));
				user.setUserBasicAddressNum(rs.getInt(3));
				user.setUserAddress(rs.getString(4));
				user.setUserPhoneNum(rs.getString(5));
				user.setUserIntroRoute(rs.getString(6));
				user.setUserRoutine(rs.getInt(7));
				user.setUserTerm(rs.getInt(8));
				list.add(user);
								 
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	
		return list; //������ ��ȯ
		
	}
	public ArrayList<DoggerboxUser> getUserList(String userName){
		String SQL = "SELECT * FROM doggerboxUser where userName = ?";
		
		ArrayList<DoggerboxUser> list = new ArrayList<DoggerboxUser>();
		

		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userName);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				DoggerboxUser user = new DoggerboxUser();
				user.setUserPrimeNum(rs.getInt(1));
				user.setUserName(rs.getString(2));
				user.setUserBasicAddressNum(rs.getInt(3));
				user.setUserAddress(rs.getString(4));
				user.setUserPhoneNum(rs.getString(5));
				user.setUserIntroRoute(rs.getString(6));
				user.setUserRoutine(rs.getInt(7));
				user.setUserTerm(rs.getInt(8));
				list.add(user);
								 
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	
		return list; //������ ��ȯ
		
	}
	
	public String getUserName(int userPrimeNum){
		String SQL = "SELECT userName FROM doggerboxUser WHERE userPrimeNum = ? ";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  userPrimeNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getString(1);
								 
			}
			else 
				{
				return null;
				}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	return null;
		
	}
	
	public int userUpdate( String userName, int userBasicAddressNum, String userAddress, String userPhoneNum,
			String userIntroRoute, int userRoutine, int userTerm, int userPrimeNum) {
	String SQL = "update doggerboxUser set userName=?, userBasicAddressNum=?, userAddress=?, userPhoneNum=?, userIntroRoute=?,"
			+ "userRoutine=?, userTerm=? where userPrimeNum=?";
	try {
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, userName);
		pstmt.setInt(2, userBasicAddressNum);
		pstmt.setString(3, userAddress);
		pstmt.setString(4, userPhoneNum);
		pstmt.setString(5, userIntroRoute);
		pstmt.setInt(6,userRoutine);
		pstmt.setInt(7,userTerm);
		pstmt.setInt(8,userPrimeNum);


		
		return pstmt.executeUpdate();
		
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	return -1;  //�����ͺ��̽� ����
}
	
	
	public int deleteUser(int userPrimeNum) {
		
		String SQL = "delete from doggerboxUser WHERE userPrimeNum = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, userPrimeNum);
		
			return pstmt.executeUpdate(); 
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ���� 
		
		
	}
	public int getUserRoutine(int userPrimeNum){
		String SQL = "SELECT userRoutine FROM doggerboxUser WHERE userPrimeNum = ? ";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  userPrimeNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1);
								 
			}
			else 
				{
				return 0;
				}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	return 0;
		
	}
}
