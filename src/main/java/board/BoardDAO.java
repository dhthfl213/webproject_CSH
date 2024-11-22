package board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import db.JDBConnect;

//DBCP(커넥트풀)을 통해 Oracle에 연결하기 위해 상속을 받아 정의
public class BoardDAO extends JDBConnect {

   // 게시물의 갯수를 카운트
   public int selectCount(Map<String, Object> map) {

      int totalCount = 0;
      // 오라클의 그룹함수는 count()를 사용해서 쿼리문 작성
      String query = "SELECT COUNT(*) FROM board";
      // 매개변수로 전달된 검색어가 있는 경우에만 where절을 동적으로 추가
      if (map.get("searchWord") != null) {
         query += " WHERE " + map.get("serachField") + " " + " LIKE '%" + map.get("searchWord") + "%'";
      }

      try {
         // Statement 인스턴스 생성(정적쿼리문 실행)
         stmt = con.createStatement();
         // 쿼리문을 실행한 후 결과를 ResultSet으로 반환받는다.
         rs = stmt.executeQuery(query);
         // count()함수는 조건에 상관없이 항상 결과가 인출되므로
         // if문과 같은 조건절없이 바로 next()함수를 실행할 수 있다.
         rs.next();
         // 반환된 결과를 저장한다.
         totalCount = rs.getInt(1);
      } catch (Exception e) {
         System.out.println("게시물 카운트 중 예외 발생");
         e.printStackTrace();
      }

      return totalCount;

   }

   // 게시판 목록에 출력할 레코드를 인출하기 위해 메서드 정의
   public List<BoardDTO> selectList(Map<String, Object> map) {
      // 오라클에서 인출한 레코드를 저장하기 위한 List 생성
      List<BoardDTO> board = new Vector<BoardDTO>();

      // 레코드 인출을 위한 쿼리문 작성
      String query = "SELECT * FROM board";
      // 검색어 입력 여부에 따라서 where절은 조건부로 추가됨
      if (map.get("searchWord") != null) {
         query += " WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%' ";
      }
      // 일련번호의 내림차순으로 정렬한 후 인출한다.
      query += " ORDER BY post_id DESC ";

      try {
         // prepareStatement 인스턴스생성
         psmt = con.prepareStatement(query);
         // 쿼리문 실행 및 결과반환(ResultSet)
         rs = psmt.executeQuery();

         // ResultSet의 크기만큼 즉, 인출된 레코드의 갯수만큼 반복
         while (rs.next()) {
            // 하나의 레코드를 저장하기 위해 DTO인스턴스 생성
            BoardDTO dto = new BoardDTO();
            // resultSet 인스턴스에서 데이터를 추출할때 멤버변수 타입에 따라
            // getString(), getDate(), getInt()로 구분하여 호출한다.
            // 이 데이터를 DTO의 setter를 이용해서 저장한다.
            dto.setPost_id(rs.getString("post_id")); // post_id로 변경
            dto.setUser_id(rs.getString("user_id")); // id를 user_id로 변경
            dto.setTitle(rs.getString("title"));
            dto.setContent(rs.getString("content"));
            dto.setReg_date(rs.getDate("reg_date")); // postdate를 reg_date로 변경
            dto.setView_count(rs.getInt("view_count")); // visitcount를 view_count로 변경
            dto.setBoard_type(rs.getString("board_type")); // board_type은 그대로
            dto.setOfile(rs.getString("ofile"));
            dto.setSfile(rs.getString("sfile"));
            dto.setUpdated_at(rs.getDate("updated_at")); // updatedate를 updated_at으로 변경
            dto.setName(rs.getString("name"));
            // 레코드가 저장된 DTO를 List에 갯수만큼 추가한다.
            board.add(dto);
         }

      } catch (Exception e) {
         System.out.println("게시물 조회 중 예외 발생");
         e.printStackTrace();
      }
      // 마지막으로 인출한 레코드를 저장한 List를 반환한다
      return board;

   }

   // 글쓰기 처리를 위한 쿼리문 실행
   public int insertWrite(BoardDTO dto) {
      int result = 0;
      try {
         /*
          * default값이 있는 3개의 컬럼을 제외한 나머지 컬럼에 대해서만 insert 쿼리문을 작성. 일련번호 idx의 경우에는 시퀀스 사용
          */
         String query = "INSERT INTO board"
               + " (id, title, content, board_type, ofile, sfile)"
               + " VALUES (?, ?, ?, ?, ?, ?)";
         // 쿼리문을 인수로 preparedStatement 인스턴스 생성
         psmt = con.prepareStatement(query);
         // 인스턴스를 통해 인파라미터 설정
         psmt.setString(1, dto.getUser_id()); // 작성자 아이디
         psmt.setString(2, dto.getTitle()); // 제목
         psmt.setString(3, dto.getContent()); // 내용
         psmt.setString(4, dto.getBoard_type()); // 게시판 유형
         psmt.setString(5, dto.getOfile()); // 원본 파일명
         psmt.setString(6, dto.getSfile()); // 저장된 파일명
         // 쿼리문 실행. insert쿼리의 경우 입력된 행의 갯수가 반환됨.
         result = psmt.executeUpdate();

      } catch (Exception e) {
         System.out.println("게시물 입력 중 예외 발생");
         e.printStackTrace();
      }
      return result;
   }

