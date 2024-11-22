package board;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// DAO 생성
		BoardDAO dao = new BoardDAO();

		// 검색 조건 처리
		Map<String, Object> map = new HashMap<String, Object>();

		// 검색을 위해 검색어를 입력했다면 파라미터로 전달된 값을 Map에 저장.
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		if (searchWord != null) {
			// 검색어가 있는 경우 map에 파라미터를 저장한다.
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}

		// 게시물의 개수 카운트를 위한 메서드 호출
		int totalCount = dao.selectCount(map);
		// 결과를 Map에 저장
		map.put("totalCount", totalCount);

		// 목록에 출력할 레코드를 인출하기 위한 메서드 호출
		List<BoardDTO> boardLists = dao.selectList(map);

		// DB 연결 해제
		dao.close();

		// View로 전달할 데이터는 request 영역에 저장 후
		req.setAttribute("boardLists", boardLists);
		req.setAttribute("map", map);

		// View로 포워드 한다.
		req.getRequestDispatcher("/Board/list.jsp").forward(req, resp);

		/*
		 * request 영역은 포워드된 페이지까지 데이터를 공유할 수 있으므로
		 * 서블릿에서 처리한 내용은 request 영역을 통해 JSP쪽으로 공유된다.
		 */
	}

}
