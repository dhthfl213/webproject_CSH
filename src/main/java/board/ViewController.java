package board;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// 열람하기(어노테이션을 이용한 매핑)

public class ViewController extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /*
    * 서블릿의 수명주기 메서드중 요청을 받아 get/post방식을 판단하는 service() 메서드를 통해
    * 모든 방식의 요청을 처리할 수 있다.
    */
   @Override
   protected void service(HttpServletRequest req, HttpServletResponse resp)
         throws IOException, ServletException {
      // 게시물 불러오기
      BoardDAO dao = new BoardDAO();

      // 파라미터로 전달된 일련번호 받기
      String post_id = req.getParameter("post_id");

      // 조회수 1 증가
      dao.updateVisitCount(post_id);

      // 일련번호에 해당하는 게시물 인출
      BoardDTO dto = dao.selectView(post_id);
      dao.close();

      // 줄바꿈 처리: 웹브라우저에서 출력할때는 <br>태그로 변경해야 한다.
      dto.setContent(dto.getContent().replaceAll("\r\n", "<br/>"));

      // 첨부파일 확장자 추출 및 이미지 타입 확인
      String ext = null, fileName = dto.getSfile(), mimeType = null;
      if (fileName != null) {
         ext = fileName.substring(fileName.lastIndexOf(".") + 1);
      }

      String[] extArray1 = { "png", "jpg", "gif", "pcx", "bmp" };
      String[] extArray2 = { "mp3", "wav" };
      String[] extArray3 = { "mp4", "avi", "wmv" };

      // 파일 확장자에 따른 mimeType을 설정하는 로직
      if (fileName != null) {
         if (contains(ext, extArray1)) {
            mimeType = "image";
         } else if (contains(ext, extArray2)) {
            mimeType = "audio";
         } else if (contains(ext, extArray3)) {
            mimeType = "video";
         } else {
            mimeType = "unknown";
         }
      }

      // 게시물(dto) 저장 후 뷰로 포워드
      req.setAttribute("dto", dto);
      req.setAttribute("mimeType", mimeType);

      req.getRequestDispatcher("/Board/View.jsp").forward(req, resp);
   }

   // 배열에 확장자가 포함되어 있는지 체크하는 메서드
   private boolean contains(String ext, String[] extArray) {
      for (String e : extArray) {
         if (e.equalsIgnoreCase(ext)) {
            return true;
         }
      }
      return false;
   }
}