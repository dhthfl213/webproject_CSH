package board;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//서블릿 요청명 매핑 

public class WriteCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 쓰기페이지 진입
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.getRequestDispatcher("/Board/Write.jsp").forward(req, resp);
	}

	// 쓰기 처리
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 1.폼값받기
		String title = req.getParameter("title");

		// 2.DTO에 저장하기
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.getBoard_type();

		// 3.DAO로 전달하여 입력(insert)처리
		BoardDAO boardDAO = new BoardDAO();
		int result = boardDAO.insertWrite(boardDTO);
		if (result == 1) {
			System.out.println("입력성공");
			resp.sendRedirect("list.do");
		} else {
			System.out.println("입력실패");
			resp.sendRedirect("write.do");
		}
	}
}