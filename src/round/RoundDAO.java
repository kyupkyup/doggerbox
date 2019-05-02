package round;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import doggerboxuser.DoggerboxUser;

public class RoundDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public RoundDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost/luppyworld?serverTimezone=UTC";	//서버 선언
			String dbID = "luppyworld";
			String dbPassword = "a1870523!!";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);	//연결시켜서 conn에 저장
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	public int getNext() {
		String SQL = "SELECT roundPrimeNum FROM doggerboxRound ORDER BY roundPrimeNum DESC";
		
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
	
	public int roundAdd(String roundDeliveryDate, String roundTitle) {
		String SQL = "INSERT INTO doggerboxRound VALUES(?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, roundDeliveryDate);
			pstmt.setInt(2, getNext());
			pstmt.setString(3, roundTitle);

			
			return pstmt.executeUpdate();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;  //데이터베이스 오류
	}
	
	public Round getRound(int roundPrimeNum) {
		String SQL = "SELECT * FROM doggerboxRound WHERE roundPrimeNum = ? ";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  roundPrimeNum);
			
			rs = pstmt.executeQuery();
				if(rs.next()) {
					Round round = new Round();
					round.setRoundDeliveryDate(rs.getString(1));
					round.setRoundPrimeNum(rs.getInt(2));
					round.setRoundTitle(rs.getString(3));

						 
					return round;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return null; // 불러오기 실패
	}
	public ArrayList<Round> getList(){
		String SQL = "SELECT * FROM doggerboxRound";
		
		ArrayList<Round> list = new ArrayList<Round>();
		
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Round round = new Round();
				round.setRoundDeliveryDate(rs.getString(1));
				round.setRoundPrimeNum(rs.getInt(2));
				round.setRoundTitle(rs.getString(3));
				list.add(round);
								 
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	
		return list; //데이터 반환
		
	}
	
	public String getRoundTitle(int roundPrimeNum){
		String SQL = "SELECT roundTitle FROM doggerboxRound WHERE roundPrimeNum = ? ";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  roundPrimeNum);
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
	public String getRoundDeliveryDate(int roundPrimeNum){
		String SQL = "SELECT roundDeliveryDate FROM doggerboxRound WHERE roundPrimeNum = ? ";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  roundPrimeNum);
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
	
	public int roundUpdate(String roundDeliveryDate, String roundTitle, int roundPrimeNum) {
		String SQL = "update doggerboxRound set roundDeliveryDate =?, roundTitle=? where roundPrimeNum=?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, roundDeliveryDate);
			pstmt.setString(2, roundTitle);
			pstmt.setInt(3, roundPrimeNum);

			
			return pstmt.executeUpdate();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;  //데이터베이스 오류
	}
	
	public int deleteRound(int roundPrimeNum) {
		
		String SQL = "delete from doggerboxRound WHERE roundPrimeNum = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, roundPrimeNum);
		
			return pstmt.executeUpdate(); 
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류 
		
		
	}
}
