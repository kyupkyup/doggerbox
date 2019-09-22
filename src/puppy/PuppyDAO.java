package puppy;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import doggerboxuser.DoggerboxUser;

public class PuppyDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public PuppyDAO() {
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
		String SQL = "SELECT puppyPrimeNum FROM doggerboxPuppy ORDER BY puppyPrimeNum DESC";
		
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
	
	public int puppyAdd(int userID, String puppyName, String puppySpecies, int puppyAge, int puppyGender, int puppyNeutralization,
				int puppyWeight, int puppyActivity,  int recommendQuantity,String  puppyETC, String puppyRestrict) {
		String SQL = "INSERT INTO doggerboxPuppy VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, userID);
			pstmt.setInt(2, getNext());
			pstmt.setString(3, puppyName);
			pstmt.setString(4, puppySpecies);
			pstmt.setInt(5, puppyAge);
			pstmt.setInt(6, puppyGender);
			pstmt.setInt(7, puppyNeutralization);
			pstmt.setInt(8,puppyWeight);
			pstmt.setInt(9,puppyActivity);
			pstmt.setString(10,puppyETC);
			pstmt.setString(11,puppyRestrict);
			pstmt.setInt(12,recommendQuantity);
			pstmt.setInt(13,1);


			
			return pstmt.executeUpdate();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;  //데이터베이스 오류
	}
	
	public Puppy getPuppy(int puppyPrimeNum) {
		String SQL = "SELECT * FROM doggerboxPuppy WHERE puppyPrimeNum = ? and puppyAvailable =1 ";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  puppyPrimeNum);
			
			rs = pstmt.executeQuery();
				if(rs.next()) {
					Puppy puppy = new Puppy();
					puppy.setUserPrimeNum(rs.getInt(1));
					puppy.setPuppyPrimeNum(rs.getInt(2));
					puppy.setPuppyName(rs.getString(3));
					puppy.setPuppySpecies(rs.getString(4));
					puppy.setPuppyAge(rs.getInt(5));
					puppy.setPuppyGender(rs.getInt(6));
					puppy.setPuppyNeutralization(rs.getInt(7));
					puppy.setPuppyWeight(rs.getInt(8));
					puppy.setPuppyActivity(rs.getInt(9));
					puppy.setPuppyETC(rs.getString(10));
					puppy.setPuppyRestrict(rs.getString(11));
					puppy.setRecommendQuantity(rs.getInt(12));

					return puppy;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return null; // 불러오기 실패
	}
	
	public ArrayList<Puppy> getList(int userPrimeNum){
		String SQL = "SELECT * FROM doggerboxPuppy where userPrimeNum =? and puppyAvailable =1 ";
		
		ArrayList<Puppy> list = new ArrayList<Puppy>();
		
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  userPrimeNum);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Puppy puppy = new Puppy();
				puppy.setUserPrimeNum(rs.getInt(1));
				puppy.setPuppyPrimeNum(rs.getInt(2));
				puppy.setPuppyName(rs.getString(3));
				puppy.setPuppySpecies(rs.getString(4));
				puppy.setPuppyAge(rs.getInt(5));
				puppy.setPuppyGender(rs.getInt(6));
				puppy.setPuppyNeutralization(rs.getInt(7));
				puppy.setPuppyWeight(rs.getInt(8));
				puppy.setPuppyActivity(rs.getInt(9));
				puppy.setPuppyETC(rs.getString(10));
				puppy.setPuppyRestrict(rs.getString(11));
				puppy.setRecommendQuantity(rs.getInt(12));

				list.add(puppy);
								 
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	
		return list; //데이터 반환
		
	}
	public String getPuppyName(int puppyPrimeNum){
		String SQL = "SELECT puppyName FROM puppy WHERE puppyPrimeNum = ? ";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  puppyPrimeNum);
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
	
	public String getPuppyRestrict(int puppyPrimeNum){
		String SQL = "SELECT puppyRestrict FROM doggerboxPuppy WHERE puppyPrimeNum = ? and puppyAvailable =1 ";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  puppyPrimeNum);
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
	
	public String getRecommendQuantity(int puppyPrimeNum){
		String SQL = "SELECT recommendQuantity FROM doggerboxPuppy WHERE puppyPrimeNum = ? and puppyAvailable =1 ";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  puppyPrimeNum);
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
	
	public int puppyUpdate(String puppyName, String puppySpecies, int puppyAge, int puppyGender, int puppyNeutralization,
			int puppyWeight, int puppyActivity, String  puppyETC, String puppyRestrict, int recommendQuantity, int puppyPrimeNum) {
	String SQL = "update doggerboxPuppy set puppyName=?, puppySpecies=?, puppyAge=?, puppyGender=?, puppyNeutralization=?,"
			+ "puppyWeight=?, puppyActivity=?, puppyETC=? , puppyRestrict=?, recommendQuantity=?  where puppyPrimeNum=?";
	try {
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, puppyName);
		pstmt.setString(2, puppySpecies);
		pstmt.setInt(3, puppyAge);
		pstmt.setInt(4, puppyGender);
		pstmt.setInt(5, puppyNeutralization);
		pstmt.setInt(6,puppyWeight);
		pstmt.setInt(7,puppyActivity);
		pstmt.setString(8,puppyETC);
		pstmt.setString(9,puppyRestrict);
		pstmt.setInt(10,recommendQuantity);
		pstmt.setInt(11,puppyPrimeNum);

		return pstmt.executeUpdate();
		
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	return -1;  //데이터베이스 오류
}
	public int deletePuppy(int puppyPrimeNum) {
		
		String SQL = "update doggerboxPuppy set puppyAvailable = 0 WHERE puppyPrimeNum = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, puppyPrimeNum);
		
			return pstmt.executeUpdate(); 
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류 
		
		
	}
	
	public int getLastPuppyPrimeNum() {
		String SQL = "SELECT puppyPrimeNum FROM doggerboxPuppy ORDER BY puppyPrimeNum DESC where puppyPrimeNum = 1";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1);
				 
			}
			return 1; // 첫번째 게시글인 경우
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류

	}
}
