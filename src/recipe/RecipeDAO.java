package recipe;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import recipe.Recipe;

public class RecipeDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public RecipeDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost/doggerbox1?serverTimezone=UTC";	//���� ����
			String dbID = "doggerbox1";
			String dbPassword = "a1870523!!";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);	//������Ѽ� conn�� ����
			
		}
		    
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int getNext() {
		String SQL = "SELECT productPrimeNum FROM doggerboxrecipe ORDER BY productPrimeNum DESC";
		
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
	
	public int recipeAdd(int productPrimeNum, int ingredientPrimeNum, String rawIngredient ,int recipePrimeNum, double mixRate,  int puppyPrimeNum) {
		String SQL = "INSERT INTO doggerboxrecipe VALUES(?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, productPrimeNum);
			pstmt.setInt(2, ingredientPrimeNum);
			pstmt.setString(3, rawIngredient);
			pstmt.setInt(4, recipePrimeNum);
			pstmt.setDouble(5, mixRate);
			pstmt.setInt(6, puppyPrimeNum);

			
			return pstmt.executeUpdate();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;  //�����ͺ��̽� ����
	}
	
	public int customRecipeBaseAdd(int ingredientPrimeNum, String rawIngredient, int recipePrimeNum, double mixRate , int puppyPrimeNum ) {
		String SQL = "INSERT INTO doggerboxrecipe VALUES(?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, -1);
			pstmt.setInt(2, ingredientPrimeNum);
			pstmt.setString(3, rawIngredient);
			pstmt.setInt(4, recipePrimeNum);
			pstmt.setDouble(5, mixRate);
			pstmt.setInt(6, puppyPrimeNum);

			
			return pstmt.executeUpdate();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;  //�����ͺ��̽� ����
	}
	
	public Recipe getRecipe(int productPrimeNum) {
		String SQL = "SELECT * FROM doggerboxRecipe WHERE productPrimeNum = ? ";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  productPrimeNum);
			
			rs = pstmt.executeQuery();
				if(rs.next()) {
					Recipe recipe = new Recipe();
					recipe.setProductPrimeNum(rs.getInt(1));
					recipe.setIngredientPrimeNum(rs.getInt(2));
					recipe.setRecipePrimeNum(rs.getInt(3));
					recipe.setMixRate(rs.getDouble(4));
					recipe.setPuppyPrimeNum(rs.getInt(5));

					return recipe;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return null; // �ҷ����� ����
	}
	
	public ArrayList<Recipe> getList(int productPrimeNum){
		String SQL = "SELECT * FROM doggerboxrecipe where productPrimeNum =? ";
		
		ArrayList<Recipe> list = new ArrayList<Recipe>();
		
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  productPrimeNum);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Recipe recipe = new Recipe();
				recipe.setProductPrimeNum(rs.getInt(1));
				recipe.setIngredientPrimeNum(rs.getInt(2));
				recipe.setRawIngredient(rs.getString(3));

				recipe.setRecipePrimeNum(rs.getInt(4));
				recipe.setMixRate(rs.getDouble(5));
				recipe.setPuppyPrimeNum(rs.getInt(6));

				list.add(recipe);
								 
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return list; //������ ��ȯ
		
	}
	public ArrayList<Recipe> getListByRecipe(int recipePrimeNum){
		String SQL = "SELECT * FROM doggerboxrecipe where recipePrimeNum =? ";
		
		ArrayList<Recipe> list = new ArrayList<Recipe>();
		
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  recipePrimeNum);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Recipe recipe = new Recipe();
				recipe.setProductPrimeNum(rs.getInt(1));
				recipe.setIngredientPrimeNum(rs.getInt(2));
				recipe.setRawIngredient(rs.getString(3));

				recipe.setRecipePrimeNum(rs.getInt(4));
				recipe.setMixRate(rs.getDouble(5));
				recipe.setPuppyPrimeNum(rs.getInt(6));
				list.add(recipe);
								 
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return list; //������ ��ȯ
		
	}
	public ArrayList<Recipe> getListByPuppy(int puppyPrimeNum){
		String SQL = "SELECT * FROM doggerboxrecipe where puppyPrimeNum =? ";
		
		ArrayList<Recipe> list = new ArrayList<Recipe>();
		
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  puppyPrimeNum);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Recipe recipe = new Recipe();
				recipe.setProductPrimeNum(rs.getInt(1));
				recipe.setIngredientPrimeNum(rs.getInt(2));
				recipe.setRecipePrimeNum(rs.getInt(3));
				recipe.setMixRate(rs.getDouble(4));
				recipe.setPuppyPrimeNum(rs.getInt(5));
				list.add(recipe);
								 
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return list; //������ ��ȯ
		
	}
	
	public ArrayList<Recipe> getListByProductNum(int productPrimeNum){
		String SQL = "SELECT * FROM doggerboxrecipe where productPrimeNum =? ";
		
		ArrayList<Recipe> list = new ArrayList<Recipe>();
		
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  productPrimeNum);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Recipe recipe = new Recipe();
				recipe.setProductPrimeNum(rs.getInt(1));
				recipe.setIngredientPrimeNum(rs.getInt(2));
				recipe.setRawIngredient(rs.getString(3));
				recipe.setRecipePrimeNum(rs.getInt(4));
				recipe.setMixRate(rs.getDouble(5));
				recipe.setPuppyPrimeNum(rs.getInt(6));
				list.add(recipe);
								 
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return list; //������ ��ȯ
		
	}
	
	public int mixRateUpdate(int productPrimeNum, int ingredientPrimeNum, double mixRate) {
	String SQL = "update doggerboxrecipe set mixRate=? where productPrimeNum=? and ingredientPrimeNum=?";
	try {
		pstmt = conn.prepareStatement(SQL);
		pstmt.setDouble(1, mixRate);
		pstmt.setInt(2, productPrimeNum);
		pstmt.setInt(3, ingredientPrimeNum);

		return pstmt.executeUpdate();
		
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	return -1;  //�����ͺ��̽� ����
}
	public int mixRateUpdateByPuppy(int puppyPrimeNum, int ingredientPrimeNum, double mixRate) {
	String SQL = "update doggerboxrecipe set mixRate=? where puppyPrimeNum=? and ingredientPrimeNum=?";
	try {
		pstmt = conn.prepareStatement(SQL);
		pstmt.setDouble(1, mixRate);
		pstmt.setInt(2, puppyPrimeNum);
		pstmt.setInt(3, ingredientPrimeNum);

		return pstmt.executeUpdate();
		
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	return -1;  //�����ͺ��̽� ����
}
	
	public int mixRateUpdateByRecipe(int recipePrimeNum, int ingredientPrimeNum, double mixRate) {
	String SQL = "update doggerboxrecipe set mixRate=? where recipePrimeNum=? and ingredientPrimeNum=?";
	try {
		pstmt = conn.prepareStatement(SQL);
		pstmt.setDouble(1, mixRate);
		pstmt.setInt(2, recipePrimeNum);
		pstmt.setInt(3, ingredientPrimeNum);

		return pstmt.executeUpdate();
		
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	return -1;  //�����ͺ��̽� ����
}
	public int recipeDelete(int ingredientPrimeNum, int productPrimeNum) {
		
		String SQL = "delete from doggerboxrecipe WHERE ingredientPrimeNum = ? and productPrimeNum=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, ingredientPrimeNum);
			pstmt.setInt(2, productPrimeNum);

			return pstmt.executeUpdate(); 
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ���� 
		
		
	}
	public int recipeDeleteByPuppy(int ingredientPrimeNum, int puppyPrimeNum) {
		
		String SQL = "delete from doggerboxrecipe WHERE ingredientPrimeNum = ? and puppyPrimeNum =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, ingredientPrimeNum);
			pstmt.setInt(2, puppyPrimeNum);

			return pstmt.executeUpdate(); 
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ���� 
		
		
	}
	public int recipeDeleteByRecipe(int ingredientPrimeNum, int recipePrimeNum) {
		
		String SQL = "delete from doggerboxrecipe WHERE ingredientPrimeNum = ? and recipePrimeNum =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, ingredientPrimeNum);
			pstmt.setInt(2, recipePrimeNum);

			return pstmt.executeUpdate(); 
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ���� 
		
		
	}
	
	public int getProductPrimeNum(int puppyPrimeNum){
		String SQL = "SELECT productPrimeNum FROM doggerboxrecipe WHERE puppyPrimeNum = ? ";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  puppyPrimeNum);
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
