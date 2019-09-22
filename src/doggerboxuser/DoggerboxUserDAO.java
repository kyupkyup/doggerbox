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
		String SQL = "SELECT userPrimeNum FROM doggerboxUser ORDER BY userPrimeNum DESC";
		
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
		return -1 ; //데이터베이스 오류

	}
	public int login(String userID) {
		String SQL = "SELECT userPrimeNum FROM doggerboxUser WHERE userPrimeNum = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) { // 결과가 존재한다면
				if(rs.getString(1).equals(userID)) {
					return 1; // 로그인 성공
				}
				else 
					return 0; // 비밀번호 불일치
				
			}
			return -1; //아이디가 없음
			
		}
		
		catch(Exception e){
			e.printStackTrace();
		}
		return -2; // 데이터 베이스 오류
		
	}
	public int join(String userID, String profile_image, String thumbnail_image, String userGender, String userAge) {
		String SQL = "INSERT INTO doggerboxUser VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, null);
			pstmt.setInt(3, 0);
			pstmt.setString(4, null);
			pstmt.setString(5, null);
			pstmt.setInt(6, 0);
			pstmt.setInt(7, 0);
			pstmt.setString(8, profile_image);
			pstmt.setString(9, thumbnail_image);
			pstmt.setString(10, userGender);
			pstmt.setString(11, userAge);
			pstmt.setString(12, null);

			return pstmt.executeUpdate();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;  //데이터베이스 오류
	}
	
	public int additional_information( String userName, int userAddressNum, String userAddress, String userPhoneNum,
			String userEmail, String userID) {
	String SQL = "update doggerboxUser set userName=?, userAddressNum=?, userAddress=?, userPhoneNum=?,"+
			"userEmail=? where userPrimeNum=?";
	try {
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, userName);
		pstmt.setInt(2, userAddressNum);
		pstmt.setString(3, userAddress);
		pstmt.setString(4, userPhoneNum);
		pstmt.setString(5, userEmail);
		pstmt.setString(6,userID);


		
		return pstmt.executeUpdate();
		
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	return -1;  //데이터베이스 오류
}
	
	
	public int additional_information_update( String userName, int userAddressNum, String userAddress, String userPhoneNum,
			String userEmail, String userID) {
	String SQL = "update doggerboxUser set userName=?, userAddressNum=?, userAddress=?, userPhoneNum=?,"+
			"userEmail=? where userPrimeNum=?";
	try {
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, userName);
		pstmt.setInt(2, userAddressNum);
		pstmt.setString(3, userAddress);
		pstmt.setString(4, userPhoneNum);
		pstmt.setString(5, userEmail);
		pstmt.setString(6,userID);


		
		return pstmt.executeUpdate();
		
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	return -1;  //데이터베이스 오류
}
	
	public int userAdd( String userName, int userBasicAddressNum, String userAddress, String userPhoneNum,
				String userIntroRoute, int userRoutine, int userTerm) {
		String SQL = "INSERT INTO doggerboxUser VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, null);
			pstmt.setString(3, userName);
			pstmt.setInt(4, userBasicAddressNum);
			pstmt.setString(5, userAddress);
			pstmt.setString(6, userPhoneNum);
			pstmt.setString(7, userIntroRoute);
			pstmt.setInt(8,userRoutine);
			pstmt.setInt(9,userTerm);
			pstmt.setString(10, null);
			pstmt.setString(11, null);
			pstmt.setString(12, null);
			pstmt.setString(13, null);
			pstmt.setString(14, null);
			pstmt.setInt(15, 1);

			
			return pstmt.executeUpdate();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;  //데이터베이스 오류
	}
	
	public DoggerboxUser getUser(int userPrimeNum) {
		String SQL = "SELECT * FROM doggerboxUser WHERE userPrimeNum = ? and where userAvailable =1 ";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  userPrimeNum);
			
			rs = pstmt.executeQuery();
				if(rs.next()) {
					DoggerboxUser user = new DoggerboxUser();
					user.setUserPrimeNum(rs.getInt(1));
					user.setUserID(rs.getString(2));
					user.setUserName(rs.getString(3));
					user.setUserAddressNum(rs.getInt(4));
					user.setUserAddress(rs.getString(5));
					user.setUserPhoneNum(rs.getString(6));
					user.setUserIntroRoute(rs.getString(7));
					user.setUserTerm(rs.getInt(8));
					user.setProfile_image(rs.getString(9));
					user.setThumbnail_image(rs.getString(10));
					user.setUserGender(rs.getString(11));
					user.setUserAge(rs.getString(12));
					user.setUserEmail(rs.getString(13));

						 
					return user;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return null; // 불러오기 실패
	}
	public ArrayList<DoggerboxUser> getList(){
		String SQL = "SELECT * FROM doggerboxUser  where userAvailable =1";
		
		ArrayList<DoggerboxUser> list = new ArrayList<DoggerboxUser>();
		
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				DoggerboxUser user = new DoggerboxUser();
				user.setUserPrimeNum(rs.getInt(1));
				user.setUserID(rs.getString(2));
				user.setUserName(rs.getString(3));
				user.setUserAddressNum(rs.getInt(4));
				user.setUserAddress(rs.getString(5));
				user.setUserPhoneNum(rs.getString(6));
				user.setUserIntroRoute(rs.getString(7));
				user.setUserTerm(rs.getInt(8));
				user.setProfile_image(rs.getString(9));
				user.setThumbnail_image(rs.getString(10));
				user.setUserGender(rs.getString(11));
				user.setUserAge(rs.getString(12));
				user.setUserEmail(rs.getString(13));
				list.add(user);
								 
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	
		return list; //데이터 반환
		
	}
	public ArrayList<DoggerboxUser> getUserList(String userName){
		String SQL = "SELECT * FROM doggerboxUser where userName = ? where userAvailable =1";
		
		ArrayList<DoggerboxUser> list = new ArrayList<DoggerboxUser>();
		

		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userName);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				DoggerboxUser user = new DoggerboxUser();
				user.setUserPrimeNum(rs.getInt(1));
				user.setUserID(rs.getString(2));
				user.setUserName(rs.getString(3));
				user.setUserAddressNum(rs.getInt(4));
				user.setUserAddress(rs.getString(5));
				user.setUserPhoneNum(rs.getString(6));
				user.setUserIntroRoute(rs.getString(7));
				user.setUserTerm(rs.getInt(8));
				user.setProfile_image(rs.getString(9));
				user.setThumbnail_image(rs.getString(10));
				user.setUserGender(rs.getString(11));
				user.setUserAge(rs.getString(12));
				user.setUserEmail(rs.getString(13));
				list.add(user);
								 
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	
		return list; //데이터 반환
		
	}
	
	public String getUserName(int userPrimeNum){
		String SQL = "SELECT userName FROM user WHERE userPrimeNum = ? ";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  userPrimeNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getString(1).replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;");
								 
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
	
	public int userUpdate( String userName, int userAddressNum, String userAddress, String userPhoneNum,
			String userIntroRoute, int userRoutine, int userTerm, int userPrimeNum) {
	String SQL = "update doggerboxUser set userName=?, userBasicAddressNum=?, userAddress=?, userPhoneNum=?, userIntroRoute=?,"
			+ "userRoutine=?, userTerm=? where userPrimeNum=?";
	try {
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, userName);
		pstmt.setInt(2, userAddressNum);
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
	return -1;  //데이터베이스 오류
}
	
	
	public int deleteUser(int userPrimeNum) {
		
		String SQL = "update doggerboxUser set userAvailable = 0 WHERE userPrimeNum = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, userPrimeNum);
		
			return pstmt.executeUpdate(); 
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류 
		
		
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
