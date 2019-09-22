
package bulletin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class BulletinDAO {

	private Connection conn=null;
	private ResultSet rs = null;

	String dbURL = "jdbc:mysql://localhost/doggerbox1?serverTimezone=UTC";	//서버 선언
	String dbID = "doggerbox1";
	String dbPassword = "a1870523!!";
	
	public BulletinDAO() {
		try {

			
			Class.forName("com.mysql.cj.jdbc.Driver");
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		PreparedStatement pstmt = null;
		try {
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);	//연결시켜서 conn에 저장

			 pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getString(1);
				
			}
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}finally {
	        if (rs != null) try { rs.close(); } catch(Exception ex) {}
	        if (pstmt != null) try { pstmt.close(); } catch(Exception ex) {}
	        if (conn != null) try { conn.close(); } catch(Exception ex) {}
	    }
		return ""; //데이터베이스 오류

	}
	
	public int getNext() {
		String SQL = "SELECT bulletinID FROM doggerboxBulletin ORDER BY bulletinID DESC";
		PreparedStatement pstmt = null;
		try {
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);	//연결시켜서 conn에 저장

			 pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1) + 1;
				 
			}
			return 1; // 첫번째 게시글인 경우
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}finally {
	        if (rs != null) try { rs.close(); } catch(Exception ex) {}
	        if (pstmt != null) try { pstmt.close(); } catch(Exception ex) {}
	        if (conn != null) try { conn.close(); } catch(Exception ex) {}
	    }
		return -1; //데이터베이스 오류

	}
	
	public int write(String bulletinTitle, String userID, String userName, String bulletinContent, int bulletinCategory,
	int bulletinNotice
 ) {
	String SQL = "INSERT INTO doggerboxBulletin VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
	PreparedStatement pstmt = null;
		try {
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);	//연결시켜서 conn에 저장

			 pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bulletinTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, userName);
			pstmt.setString(5, bulletinContent);
			pstmt.setInt(6, 1);
			pstmt.setInt(7, bulletinCategory);
			pstmt.setString(8, getDate());
			pstmt.setInt(9, bulletinNotice);
			pstmt.setInt(10, 0);
			pstmt.setInt(11, 0);
			pstmt.setInt(12, 0);


				
			return pstmt.executeUpdate(); 
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}finally {
	        if (rs != null) try { rs.close(); } catch(Exception ex) {}
	        if (pstmt != null) try { pstmt.close(); } catch(Exception ex) {}
	        if (conn != null) try { conn.close(); } catch(Exception ex) {}
	    }
		return -1; //데이터베이스 오류
	
	}
	
	// 게시판 글 목록 불러오기
	public ArrayList<Bulletin> getList(int bulletinCategory){
		String SQL = "SELECT * FROM doggerboxBulletin WHERE bulletinAvailable =1 and bulletinCategory = ? ORDER BY bulletinID";
		PreparedStatement pstmt = null;
		ArrayList<Bulletin> list = new ArrayList<Bulletin>();
		
		
		try {
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);	//연결시켜서 conn에 저장

			 pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bulletinCategory);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Bulletin bulletin = new Bulletin();
				bulletin.setBulletinID(rs.getInt(1));
				bulletin.setBulletinTitle(rs.getString(2));
				bulletin.setUserID(rs.getString(3));
				bulletin.setUserName(rs.getString(4));
				bulletin.setBulletinContent(rs.getString(5));
				bulletin.setBulletinAvailable(rs.getInt(6));
				bulletin.setBulletinCategory(rs.getInt(7));
				bulletin.setBulletinDate(rs.getString(8));
				bulletin.setBulletinNotice(rs.getInt(9));
				bulletin.setBulletinClickCount(rs.getInt(10));
				bulletin.setBulletinLikeCount(rs.getInt(11));
				bulletin.setBulletinReplyCount(rs.getInt(12));

				list.add(bulletin);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}finally {
	        if (rs != null) try { rs.close(); } catch(Exception ex) {}
	        if (pstmt != null) try { pstmt.close(); } catch(Exception ex) {}
	        if (conn != null) try { conn.close(); } catch(Exception ex) {}
	    }
		return list; //데이터 반환
	}
	public ArrayList<Bulletin> getListByUserID(String userID){
		String SQL = "SELECT * FROM doggerboxBulletin WHERE bulletinAvailable =1 and userID = ? ORDER BY bulletinID DESC";
		PreparedStatement pstmt = null;
		ArrayList<Bulletin> list = new ArrayList<Bulletin>();
		
		
		try {
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);	//연결시켜서 conn에 저장

			 pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Bulletin bulletin = new Bulletin();
				bulletin.setBulletinID(rs.getInt(1));
				bulletin.setBulletinTitle(rs.getString(2));
				bulletin.setUserID(rs.getString(3));
				bulletin.setUserName(rs.getString(4));
				bulletin.setBulletinContent(rs.getString(5));
				bulletin.setBulletinAvailable(rs.getInt(6));
				bulletin.setBulletinCategory(rs.getInt(7));
				bulletin.setBulletinDate(rs.getString(8));
				bulletin.setBulletinNotice(rs.getInt(9));
				bulletin.setBulletinClickCount(rs.getInt(10));
				bulletin.setBulletinLikeCount(rs.getInt(11));
				bulletin.setBulletinReplyCount(rs.getInt(12));

				list.add(bulletin);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}finally {
	        if (rs != null) try { rs.close(); } catch(Exception ex) {}
	        if (pstmt != null) try { pstmt.close(); } catch(Exception ex) {}
	        if (conn != null) try { conn.close(); } catch(Exception ex) {}
	    }
		return list; //데이터 반환
	}

