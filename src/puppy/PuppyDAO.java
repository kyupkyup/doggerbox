package puppy;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import doggerboxuser.DoggerboxUser;

public class PuppyDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public PuppyDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost/luppyworld?serverTimezone=UTC";	//���� ����
			String dbID = "luppyworld";
			String dbPassword = "a1870523!!";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);	//������Ѽ� conn�� ����
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	public int getNext() {
		String SQL = "SELECT puppyPrimeNum FROM doggerboxPuppy ORDER BY puppyPrimeNum DESC";
		
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
	
	public int puppyAdd(int userPrimeNum, String puppyName, String puppySpecies, int puppyAge, int puppyGender, int puppyNeutralization,
				int puppyWeight, int puppyActivity,  int recommendQuantity,String  puppyETC, String puppyRestrict) {
		String SQL = "INSERT INTO doggerboxPuppy VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, userPrimeNum);
			pstmt.setInt(2, getNext());
			pstmt.setString(3, puppyName);
			pstmt.setString(4, puppySpecies);
			pstmt.setInt(5, puppyAge);
			pstmt.setInt(6, puppyGender);
			pstmt.setInt(7, puppyNeutralization);
			pstmt.setInt(8,puppyWeight);
			pstmt.setInt(9,puppyActivity);
			pstmt.setString(10,puppyETC);
			pstmt.setString(11,puppyRestrict);
			pstmt.setInt(12,recommendQuantity);


			
			return pstmt.executeUpdate();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;  //�����ͺ��̽� ����
	}
	
	public Puppy getPuppy(int puppyPrimeNum) {
		String SQL = "SELECT * FROM doggerboxPuppy WHERE puppyPrimeNum = ? ";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  puppyPrimeNum);
			
			rs = pstmt.executeQuery();
				if(rs.next()) {
					Puppy puppy = new Puppy();
					puppy.setUserPrimeNum(rs.getInt(1));
					puppy.setPuppyPrimeNum(rs.getInt(2));
					puppy.setPuppyName(rs.getString(3));
					puppy.setPuppySpecies(rs.getString(4));
					puppy.setPuppyAge(rs.getInt(5));
					puppy.setPuppyGender(rs.getInt(6));
					puppy.setPuppyNeutralization(rs.getInt(7));
					puppy.setPuppyWeight(rs.getInt(8));
					puppy.setPuppyActivity(rs.getInt(9));
					puppy.setPuppyETC(rs.getString(10));
					puppy.setPuppyRestrict(rs.getString(11));
					puppy.setRecommendQuantity(rs.getInt(12));

					return puppy;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return null; // �ҷ����� ����
	}
	
	public ArrayList<Puppy> getList(int userPrimeNum){
		String SQL = "SELECT * FROM doggerboxPuppy where userPrimeNum =? ";
		
		ArrayList<Puppy> list = new ArrayList<Puppy>();
		
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  userPrimeNum);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Puppy puppy = new Puppy();
				puppy.setUserPrimeNum(rs.getInt(1));
				puppy.setPuppyPrimeNum(rs.getInt(2));
				puppy.setPuppyName(rs.getString(3));
				puppy.setPuppySpecies(rs.getString(4));
				puppy.setPuppyAge(rs.getInt(5));
				puppy.setPuppyGender(rs.getInt(6));
				puppy.setPuppyNeutralization(rs.getInt(7));
				puppy.setPuppyWeight(rs.getInt(8));
				puppy.setPuppyActivity(rs.getInt(9));
				puppy.setPuppyETC(rs.getString(10));
				puppy.setPuppyRestrict(rs.getString(11));
				puppy.setRecommendQuantity(rs.getInt(12));

				list.add(puppy);
								 
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	
		return list; //������ ��ȯ
		
	}
	public String getPuppyName(int puppyPrimeNum){
		String SQL = "SELECT puppyName FROM doggerboxPuppy WHERE puppyPrimeNum = ? ";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  puppyPrimeNum);
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
	
	public String getPuppyRestrict(int puppyPrimeNum){
		String SQL = "SELECT puppyRestrict FROM doggerboxPuppy WHERE puppyPrimeNum = ? ";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  puppyPrimeNum);
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
	
	public String getRecommendQuantity(int puppyPrimeNum){
		String SQL = "SELECT recommendQuantity FROM doggerboxPuppy WHERE puppyPrimeNum = ? ";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  puppyPrimeNum);
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
	
	public int puppyUpdate(String puppyName, String puppySpecies, int puppyAge, int puppyGender, int puppyNeutralization,
			int puppyWeight, int puppyActivity, String  puppyETC, String puppyRestrict, int recommendQuantity, int puppyPrimeNum) {
	String SQL = "update doggerboxPuppy set puppyName=?, puppySpecies=?, puppyAge=?, puppyGender=?, puppyNeutralization=?,"
			+ "puppyWeight=?, puppyActivity=?, puppyETC=? , puppyRestrict=?, recommendQuantity=?  where puppyPrimeNum=?";
	try {
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, puppyName);
		pstmt.setString(2, puppySpecies);
		pstmt.setInt(3, puppyAge);
		pstmt.setInt(4, puppyGender);
		pstmt.setInt(5, puppyNeutralization);
		pstmt.setInt(6,puppyWeight);
		pstmt.setInt(7,puppyActivity);
		pstmt.setString(8,puppyETC);
		pstmt.setString(9,puppyRestrict);
		pstmt.setInt(10,recommendQuantity);
		pstmt.setInt(11,puppyPrimeNum);

		return pstmt.executeUpdate();
		
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	return -1;  //�����ͺ��̽� ����
}
	public int deletePuppy(int puppyPrimeNum) {
		
		String SQL = "delete from doggerboxPuppy WHERE puppyPrimeNum = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, puppyPrimeNum);
		
			return pstmt.executeUpdate(); 
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ���� 
		
		
	}
}
