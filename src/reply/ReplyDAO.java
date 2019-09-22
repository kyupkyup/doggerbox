
package reply;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class ReplyDAO {

	private Connection conn=null;
	private ResultSet rs = null;

	String dbURL = "jdbc:mysql://localhost/doggerbox1?serverTimezone=UTC";	//서버 선언
	String dbID = "doggerbox1";
	String dbPassword = "a1870523!!";
	
	public ReplyDAO() {
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
		String SQL = "SELECT doggerboxReply FROM doggerboxReply ORDER BY replyID DESC";
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
	
	public int reply(int bulletinID, String userID, String userName, String replyContent)
  {
	String SQL = "INSERT INTO doggerboxReply VALUES(?,?,?,?,?,?,?)";
	PreparedStatement pstmt = null;
		try {
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);	//연결시켜서 conn에 저장

			 pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setInt(2, bulletinID);
			pstmt.setString(3, userID);
			pstmt.setString(4, userName);
			pstmt.setString(5, replyContent);
			pstmt.setString(6, getDate());
			pstmt.setInt(7, 1);



				
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
	public ArrayList<Reply> getList(int bulletinID){
		String SQL = "SELECT * FROM doggerboxReply WHERE replyAvailable =1 and bulletinID=? ORDER BY replyID DESC";
		PreparedStatement pstmt = null;
		ArrayList<Reply> list = new ArrayList<Reply>();
		
		
		try {
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);	//연결시켜서 conn에 저장

			 pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bulletinID);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Reply reply = new Reply();
				reply.setReplyID(rs.getInt(1));
				reply.setBulletinID(rs.getInt(2));
				reply.setUserID(rs.getString(3));
				reply.setUserName(rs.getString(4));
				reply.setReplyContent(rs.getString(5));
				reply.setReplyDate(rs.getString(6));
				reply.setReplyAvailable(rs.getInt(7));


				list.add(reply);
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
	public ArrayList<Reply> getListByUserID(String userID){
		String SQL = "SELECT * FROM doggerboxReply WHERE replyAvailable =1 and userID=? ORDER BY replyID DESC";
		PreparedStatement pstmt = null;
		ArrayList<Reply> list = new ArrayList<Reply>();
		
		
		try {
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);	//연결시켜서 conn에 저장

			 pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Reply reply = new Reply();
				reply.setReplyID(rs.getInt(1));
				reply.setBulletinID(rs.getInt(2));
				reply.setUserID(rs.getString(3));
				reply.setUserName(rs.getString(4));
				reply.setReplyContent(rs.getString(5));
				reply.setReplyDate(rs.getString(6));
				reply.setReplyAvailable(rs.getInt(7));


				list.add(reply);
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
		String SQL = "SELECT * FROM doggerboxReply WHERE replyID < ? AND bulletinAvailable =?";
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
	
	public Reply getReply(int replyID) {
		String SQL = "SELECT * FROM doggerboxReply WHERE replyID = ? ";
		PreparedStatement pstmt = null;
		try {
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);	//연결시켜서 conn에 저장

			 pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  replyID);
			rs = pstmt.executeQuery();
				if(rs.next()) {
					Reply reply = new Reply();
					reply.setReplyID(rs.getInt(1));
					reply.setBulletinID(rs.getInt(2));
					reply.setUserID(rs.getString(3));
					reply.setUserName(rs.getString(4));
					reply.setReplyContent(rs.getString(5));
					reply.setReplyDate(rs.getString(6));
					reply.setReplyAvailable(rs.getInt(7));

					return reply;
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
		
	
	public int update(int replyID, String replyContent) {
		String SQL =null;
		PreparedStatement pstmt = null;
			SQL = "UPDATE reply SET replyContent=? WHERE replyID = ? ";


		try {
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);	//연결시켜서 conn에 저장

			 pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, replyContent);			
		
			pstmt.setInt(2, replyID);
			
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
	
	public int delete(int replyID) {
		PreparedStatement pstmt = null;
		String SQL = "UPDATE doggerboxReply SET replyAvailable = 0 WHERE replyID = ?";
		try {
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);	//연결시켜서 conn에 저장

			 pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, replyID);
		
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
	public int getReplyCountByUserID(String userID) {
		String SQL = "SELECT count(*) FROM doggerboxReply where userID=?";
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