/*	public boolean nextPage(int pageNumber, int bulletinAvailable) {
		String SQL = "SELECT * FROM dog WHERE bulletinID < ? AND bulletinAvailable =?";
		PreparedStatement pstmt = null;
		try {
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);	//연결시켜서 conn에 저장

			 pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  getNext() - (pageNumber -1) * 10);
			pstmt.setInt(2, bulletinAvailable);

			rs = pstmt.executeQuery();
		
			
				if(rs.next()) {
					
					return true;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}finally {
	        if (rs != null) try { rs.close(); } catch(Exception ex) {}
	        if (pstmt != null) try { pstmt.close(); } catch(Exception ex) {}
	        if (conn != null) try { conn.close(); } catch(Exception ex) {}
	    }
		return false; //데이터 반환
	}*/
	
	public Bulletin getBulletin(int bulletinID) {
		String SQL = "SELECT * FROM doggerboxBulletin WHERE bulletinID = ? ";
		PreparedStatement pstmt = null;
		try {
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);	//연결시켜서 conn에 저장

			 pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  bulletinID);
			rs = pstmt.executeQuery();
				if(rs.next()) {
					Bulletin bulletin = new Bulletin();
					bulletin.setBulletinID(rs.getInt(1));
					bulletin.setBulletinTitle(rs.getString(2));
					bulletin.setUserID(rs.getString(3));
					bulletin.setUserName(rs.getString(4));
					bulletin.setBulletinContent(rs.getString(5));
					bulletin.setBulletinAvailable(rs.getInt(6));
					bulletin.setBulletinCategory(rs.getInt(7));
					bulletin.setBulletinDate(rs.getString(8));
					bulletin.setBulletinNotice(rs.getInt(9));
					bulletin.setBulletinClickCount(rs.getInt(10));
					bulletin.setBulletinLikeCount(rs.getInt(11));
					bulletin.setBulletinReplyCount(rs.getInt(12));


					return bulletin;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}finally {
	        if (rs != null) try { rs.close(); } catch(Exception ex) {}
	        if (pstmt != null) try { pstmt.close(); } catch(Exception ex) {}
	        if (conn != null) try { conn.close(); } catch(Exception ex) {}
	    }
		return null; // 불러오기 실패
	}
		
	
	public int update(int bulletinID, String bulletinTitle, String bulletinContent) {
		String SQL =null;
		PreparedStatement pstmt = null;
			SQL = "UPDATE doggerboxBulletin SET bulletinTitle = ?, bulletinContent = ? WHERE bulletinID = ? ";


		try {
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);	//연결시켜서 conn에 저장

			 pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bulletinTitle);
			pstmt.setString(2, bulletinContent);
			
			pstmt.setInt(3, bulletinID);
			
			return pstmt.executeUpdate(); 
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}finally {
	        if (rs != null) try { rs.close(); } catch(Exception ex) {}
	        if (pstmt != null) try { pstmt.close(); } catch(Exception ex) {}
	        if (conn != null) try { conn.close(); } catch(Exception ex) {}
	    }
		return -1; //데이터베이스 오류
	}
	
	public int delete(int bulletinID) {
		PreparedStatement pstmt = null;
		String SQL = "UPDATE doggerboxBulletin SET bulletinAvailable = 0 WHERE bulletinID = ?";
		try {
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);	//연결시켜서 conn에 저장

			 pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bulletinID);
		
			return pstmt.executeUpdate(); 
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}finally {
	        if (rs != null) try { rs.close(); } catch(Exception ex) {}
	        if (pstmt != null) try { pstmt.close(); } catch(Exception ex) {}
	        if (conn != null) try { conn.close(); } catch(Exception ex) {}
	    }
		return -1; //데이터베이스 오류 
		
		
	}
	public int clickAdd(int bulletinID) {
		String SQL =null;
		PreparedStatement pstmt = null;
			SQL = "UPDATE doggerboxBulletin SET bulletinClickCount = bulletinClickCount+1  WHERE bulletinID = ? ";


		try {
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);	//연결시켜서 conn에 저장

			 pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bulletinID);
			
			return pstmt.executeUpdate(); 
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}finally {
	        if (rs != null) try { rs.close(); } catch(Exception ex) {}
	        if (pstmt != null) try { pstmt.close(); } catch(Exception ex) {}
	        if (conn != null) try { conn.close(); } catch(Exception ex) {}
	    }
		return -1; //데이터베이스 오류
	}
	
	public int getSumClickCount(int bulletinCategory) {
		String SQL = "SELECT sum(bulletinClickCount) FROM doggerboxBulletin where bulletinCategory=?";
		PreparedStatement pstmt = null;
		try {
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);	//연결시켜서 conn에 저장

			 pstmt = conn.prepareStatement(SQL);
			 pstmt.setInt(1, bulletinCategory);
	 
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1) + 1;
				 
			}
			return 1; // 첫번째 게시글인 경우
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}finally {
	        if (rs != null) try { rs.close(); } catch(Exception ex) {}
	        if (pstmt != null) try { pstmt.close(); } catch(Exception ex) {}
	        if (conn != null) try { conn.close(); } catch(Exception ex) {}
	    }
		return -1; //데이터베이스 오류

	}
	public int getBulletinCount(int bulletinCategory) {
		String SQL = "SELECT count(*) FROM doggerboxBulletin where bulletinCategory=?";
		PreparedStatement pstmt = null;
		try {
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);	//연결시켜서 conn에 저장

			 pstmt = conn.prepareStatement(SQL);
			 pstmt.setInt(1, bulletinCategory);
	 
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1) + 1;
				 
			}
			return 1; // 첫번째 게시글인 경우
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}finally {
	        if (rs != null) try { rs.close(); } catch(Exception ex) {}
	        if (pstmt != null) try { pstmt.close(); } catch(Exception ex) {}
	        if (conn != null) try { conn.close(); } catch(Exception ex) {}
	    }
		return -1; //데이터베이스 오류

	}
	
	public int getBulletinCountByUserID(String userID) {
		String SQL = "SELECT count(*) FROM doggerboxBulletin where userID=?";
		PreparedStatement pstmt = null;
		try {
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);	//연결시켜서 conn에 저장

			 pstmt = conn.prepareStatement(SQL);
			 pstmt.setString(1, userID);
	 
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1) + 1;
				 
			}
			return 1; // 첫번째 게시글인 경우
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}finally {
	        if (rs != null) try { rs.close(); } catch(Exception ex) {}
	        if (pstmt != null) try { pstmt.close(); } catch(Exception ex) {}
	        if (conn != null) try { conn.close(); } catch(Exception ex) {}
	    }
		return -1; //데이터베이스 오류

	}
}
