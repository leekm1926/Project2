package model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MembershipWriteCtrl extends HttpServlet {

	/*
	 * 글스기 페이지로 진입했을때 요청을 처리한다 get방식이므로 doGet()에서 처리한다.
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		 * 글쓰기 페이지로 진입할때는 다른처리없이 포워드만 하면된다.
		 */
		req.getRequestDispatcher("/member/join02.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("submit");

		// request객체와 물리적경로를 매개변수로 upload()를 호출한다
		req.setCharacterEncoding("UTF-8");

		/*
		 * 파일업로드가 완료되면나머지 폼값을 받기위해 mr참조변수를 이용한다.
		 */
		String name = req.getParameter("name");
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		String tel = req.getParameter("tel1") + "-" + req.getParameter("tel2") + "-" + req.getParameter("tel3");

		String phone = req.getParameter("mobile1") + "-" + req.getParameter("mobile2") + "-"
				+ req.getParameter("mobile3");
		String email = req.getParameter("email_1") + "@" + req.getParameter("email_2");
		String email_check = req.getParameter("email_check") == null ? "F" : "T";
		String address = req.getParameter("zip2") + req.getParameter("addr1") + req.getParameter("addr2");

		// DTO 객체에 위의 폼값을 저장한다
		MembershipDTO dto = new MembershipDTO();
		dto.setName(name);
		dto.setId(id);
		dto.setPass(pass);
		dto.setTel(tel);
		dto.setPhone(phone);
		dto.setEmail(email);
		dto.setEmail_check(email_check);
		dto.setAddress(address); 

		// DAO객체생성및 연결 ..insert처리
		MembershipDAO dao = new MembershipDAO();
		dao.insert(dto);

		dao.close();

		req.getRequestDispatcher("../main/main.jsp").forward(req, resp);

	}

}
