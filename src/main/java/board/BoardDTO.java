package board;

public class BoardDTO {

    // 멤버변수 선언 : board 테이블과 동일하게 선언
    // 타입은 특별한 경우가 아니라면 String으로 선언한다. 연산이 필요한 경우에만
    // int, Date 타입으로 선언하면 된다.
	public String post_id;               // 번호
	public String user_id;                // 작성자 아이디
	public String title;             // 제목
	public String content;           // 내용
	public java.sql.Date reg_date;   // 작성일
	public int view_count;           // 조회수
	public String board_type;        // 게시판 유형
	public String ofile;             // 원본 파일명
	public String sfile;             // 저장된 파일명
	public java.sql.Date updated_at; // 수정일


    
	public String getPost_id() {
		return post_id;
	}
	public void setPost_id(String post_id) {
		this.post_id = post_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public java.sql.Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(java.sql.Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	public String getOfile() {
		return ofile;
	}
	public void setOfile(String ofile) {
		this.ofile = ofile;
	}
	public String getSfile() {
		return sfile;
	}
	public void setSfile(String sfile) {
		this.sfile = sfile;
	}
	public java.sql.Date getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(java.sql.Date updated_at) {
		this.updated_at = updated_at;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	/*
     * users 테이블과 join 하여 회원의 이름을 출력해야 하는 경우 사용하기 위해
     * 멤버변수를 추가한다.
     */
    private String name;

    // 생성자는 필요한 경우에만 정의하면 된다.

    // 게터 / 세터

    // board_type의 getter/setter
    public String getBoard_type() {
        return board_type;
    }
    public void setBoard_type(String board_type) {
        this.board_type = board_type;
    }

}