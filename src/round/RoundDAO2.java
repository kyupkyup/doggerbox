package round;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import doggerboxuser.DoggerboxUser;

public class RoundDAO2 {
	DataSource dataSource;

	
	public RoundDAO2() {
		try {
			InitialContext initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/doggerbox1");
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
	public int roundAdd(String roundDeliveryDate, String roundTitle) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "INSERT INTO round VALUES(?,NULL,?)";
		try {
			conn =dataSource.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, roundDeliveryDate);
			pstmt.setString(2, roundTitle);

			
			return pstmt.executeUpdate();
			
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
		return -1;  //데이터베이스 오류
	}
	
	public Round getRound(int roundPrimeNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "SELECT * FROM round WHERE roundPrimeNum = ? ";
		
		try {
			conn =dataSource.getConnection();

			pstmt = conn.prepareStatement(SQL);
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
		return null; // 불러오기 실패
	}
	
	public ArrayList<Round> getList(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "SELECT * FROM round";
		
		ArrayList<Round> list = new ArrayList<Round>();
		
		try {
			conn =dataSource.getConnection();

			 pstmt = conn.prepareStatement(SQL);

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
		
	
		return list; //데이터 반환
		
	}
	public int roundUpdate( String roundTitle, String roundDeliveryDate, int roundPrimeNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	String SQL = "update round set roundTitle=?, roundDeliveryDate=? where roundPrimeNum=?";
	try {
		conn =dataSource.getConnection();
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1,roundTitle);
		pstmt.setString(2,roundDeliveryDate);
		pstmt.setInt(3,roundPrimeNum);


		
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
	public int deleteRound(int roundPrimeNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "delete from round WHERE roundPrimeNum = ?";
		try {
			conn =dataSource.getConnection();

			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, roundPrimeNum);
		
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
