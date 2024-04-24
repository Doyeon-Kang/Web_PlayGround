package DAO;

import java.sql.*;
import java.util.ArrayList;

public class CafeDAO {
	private Connection conn; // Connection : 데이터베이스에 접근하게 해주는 하나의 객체 
	private PreparedStatement pstmt;
	private ResultSet rs; // ResultSet : 어떠한 정보를 담을 수 있는 객체 
	
	public CafeDAO() { // 생성자를 통해 UserDAO의 인스턴스가 생성되었을 때 자동으로 DB 커넥션이 이루어지도록함
		try {
			String dbURL = "jdbc:mysql://localhost/cafe"; // localhost:3306 : 우리 서버에 설치된 mysql을 의미, /BBS : mysql안의 BBS라는 데이터 베이스에 접속할 수 있도록 함.
			String dbID = "root"; // dbID = "root" : root 계정에 접근할 수 있도록 함
			String dbPassword = "1234"; // 패스워드나 ID를 다르게 입력하면 정상적으로 DB에 접속할 수 없음
			
			Class.forName("com.mysql.jdbc.Driver"); // Class.forName : mysql driver를 찾을 수 있도록 함 *Driver : mysql에 접속할 수 있도록 매개체 역할을 해주는 하나의 라이브러리 
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword); //conn : getConnection(db URL, dbID, dbPassword)를 이용하여 DB에 접속하고 접속이 완료가 되면 conn 객체안에 접속된 정보가 담긴다
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<user.Cafe> cafeInfo() {
		String SQL = "select cafe_name, cafe_desc, cafe_address, cafe_image_url from cafe;";
		ArrayList<user.Cafe> list = new ArrayList<user.Cafe>();
		int index;
		
		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				index = 1;
				String cafe_name = rs.getString(index++);
				String cafe_desc = rs.getString(index++);
				String cafe_address = rs.getString(index++);
				String cafe_image_url = rs.getString(index++);
				
				list.add(new user.Cafe(cafe_name, cafe_desc, cafe_address, cafe_image_url));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		return list;
	}
}