   public BoardDTO selectView(String postId) {
      // 인출한 레코드를 저장하기 위해 DTO 생성
      BoardDTO dto = new BoardDTO(); // DTO 객체 생성
      // 내부조인(Inner join)을 이용해서 쿼리문 작성. member테이블의 name컬럼까지 포함
      String query = "SELECT p.*, u.name "
            + "FROM posts p "
            + "INNER JOIN users u ON p.user_id = u.user_id " // user_id로 조인
            + "WHERE p.post_id = ?";
      // 템플릿
      // 준비
      try {
         psmt = con.prepareStatement(query);// 쿼리문 준비
         psmt.setString(1, postId);// 인파라미터 설정
         rs = psmt.executeQuery();// 쿼리문 실행
         // 하나의 게시물을 인출하므로 if문으로 조건에 맞는 게시물이 있는지 확인
         if (rs.next()) { // 결과를 DTO 객체에 저장
            dto.setPost_id(rs.getString("post_id")); // 번호를 postId로 변경
            dto.setUser_id(rs.getString("user_id")); // 작성자 아이디
            dto.setTitle(rs.getString("title")); // 제목
            dto.setContent(rs.getString("content")); // 내용
            dto.setReg_date(rs.getDate("reg_date")); // 작성일
            dto.setView_count(rs.getInt("view_count")); // 조회수
            dto.setName(rs.getString("name")); // 작성자 이름

         }
      } catch (Exception e) {
         System.out.println("게시물 상세보기 중 예외 발생");
         e.printStackTrace();
      }
      return dto;
   }

   // 주어진 일련번호에 해당하는 게시물의 조회수를 1 증가시킵니다.
   public void updateVisitCount(String postId) {
      // visitcount 컬럼은 number ㅏ입이므로 산술연산이 가능함
      // 1을 더한 결과를 컬럼에 재반영하는 형식으로 update 쿼리문 작성
      String query = "UPDATE posts SET "
            + " view_count = view_count + 1 "
            + " WHERE post_id = ?";

      try {
         psmt = con.prepareStatement(query);
         psmt.setString(1, postId);
         /*
          * 쿼리실행시 주로 아래의 두가지 메서드를 사용한다. executeQuery(): select계열의 쿼리문을 실행한다. 반환타입은
          * resultSet. executeUpdate() : insdert, update, delete계열의 쿼리문을 실행한다 반환타입은 int.
          * 만약 쿼리 실행후 별도의 반환값이 필요하지 않다면 위 2개의 메서드중 어떤것을 사용해도 무방하다.
          */
         // psmt.executeQuery();
         int result = psmt.executeUpdate();
      }

      catch (Exception e) {
         System.out.println("게시물 조회수 증가 중 예외 발생");
         e.printStackTrace();
      }
   }

   public void downCountPlus(String postId) {
      String sql = "UPDATE posts SET "
            + " view_count = view_count + 1 "
            + " WHERE post_id = ? ";

      try {
         psmt = con.prepareStatement(sql);
         psmt.setString(1, postId);
         psmt.executeUpdate();
      } catch (Exception e) {
         System.out.println("다운로드 횟수 증가 중 예외 발생");
         e.printStackTrace();
      }
   }

   public int deletePost(String postId) {
      int result = 0;
      try {
         String query = "DELETE FROM posts WHERE post_id=?";
         psmt = con.prepareStatement(query);
         psmt.setString(1, postId);
         result = psmt.executeUpdate();

      } catch (Exception e) {
         System.out.println("게시물 삭제 중 예외 발생");
         e.printStackTrace();
      }
      return result;
   }

   public int updatePost(BoardDTO dto) {
      int result = 0;
      try {
         // 쿼리문 템플릿 준비, 회원제이므로 일련번호와 아이디까지 조건에 추가.
         String query = "UPDATE posts SET title=?, content=?, ofile=?, sfile=? "
               + " WHERE post_id=? and user_id=?";

         // 쿼리문 준비 및 인파라미터 설정
         psmt = con.prepareStatement(query);
         psmt.setString(1, dto.getTitle());
         psmt.setString(2, dto.getContent());
         psmt.setString(3, dto.getOfile());
         psmt.setString(4, dto.getSfile());
         psmt.setString(5, dto.getPost_id());
         psmt.setString(6, dto.getUser_id());

         result = psmt.executeUpdate();
      } catch (Exception e) {
         System.out.println("게시물 수정 중 예외 발생");
         e.printStackTrace();
      }
      return result;
   }

   public List<BoardDTO> selectListPage(Map<String, Object> map) {
      List<BoardDTO> board = new Vector<BoardDTO>();

      String query = " SELECT * FROM ( "
            + " SELECT Tb.*, ROWNUM rNUM FROM ( "
            + " SELECT p.*, u.name FROM posts p "
            + " JOIN users u ON p.user_id = u.user_id ";

      if (map.get("searchWord") != null) {
         query += " WHERE " + map.get("searchField")
               + " LIKE '%" + map.get("searchWord") + "%'";
      }
      query += " ORDER BY post_id DESC "
            + " ) Tb "
            + " ) "
            + " WHERE rNUM BETWEEN ? AND ?";

      try {
         psmt = con.prepareStatement(query);
         psmt.setString(1, map.get("start").toString());
         psmt.setString(2, map.get("end").toString());
         rs = psmt.executeQuery();

         while (rs.next()) {
            BoardDTO dto = new BoardDTO();

            dto.setPost_id(rs.getString("post_id"));
            dto.setUser_id(rs.getString("user_id"));
            dto.setTitle(rs.getString("title"));
            dto.setContent(rs.getString("content"));
            dto.setReg_date(rs.getDate("reg_date"));
            dto.setView_count(rs.getInt("view_count"));
            dto.setBoard_type(rs.getString("board_type"));
            dto.setOfile(rs.getString("ofile"));
            dto.setSfile(rs.getString("sfile"));
            dto.setUpdated_at(rs.getDate("updatedate"));
            dto.setName(rs.getString("name"));

            board.add(dto);
         }
      } catch (Exception e) {
         System.out.println("게시물 조회 중 예외 발생");
         e.printStackTrace();
      }
      return board;
   }
}