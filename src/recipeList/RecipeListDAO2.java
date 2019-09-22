package recipeList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import recipeList.RecipeList;

public class RecipeListDAO2 {
	DataSource dataSource;
	
	public RecipeListDAO2() {
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
			) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
	String SQL = "INSERT INTO puppy VALUES(?,NULL,?,?,?,?,?,?,?,?,?,?,?)";
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
	
	public ArrayList<RecipeList> getRecipeList(int puppyPrimeNum){
		 ArrayList<RecipeList> recipeListList = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			
		String SQL = "SELECT * FROM doggerboxrecipelist WHERE puppyPrimeNum = ?";
		try {
			conn =dataSource.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, puppyPrimeNum);
			
			rs = pstmt.executeQuery();
			recipeListList = new ArrayList<RecipeList>();
			while(rs.next()) {
				RecipeList recipeList = new RecipeList();
				recipeList.setRecipePrimeNum(rs.getInt("recipePrimeNum"));
				recipeList.setPuppyPrimeNum(rs.getInt("puppyPrimeNum"));
				recipeList.setProductName(rs.getString("productName").replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				recipeList.setRecipeAvailable(rs.getInt("recipeAvailable"));
				recipeList.setProductPrimeNum(rs.getInt("productPrimeNum"));
				recipeList.setRecipeDate(rs.getString("recipeDate").replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				recipeListList.add(recipeList);
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
		return recipeListList;
	}
}
