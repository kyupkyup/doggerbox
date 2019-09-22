package recipe;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import recipeList.RecipeList;

public class RecipeDAO2 {
	DataSource dataSource;
	
	public RecipeDAO2() {
		try {
			InitialContext initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/doggerbox1");
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public int recipeAdd( int ingredientPrimeNum, String rawIngredient, int recipePrimeNum, 
			int puppyPrimeNum
			) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
	String SQL = "INSERT INTO doggerboxrecipe VALUES(?,?,?,?,?,?)";
	try {
		conn =dataSource.getConnection();
		pstmt = conn.prepareStatement(SQL);
		pstmt.setInt(1,-1);
		pstmt.setInt(2,ingredientPrimeNum);
		pstmt.setString(3,rawIngredient);
		pstmt.setInt(4,recipePrimeNum);
		pstmt.setDouble(5,0.0);
		pstmt.setInt(6,puppyPrimeNum);

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
	
	public ArrayList<Recipe> getRecipe(int recipePrimeNum){
		 ArrayList<Recipe> recipeList = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			
		String SQL = "SELECT * FROM doggerboxrecipe WHERE recipePrimeNum = ?";
		try {
			conn =dataSource.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, recipePrimeNum);
			
			rs = pstmt.executeQuery();
			recipeList = new ArrayList<Recipe>();
			while(rs.next()) {
				Recipe recipe = new Recipe();
				recipe.setProductPrimeNum(rs.getInt("productPrimeNum"));
				recipe.setIngredientPrimeNum(rs.getInt("ingredientPrimeNum"));
				recipe.setRawIngredient(rs.getString("rawIngredient").replaceAll(" ","&nbsp;").replaceAll("\n","<br>;").replaceAll("<","&lt;").replaceAll(">","&gt;"));
				recipe.setRecipePrimeNum(rs.getInt("recipePrimeNum"));
				recipe.setMixRate(rs.getDouble("mixRate"));
				recipe.setPuppyPrimeNum(rs.getInt("puppyPrimeNum"));
				recipeList.add(recipe);
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
		return recipeList;
	}
	
	public int recipeUpdate(int[] ingredientPrimeNum, String[] rawIngredient,double[] mixRate, int recipePrimeNum
			) {
		System.out.println(mixRate.length+","+rawIngredient.length+","+ingredientPrimeNum.length);


		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int[] result = new int[ingredientPrimeNum.length];

	try {	
		conn =dataSource.getConnection();
	for(int i=0; i<rawIngredient.length; i++) {
		String SQL = "update doggerboxrecipe set mixRate=? where ingredientPrimeNum =? and recipePrimeNum=? ";
		

			pstmt = conn.prepareStatement(SQL);
			pstmt.setDouble(1,mixRate[i]);
			pstmt.setInt(2,ingredientPrimeNum[i]);
			pstmt.setInt(3,recipePrimeNum);
			result[i]=  pstmt.executeUpdate();

	}
	
	for(int i=0; i<result.length; i++) {
		if(result[i]==-1) {
			return -1;
		}
	}
	return 1;
	}
	catch(Exception e) {
		
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
}
