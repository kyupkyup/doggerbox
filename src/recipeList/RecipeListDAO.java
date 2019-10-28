package recipeList;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import order.Order;

public class RecipeListDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public RecipeListDAO() {
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
	public String getDate() {
		String SQL = "SELECT NOW()";
		PreparedStatement pstmt = null;
		try {
			 pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getString(1);
				
			}
			
			return null;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public int getNext() {
		String SQL = "SELECT recipePrimeNum FROM doggerboxrecipelist ORDER BY recipePrimeNum DESC";
		
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
	
	public int recipeListAdd(int puppyPrimeNum, String productName, int productPrimeNum) {
		String SQL = "INSERT INTO doggerboxrecipelist VALUES(?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setInt(2, puppyPrimeNum);
			pstmt.setString(3, productName);
			pstmt.setInt(4, 1);
			pstmt.setInt(5, productPrimeNum);
			pstmt.setString(6, getDate());


			return pstmt.executeUpdate();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;  //�����ͺ��̽� ����
	}
	
	public ArrayList<RecipeList> getList(int puppyPrimeNum){
		String SQL = "SELECT * FROM doggerboxrecipelist where puppyPrimeNum =? and recipeAvailable=1";
		
		ArrayList<RecipeList> list = new ArrayList<RecipeList>();
		
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  puppyPrimeNum);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				RecipeList recipeList = new RecipeList();

				recipeList.setRecipePrimeNum(rs.getInt(1));
				recipeList.setPuppyPrimeNum(rs.getInt(2));
				recipeList.setProductName(rs.getString(3));
				recipeList.setRecipeAvailable(rs.getInt(4));
				recipeList.setProductPrimeNum(rs.getInt(5));
				recipeList.setRecipeDate(rs.getString(6));

				list.add(recipeList);
								 
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	
		return list; //������ ��ȯ
		
	}	
	
	public ArrayList<RecipeList> getList(int puppyPrimeNum, int productNum){
		String SQL = "SELECT * FROM doggerboxrecipelist where puppyPrimeNum =? and productPrimeNum=?";
		
		ArrayList<RecipeList> list = new ArrayList<RecipeList>();
		
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  puppyPrimeNum);
			pstmt.setInt(2,  productNum);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				RecipeList recipeList = new RecipeList();

				recipeList.setRecipePrimeNum(rs.getInt(1));
				recipeList.setPuppyPrimeNum(rs.getInt(2));
				recipeList.setProductName(rs.getString(3));
				recipeList.setRecipeAvailable(rs.getInt(4));
				recipeList.setProductPrimeNum(rs.getInt(5));
				recipeList.setRecipeDate(rs.getString(6));

				list.add(recipeList);
								 
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	
		return list; //������ ��ȯ
		
	}	
	
	public ArrayList<RecipeList> getList(){
		String SQL = "SELECT * FROM doggerboxrecipelist where recipeAvailable=0";
		
		ArrayList<RecipeList> list = new ArrayList<RecipeList>();
		
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);


			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				RecipeList recipeList = new RecipeList();

				recipeList.setRecipePrimeNum(rs.getInt(1));
				recipeList.setPuppyPrimeNum(rs.getInt(2));
				recipeList.setProductName(rs.getString(3));
				recipeList.setRecipeAvailable(rs.getInt(4));
				recipeList.setProductPrimeNum(rs.getInt(5));
				recipeList.setRecipeDate(rs.getString(6));

				list.add(recipeList);
								 
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	
		return list; //������ ��ȯ
		
	}	
	public int getRecipePrimeNum(int productPrimeNum) {
		String SQL = "SELECT recipePrimeNum FROM doggerboxrecipelist WHERE productPrimeNum=? and recipeAvailable=0";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  productPrimeNum);

			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);

			}
		}

		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public String getProductName(int productPrimeNum) {
		String SQL = "SELECT productName FROM doggerboxrecipelist WHERE productPrimeNum=? AND recipeAvailable=0";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  productPrimeNum);

			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);

			}
		}

		catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int getMaxRecipePrimeNum() {
		String SQL = "SELECT recipePrimeNum FROM doggerboxrecipelist WHERE recipePrimeNum=(SELECT max(recipePrimeNum) FROM doggerboxrecipelist)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);

			}
			else return 0;
		}

		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int getRecipePrimeNum(int productPrimeNum, int puppyPrimeNum) {
		String SQL = "SELECT recipePrimeNum FROM doggerboxrecipelist WHERE productPrimeNum=? and recipeAvailable=1 and puppyPrimeNum=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  productPrimeNum);
			pstmt.setInt(2,  puppyPrimeNum);

			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);

			}
		}

		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int recipeDelete(int recipePrimeNum) {
		
		String SQL = "update doggerboxrecipelist set recipeAvailable = -1  WHERE recipePrimeNum = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, recipePrimeNum);

			return pstmt.executeUpdate(); 
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ���� 
		
		
	}
	
}
