package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MembershipDAO {

	Connection con;
	PreparedStatement psmt;
	ResultSet rs;

	public MembershipDAO() {
		try {
			Context initCtx = new InitialContext();
			Context ctx = (Context) initCtx.lookup("java:comp/env");
			DataSource source = (DataSource) ctx.lookup("jdbc_mariadb");
			con = source.getConnection();
			System.out.println("DBCP연결성공");
		} catch (Exception e) {
			System.out.println("DBCP연결실패");
			e.printStackTrace();
		}
	}

	// 기본생성자를 통한 DB연결
//	public MembershipDAO() {
//		String driver = "org.mariadb.jdbc.Driver";
//		String url = "jdbc:mariadb://127.0.0.1:3306/suamil_db";
//		try {
//			Class.forName(driver);
//			String id = "suamil_user";
//			String pw = "1234";
//			con = DriverManager.getConnection(url, id, pw);
//			System.out.println("DB연결성공(디폴트생성자)");
//		} catch (Exception e) {
//			System.out.println("DB연결실패(디폴트생성자)");
//			e.printStackTrace();
//		}
//	}

	public String searchId(String name, String email) {

		String checkid = "";

		try {
			String sql = "SELECT id FROM membership where name=? and email=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, name);
			psmt.setString(2, email);

			rs = psmt.executeQuery();

			if (rs.next()) {
				checkid = rs.getString(1);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return checkid;
	}
	
	public String searchPw(String id, String name, String email) {

		String checkpw = "";

		try {
			String sql = "SELECT pass FROM membership where id=? and name=? and email=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, name);
			psmt.setString(3, email);

			rs = psmt.executeQuery();

			if (rs.next()) {
				checkpw = rs.getString(1);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return checkpw;
	}

	// JSP에서 컨텍스트 초기화 파라미터를 인자로 전달하여 DB연결
	public MembershipDAO(String driver, String url, String id, String pw) {
		try {
			Class.forName(driver);
			// DB에 연결된 정보를 멤버변수에 저장
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("DB연결성공(인자생성자)");
		} catch (Exception e) {
			System.out.println("DB연결실패(인자생성자)");
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		new MembershipDAO();
	}

	// 로그인방법3 : DTO객체 대신 Map컬렉션에 회원정보를 저장후 반환한다.
	public Map<String, String> getMembershipMap(String id, String pwd) {

		// 회원정보를 저장할 Map컬렉션 생성
		Map<String, String> maps = new HashMap<String, String>();

		String query = "SELECT id, pass, name FROM " + " membership WHERE id=? AND pass=?";
		System.out.println(id + "<>" + pwd);
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, pwd);
			rs = psmt.executeQuery();

			// 회원정보가 있다면 put()을 통해 정보를 저장한다.
			if (rs.next()) {
				maps.put("id", rs.getString("id"));
				maps.put("pass", rs.getString("pass"));
				maps.put("name", rs.getString("name"));
			} else {
				System.out.println("결과셋이 없습니다.");
			}
		} catch (Exception e) {
			System.out.println("membershipDTO오류");
			e.printStackTrace();
		}

		return maps;
	}

	public void close() {
		try {
			// 사용된 자원이 있다면 자원해제 해준다.
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (con != null)
				con.close();
		} catch (Exception e) {
			System.out.println("자원반납시 예외발생");
		}
	}

	public boolean idcheck(String id) {
		boolean affected = false;

		try {
			String sql = " SELECT * FROM membership WHERE id=? ";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if (rs.next()) {
				affected = true;
			}
		} catch (Exception e) {
			System.out.println("아이디중복처리이상문제");
			e.printStackTrace();
		}

		return affected;
	}

	public int insert(MembershipDTO dto) {
		int affected = 0;
		try {
			/*
			 * MariaDB에서는 Sequence 대신 auto_increment를 사용하므로 해당 쿼리는 삭제한다
			 */
			String sql = " INSERT INTO membership ( "
					+ " name, id ,pass, tel, phone, email, email_check, address, grade) " + " VALUES ( "
					+ " ?,?,?,?,?,?,?,?,'1') ";

			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getId());
			psmt.setString(3, dto.getPass());
			psmt.setString(4, dto.getTel());
			psmt.setString(5, dto.getPhone());
			psmt.setString(6, dto.getEmail());
			psmt.setString(7, dto.getEmail_check());
			psmt.setString(8, dto.getAddress());

			/*
			 * 쿼리문 실행시 사용하는 메소드 executeQuery(): select계열의 쿼리문을 실행할때 사용한다. 행에 영향을 주지않고 조회를 위해
			 * 사용된다. 반환타입은 ResultSet이다 executeUpdate(): insert, delete, update 쿼리문을 실행할때
			 * 사용한다 행에 영향을 주게되고 반환타입은 쿼리의 영향을 받은 행의 갯수가 반환되므로 int형이 된다.
			 */
			affected = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("insert중 예외발생");
			e.printStackTrace();
		}
		return affected;

	}
}
