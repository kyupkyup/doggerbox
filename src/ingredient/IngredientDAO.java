package ingredient;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import doggerboxuser.DoggerboxUser;

public class IngredientDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public IngredientDAO() {
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
		String SQL = "SELECT ingredientPrimeNum FROM doggerboxingredient ORDER BY ingredientPrimeNum DESC";
		
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
	
	public ArrayList<Ingredient> getList(){
		String SQL = "SELECT * FROM doggerboxingredient";
		
		ArrayList<Ingredient> list = new ArrayList<Ingredient>();
		
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Ingredient ingredient = new Ingredient();
				ingredient.setIngredientPrimeNum(rs.getInt(1));
				ingredient.setRawIngredient(rs.getString(2));
				ingredient.setLossRate(rs.getDouble(3));
				ingredient.setIngredientPrice(rs.getDouble(4));
				ingredient.setSum(0);
				list.add(ingredient);
								 
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	
		return list; //데이터 반환
		
	}
	public Ingredient getIngredient(int ingredientPrimeNum){
		String SQL = "SELECT * FROM doggerboxingredient where ingredientPrimeNum=?";
		
		
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  ingredientPrimeNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
			
				Ingredient ingredient = new Ingredient();
				ingredient.setIngredientPrimeNum(rs.getInt(1));
				ingredient.setRawIngredient(rs.getString(2));
				ingredient.setLossRate(rs.getDouble(3));
				ingredient.setIngredientPrice(rs.getDouble(4));
				ingredient.setSum(0);
								 
			return ingredient;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	
		return null; //데이터 반환
		
	}
	
	public int ingredientAdd(String rawIngredient, double lossRate, double ingredientPrice) {
	String SQL = "INSERT INTO doggerboxingredient VALUES(?,?,?,?,?)";
	try {
		pstmt = conn.prepareStatement(SQL);
		pstmt.setInt(1, getNext());
		pstmt.setString(2, rawIngredient);
		pstmt.setDouble(3, lossRate);
		pstmt.setDouble(4, ingredientPrice);
		pstmt.setDouble(5, 0);



		return pstmt.executeUpdate();
		
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	return -1;  //데이터베이스 오류
}
	
	public String getRawIngredient(int ingredientPrimeNum){
		String SQL = "SELECT rawIngredient FROM doggerboxingredient WHERE ingredientPrimeNum = ? ";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  ingredientPrimeNum);
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
	
	public double getIngredientLossRate(int ingredientPrimeNum){
		String SQL = "SELECT lossRate FROM doggerboxingredient WHERE ingredientPrimeNum = ? ";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  ingredientPrimeNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getDouble(1);
								 
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
	public double getIngredientPrice(int ingredientPrimeNum){
		String SQL = "SELECT ingredientPrice FROM doggerboxingredient WHERE ingredientPrimeNum = ? ";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  ingredientPrimeNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getDouble(1);
								 
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
	
	public int ingredientUpdate( String rawIngredient, double lossRate, double ingredientPrice, int ingredientPrimeNum) {
	String SQL = "update doggerboxingredient set rawIngredient=?, lossRate=?, ingredientPrice=? where ingredientPrimeNum=?";
	try {
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, rawIngredient);
		pstmt.setDouble(2, lossRate);
		pstmt.setDouble(3, ingredientPrice);
		pstmt.setInt(4, ingredientPrimeNum);



		
		return pstmt.executeUpdate();
		
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	return -1;  //데이터베이스 오류
}
	
	
	public int ingredientDelete(int ingredientPrimeNum) {
		
		String SQL = "delete from doggerboxingredient WHERE ingredientPrimeNum = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, ingredientPrimeNum);
		
			return pstmt.executeUpdate(); 
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류 
		
		
	}
}
