package puppy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import order.Order;
import puppy.Puppy;

public class PuppyDAO2 {
	DataSource dataSource;
	
	public PuppyDAO2() {
		try {
			InitialContext initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/doggerbox1");
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public int puppyAdd(int userPrimeNum, String puppyName, String puppySpecies, int puppyAge, int puppyAgeMonth,
			int puppyGender,int puppyNeutralization, int puppyWeight,int recommendedQuantity, int puppyActivity, String puppyETC, String puppyRestrict
			, String paymentDate) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
	String SQL = "INSERT INTO puppy VALUES(?,NULL,?,?,?,?,?,?,?,?,?,?,?,?,3)";
	try {
		conn =dataSource.getConnection();
		pstmt = conn.prepareStatement(SQL);
		pstmt.setInt(1,userPrimeNum);
		pstmt.setString(2,puppyName);
		pstmt.setString(3,puppySpecies);
		pstmt.setInt(4,puppyAge);
		pstmt.setInt(5,puppyAgeMonth);
		pstmt.setInt(6,puppyGender);
		pstmt.setInt(7,puppyNeutralization);
		pstmt.setInt(8,puppyWeight);
		pstmt.setInt(9,puppyActivity);
		pstmt.setInt(10,recommendedQuantity);
		pstmt.setString(11,puppyETC);
		pstmt.setString(12,puppyRestrict);
		pstmt.setString(13,paymentDate);

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
	
	public ArrayList<Puppy> getPuppyListByUserPrimeNum(int userPrimeNum){
		 ArrayList<Puppy> puppyList = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			
		String SQL = "SELECT * FROM puppy WHERE userPrimeNum = ?";
		try {
			conn =dataSource.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, userPrimeNum);
			
			rs = pstmt.executeQuery();
			puppyList = new ArrayList<Puppy>();
			while(rs.next()) {
				Puppy puppy = new Puppy();
				puppy.setUserPrimeNum(rs.getInt("userPrimeNum"));
				puppy.setPuppyPrimeNum(rs.getInt("puppyPrimeNum"));
				puppy.setPuppyName(rs.getString("puppyName").replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				puppy.setPuppySpecies(rs.getString("puppySpecies").replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				puppy.setPuppyAge(rs.getInt("puppyAge"));
				puppy.setPuppyAgeMonth(rs.getInt("puppyAgeMonth"));
				puppy.setPuppyGender(rs.getInt("puppyGender"));
				puppy.setPuppyNeutralization(rs.getInt("puppyNeutralization"));
				puppy.setPuppyWeight(rs.getInt("puppyWeight"));
				puppy.setPuppyActivity(rs.getInt("puppyActivity"));
				puppy.setRecommendedQuantity(rs.getInt("recommendedQuantity"));
				puppy.setPuppyETC(rs.getString("puppyETC").replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				puppy.setPuppyRestrict(rs.getString("puppyRestrict").replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				puppy.setPaymentDate(rs.getString("paymentDate").replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				puppy.setPaymentAvailable(rs.getInt("paymentAvailable"));
				puppyList.add(puppy);
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
		return puppyList;
	}
	
	public Puppy getPuppyByPuppyPrimeNum(int puppyPrimeNum){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Puppy puppy = new Puppy();

		String SQL = "SELECT * FROM puppy WHERE puppyPrimeNum = ?";
		try {
			conn =dataSource.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, puppyPrimeNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				puppy.setUserPrimeNum(rs.getInt("userPrimeNum"));
				puppy.setPuppyPrimeNum(rs.getInt("puppyPrimeNum"));
				puppy.setPuppyName(rs.getString("puppyName").replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				puppy.setPuppySpecies(rs.getString("puppySpecies").replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				puppy.setPuppyAge(rs.getInt("puppyAge"));
				puppy.setPuppyAge(rs.getInt("puppyAgeMonth"));

				puppy.setPuppyGender(rs.getInt("puppyGender"));
				puppy.setPuppyNeutralization(rs.getInt("puppyNeutralization"));
				puppy.setPuppyWeight(rs.getInt("puppyWeight"));
				puppy.setPuppyActivity(rs.getInt("puppyActivity"));
				puppy.setPuppyActivity(rs.getInt("recommendedQuantity"));

				puppy.setPuppyETC(rs.getString("puppyETC").replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				puppy.setPuppyRestrict(rs.getString("puppyRestrict").replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				puppy.setPaymentDate(rs.getString("paymentDate").replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				puppy.setPaymentAvailable(rs.getInt("paymentAvailable"));
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
		return puppy;
	}
	public ArrayList<Puppy> getPaymentDate(String start, String end) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "SELECT * FROM puppy WHERE paymentDate >= ? and paymentDate <= ?";
		ArrayList<Puppy> puppyList = new ArrayList<Puppy>();
		
		
		try {
			conn =dataSource.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, start);
			pstmt.setString(2, end);
			
			rs = pstmt.executeQuery();
			puppyList = new ArrayList<Puppy>();
			while(rs.next()) {
				Puppy puppy = new Puppy();
				puppy.setUserPrimeNum(rs.getInt("userPrimeNum"));
				puppy.setPuppyPrimeNum(rs.getInt("puppyPrimeNum"));
				puppy.setPuppyName(rs.getString("puppyName").replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				puppy.setPuppySpecies(rs.getString("puppySpecies").replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				puppy.setPuppyAge(rs.getInt("puppyAge"));
				puppy.setPuppyAge(rs.getInt("puppyAgeMonth"));

				puppy.setPuppyGender(rs.getInt("puppyGender"));
				puppy.setPuppyNeutralization(rs.getInt("puppyNeutralization"));
				puppy.setPuppyWeight(rs.getInt("puppyWeight"));
				puppy.setPuppyActivity(rs.getInt("puppyActivity"));
				puppy.setPuppyActivity(rs.getInt("recommendedQuantity"));

				puppy.setPuppyETC(rs.getString("puppyETC").replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				puppy.setPuppyRestrict(rs.getString("puppyRestrict").replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				
				puppy.setPaymentDate(rs.getString("paymentDate").replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				puppy.setPaymentAvailable(rs.getInt("paymentAvailable"));

				puppyList.add(puppy);
		}
			
		}
		catch(Exception e){
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
		
		return puppyList;
		}
	
	public int setPaymentAvailable(int puppyPrimeNum , int paymentAvailable) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "UPDATE puppy SET paymentAvailable = ? WHERE puppyPrimeNum = ?";
		
		try {
			conn =dataSource.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, paymentAvailable);
			pstmt.setInt(2, puppyPrimeNum);
			
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
		return -1;
	}
	
	public int updatePaymentDate(int puppyPrimeNum , String paymentDate) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "UPDATE puppy SET paymentDate = ? WHERE puppyPrimeNum = ?";
		
		try {
			conn =dataSource.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, paymentDate);
			pstmt.setInt(2, puppyPrimeNum);
			
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
		return -1;
	}
	public int puppyUpdate( String puppyName, String puppySpecies, int puppyAge, int puppyAgeMonth,
			int puppyGender,int puppyNeutralization, int puppyWeight,int recommendQuantity, int puppyActivity, String puppyETC, String puppyRestrict
			, String paymentDate, int puppyPrimeNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	String SQL = "update puppy set puppyName=?, puppySpecies=?, puppyAge=?, puppyAgeMonth=?, puppyGender=?"
			+ "puppyNeutralization=?, puppyWeight=?  recommendedQuantity=?, puppyActivity=?, puppyETC=?, "
			+ "puppyRestrict=?, paymentDate=?, where puppyPrimeNum=?";
	try {
		conn =dataSource.getConnection();
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1,puppyName);
		pstmt.setString(2,puppySpecies);
		pstmt.setInt(3,puppyAge);
		pstmt.setInt(4,puppyAgeMonth);
		pstmt.setInt(5,puppyGender);
		pstmt.setInt(6,puppyNeutralization);
		pstmt.setInt(7,puppyWeight);
		pstmt.setInt(8,puppyActivity);
		pstmt.setInt(9,recommendQuantity);
		pstmt.setString(10,puppyETC);
		pstmt.setString(11,puppyRestrict);
		pstmt.setString(12,paymentDate);
		pstmt.setInt(13,puppyPrimeNum);

		
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
	public int deletePuppy(int puppyPrimeNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "delete puppy WHERE puppyPrimeNum = ?";
		try {
			conn =dataSource.getConnection();

			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, puppyPrimeNum);
		
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
