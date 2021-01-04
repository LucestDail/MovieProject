package action.board;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import action.ActionForward;
import model.Activity_Encounter;
import model.Activity_EncounterDao;
import model.Board;
import model.BoardDao;
import model.Comment;
import model.CommentDao;


public class BoardAction {
	BoardDao dao = new BoardDao();
	public ActionForward hello(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("hello", "Hello World do");
		return new ActionForward();
	}

	/**
	 * 1. 파라매터 값을 model.Board 객체 저장 -> MultipartRequest 객체 사용 -> useBean 사용 불가능! 2.
	 * 게시물 번호 num 현재 등록된 num의 최대값을 조회 최대값 + 1 등록된 게시무르이 번호 db에서 maxnum 구해서 +1 값으로
	 * num 설정 3. board 내용을 db에 등록하기 등록성공 : list.do 페이지 이동 등록 실패 : 메시지
	 * 출력.writeForm.do 페이지 이동
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	public ActionForward write(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getServletContext().getRealPath("/") + "movie/board/file/";
		File f = new File(path);
		if (!f.exists()) {
			f.mkdirs();
		}
		int size = 10 * 1024 * 1024;
		MultipartRequest multi;
		try {
			multi = new MultipartRequest(request, path, size, "euc-kr");
			int board_type = Integer.parseInt((String)request.getSession().getAttribute("board_type"));
			String member_id = (String) request.getSession().getAttribute("login");
			System.out.println("request board type : " + board_type);
			Board board = new Board();
			int num = dao.maxnum(board_type);
			board.setBoard_num(++num);
			board.setMember_id(member_id);
			board.setBoard_notice_able(Integer.parseInt(multi.getParameter("board_notice_able")));
			board.setBoard_subject(multi.getParameter("board_subject"));
			board.setBoard_content(multi.getParameter("board_content"));
			board.setBoard_attached_file(multi.getFilesystemName("board_attached_file"));
			//regdate : now()
			//readcnt : default 0
			board.setBoard_type(board_type);
			if(multi.getParameter("activity_able") == null) {
				board.setActivity_able(0);
			}else {
				board.setActivity_able(Integer.parseInt(multi.getParameter("activity_able")));
			}
			board.setActivity_type(multi.getParameter("activity_type"));
			if(multi.getParameter("give_state") == null) {
				board.setGive_state(0);
			}else {
				board.setGive_state(Integer.parseInt(multi.getParameter("give_state")));
			}
			if(multi.getParameter("give_type") == null) {
				board.setGive_type(0);
			}else {
				board.setGive_type(Integer.parseInt(multi.getParameter("give_type")));
			}
			if(multi.getParameter("information_type") == null) {
				board.setInformation_type(0);
			}else {
				board.setInformation_type(Integer.parseInt(multi.getParameter("information_type")));
			}
			if(multi.getParameter("give_information_type") == null) {
				board.setGive_information_type(0);
			}else {
				board.setGive_information_type(Integer.parseInt(multi.getParameter("give_information_type")));
			}
			board.setArea_name(multi.getParameter("area_name"));
			board.setArea_xpoint(multi.getParameter("area_xpoint"));
			board.setArea_ypoint(multi.getParameter("area_ypoint"));
			board.setArea_name_specific(multi.getParameter("area_name_specific"));
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			if(multi.getParameter("date_start_date") == null) {
				board.setDate_start_date(new Date());
			}else {
				try {
					board.setDate_start_date(sf.parse(multi.getParameter("date_start_date")));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			if(multi.getParameter("date_end_date") == null) {
				board.setDate_end_date(new Date());
			}else {
				try {
					board.setDate_end_date(sf.parse(multi.getParameter("date_end_date")));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			if(multi.getParameter("score_category_a") == null) {
				board.setScore_category_a(0);
				board.setScore_category_b(0);
				board.setScore_category_c(0);
				board.setScore_category_d(0);
			}else {
				board.setScore_category_a(Integer.parseInt(multi.getParameter("score_category_a")));
				board.setScore_category_b(Integer.parseInt(multi.getParameter("score_category_b")));
				board.setScore_category_c(Integer.parseInt(multi.getParameter("score_category_c")));
				board.setScore_category_d(Integer.parseInt(multi.getParameter("score_category_d")));
			}
			board.setMovie_subject(multi.getParameter("movie_subject"));
			board.setMovie_id(multi.getParameter("movie_id"));
			if (dao.insert(board)) {
				dao.addPoint(member_id, board_type, 10);
				return new ActionForward(true, "list.do?board_type="+request.getSession().getAttribute("board_type"));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		String msg = "게시물 등록 실패";
		String url = "writeForm.do?board_type="+request.getSession().getAttribute("board_type");
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	
	public ActionForward list(HttpServletRequest request, HttpServletResponse response) {
		int pageNum = 1;
		String board_type = request.getParameter("board_type");
		
     	try{
     		pageNum = Integer.parseInt(request.getParameter("pageNum"));
     	}catch(NumberFormatException e){
     	}
     	String column = request.getParameter("column");
     	String find = request.getParameter("find");
     	if(column == null || column.trim().equals("")||find == null || find.trim().equals("")) {
     		column = null;
     		find = null;
     	}
     	String movie_id = request.getParameter("movie_id");
     	String movie_subject = request.getParameter("movie_subject");
     	System.out.println("list get parameter : " + movie_id + "," + movie_subject);
		if(movie_id != null) {
			System.out.println("movie id is available");
			column = "movie_id";
			find = movie_id;
			movie_subject = "0";
		}else if(movie_subject != null){
			System.out.println("movie subject is available");
			column = "movie_subject";
			find = movie_subject;
			movie_id = "0";
		}else {
			System.out.println("it is null on movie information");
		}
		
		
		
     	int limit = 10;
     	int boardcount = dao.boardCount(column, find, board_type);
     	List<Board> list = dao.list(pageNum,limit, column, find, board_type);
     	System.out.println("printing list -> " + list);
     	int maxpage = (int)((double)boardcount/limit + 0.95);
     	int startpage = ((int)(pageNum/10.0 + 0.9) - 1) * 10 + 1;
     	int endpage = startpage + 9;
     	if(endpage > maxpage){
     		endpage = maxpage;
     	}
     	int boardnum = boardcount - (pageNum - 1) * limit;
     	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sf.format(new Date());
     	request.setAttribute("boardcount", boardcount);
     	request.setAttribute("list", list);
     	request.setAttribute("pageNum", pageNum);
     	request.setAttribute("maxpage", maxpage);
     	request.setAttribute("startpage", startpage);
     	request.setAttribute("endpage", endpage);
     	request.setAttribute("boardnum", boardnum);
     	request.setAttribute("today", today);
     	request.setAttribute("movie_id", movie_id);
     	request.setAttribute("movie_subject", movie_subject);
     	request.getSession().setAttribute("board_type",board_type);
     	System.out.println("current board type : " + board_type);
		return new ActionForward();
	}
	
	public ActionForward info(HttpServletRequest request, HttpServletResponse response) {
    	String board_num = request.getParameter("board_num");
    	System.out.println("info Action activated -> " + board_num);
    	BoardDao dao = new BoardDao();
    	Board infoBoard = dao.selectOne(board_num);
    	dao.readcntAdd(board_num);
    	request.setAttribute("infoBoard", infoBoard);
    	
    	
    	CommentDao cdao = new CommentDao();
    	List<Comment> listComment = cdao.select(board_num);
    	request.setAttribute("listComment", listComment);
    	if(infoBoard.getBoard_type() == 4) {
    		List<Activity_Encounter> encountlist = new Activity_EncounterDao().selectmember(board_num);
        	request.setAttribute("encountlist", encountlist);
    	}
		return new ActionForward();
	}
	
	
	public ActionForward replyForm(HttpServletRequest request, HttpServletResponse response){
		String num = request.getParameter("num");
		BoardDao dao = new BoardDao();
		Board b = dao.selectOne(num);
		request.setAttribute("b", b);
		return new ActionForward();
	}
	/*
	public ActionForward reply(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String path = request.getServletContext().getRealPath("/") + "movie/board/file/";
		File f = new File(path);
		if(!f.exists()){
			f.mkdirs();
		}
		int size = 10*1024*1024;
		MultipartRequest multi = new MultipartRequest(request, path, size, "euc-kr");
		Board board = new Board();
		String boardname = multi.getParameter("boardname");
		board.setNum(Integer.parseInt(multi.getParameter("num")));
		board.setName(multi.getParameter("name"));
		board.setPass(multi.getParameter("pass"));
		board.setSubject(multi.getParameter("subject"));
		board.setContent(multi.getParameter("content"));
		board.setFile1(multi.getFilesystemName("file1"));
		board.setGrp(Integer.parseInt(multi.getParameter("grp")));
		board.setGrplevel(Integer.parseInt(multi.getParameter("grplevel")));
		board.setGrpstep(Integer.parseInt(multi.getParameter("grpstep")));
		dao.grpStepAdd(board.getGrp(),board.getGrpstep(), boardname);
		int grplevel = board.getGrplevel();
		int grpstep = board.getGrpstep();
		int num = dao.maxnum(boardname);
		String msg = "답변등록시 오류 발생";
		String url = "replyForm.do?num="+board.getNum() + "&&boardname=" + boardname;
		
		board.setNum(++num);
		board.setGrplevel(grplevel + 1);
		board.setGrpstep(grpstep + 1);
		if(dao.insert(board,boardname)){
			msg = "답변등록 완료";
			url = "list.do" + "?boardname=" + boardname;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
	*/
	
	public ActionForward updateForm(HttpServletRequest request, HttpServletResponse response){
		System.out.println("updateForm ActionForward activated");
		String num = request.getParameter("board_num");
		BoardDao dao = new BoardDao();
		Board b = dao.selectOne(num);
		request.setAttribute("b", b);
		return new ActionForward();
	}
	
	public ActionForward update(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("boardaction update function activated");
		Board board = new Board();
		String path = request.getServletContext().getRealPath("/") + "movie/board/file/";
		File f = new File(path);
		if(!f.exists()){
			f.mkdirs();
		}
		
		int size = 10*1024*1024;
		MultipartRequest multi = new MultipartRequest(request, path, size, "euc-kr");
		String board_num = multi.getParameter("board_num");
		System.out.println("here : " + board_num);
		System.out.println("update activated -> " + board_num + " from " + (String) request.getSession().getAttribute("board_type"));
		board.setBoard_num(Integer.parseInt(board_num));
		String member_id = (String) request.getSession().getAttribute("login");
		board.setMember_id(member_id);
		board.setBoard_notice_able(Integer.parseInt(multi.getParameter("board_notice_able")));
		board.setBoard_subject(multi.getParameter("board_subject"));
		board.setBoard_content(multi.getParameter("board_content"));
		board.setBoard_attached_file(multi.getFilesystemName("board_attached_file"));
		if(board.getBoard_attached_file() == null || board.getBoard_attached_file().equals("")){
			board.setBoard_attached_file(multi.getParameter("board_attached_file_temp"));
		}
		if(multi.getParameter("score_category_a") == null) {
			board.setScore_category_a(0);
			board.setScore_category_b(0);
			board.setScore_category_c(0);
			board.setScore_category_d(0);
		}else {
			board.setScore_category_a(Integer.parseInt(multi.getParameter("score_category_a")));
			board.setScore_category_b(Integer.parseInt(multi.getParameter("score_category_b")));
			board.setScore_category_c(Integer.parseInt(multi.getParameter("score_category_c")));
			board.setScore_category_d(Integer.parseInt(multi.getParameter("score_category_d")));
		}
		if(multi.getParameter("activity_able") == null) {
			board.setActivity_able(0);
		}else {
			board.setActivity_able(Integer.parseInt(multi.getParameter("activity_able")));
		}
		board.setActivity_type(multi.getParameter("activity_type"));
		if(multi.getParameter("give_state") == null) {
			board.setGive_state(0);
		}else {
			board.setGive_state(Integer.parseInt(multi.getParameter("give_state")));
		}
		if(multi.getParameter("give_type") == null) {
			board.setGive_type(0);
		}else {
			board.setGive_type(Integer.parseInt(multi.getParameter("give_type")));
		}
		if(multi.getParameter("information_type") == null) {
			board.setInformation_type(0);
		}else {
			board.setInformation_type(Integer.parseInt(multi.getParameter("information_type")));
		}
		if(multi.getParameter("give_information_type") == null) {
			board.setGive_information_type(0);
		}else {
			board.setGive_information_type(Integer.parseInt(multi.getParameter("give_information_type")));
		}
		board.setArea_name(multi.getParameter("area_name"));
		board.setArea_xpoint(multi.getParameter("area_xpoint"));
		board.setArea_ypoint(multi.getParameter("area_ypoint"));
		board.setArea_name_specific(multi.getParameter("area_name_specific"));
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		if(multi.getParameter("date_start_date") == null) {
			board.setDate_start_date(new Date());
		}else {
			try {
				board.setDate_start_date(sf.parse(multi.getParameter("date_start_date")));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if(multi.getParameter("date_end_date") == null) {
			board.setDate_end_date(new Date());
		}else {
			try {
				board.setDate_end_date(sf.parse(multi.getParameter("date_end_date")));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		BoardDao dao = new BoardDao();
		Board dbBoard = dao.selectOne(board_num);
		int board_type = dbBoard.getBoard_type();
		String msg = "게시물 수정 실패.";
		String url = "updateForm.do?board_num="+board_num;
		if(dao.update(board)){
			msg = "게시물 수정 완료";
			url = "info.do?board_num=" + board_num + "&&board_type=" + board_type;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
	
	public ActionForward deleteForm(HttpServletRequest request, HttpServletResponse response){
		String num = request.getParameter("board_num");
		BoardDao dao = new BoardDao();
		Board b = dao.selectOne(num);
		request.setAttribute("b", b);
		return new ActionForward();
	}
	
	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("euc-kr");
		String board_type = request.getParameter("board_type");
		String board_num = request.getParameter("board_num");
		BoardDao dao = new BoardDao();
		String msg = "게시글 삭제 실패";
		String url = "info.do?board_num="+board_num + "&&board_type=" + board_type;
		if(dao.delete(board_num)){
			msg = "게시글 삭제 성공!";
			url = "list.do?board_type=" + board_type;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
	
	public ActionForward imgupload(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String path = request.getServletContext().getRealPath("/") + "movie/board/imgfile/";
		File f = new File(path);
		if(!f.exists()){
			f.mkdirs();
		}
		int size = 10*1024*1024;
		MultipartRequest multi = new MultipartRequest(request, path, size, "euc-kr");
		//upload : ckeditor 에서 지정하였음!
		String fileName = multi.getFilesystemName("upload");
		request.setAttribute("fileName",  fileName);
		request.setAttribute("CKEditorFuncNum", request.getParameter("CKEditorFuncNum"));
		return new ActionForward(false, "ckeditor.jsp");
	}
	
	public ActionForward graph(HttpServletRequest request, HttpServletResponse response) throws IOException{
		System.out.println("BoardAction - graph activated");
		List<Map<String, Object>> list = dao.boardgraph();
		System.out.println(list);
		StringBuilder json = new StringBuilder("[");
		int i = 0;
		for(Map<String,Object> m : list) {
			for(Map.Entry<String, Object> map : m.entrySet()) {
				if(map.getKey().equals("name")) {
					json.append("{\"name\":\"" + map.getValue() + "\"");
				}
				if(map.getKey().equals("cnt")) {
					json.append("\"cnt\":" + map.getValue() + "}");
				}
				i++;
				if(i/2 < list.size()) {
					json.append(",");
				}
				
			}
			
		}
		json.append("]");
		request.setAttribute("json", json.toString().trim());
		return new ActionForward();
	}
	
	public ActionForward commentwrite(HttpServletRequest request, HttpServletResponse response) {
		Comment comment = new Comment();
		String member_id = request.getParameter("member_id");
		String board_num = request.getParameter("board_num");
		int board_type = Integer.parseInt(request.getParameter("board_type"));
		System.out.println("commentwrite function -> " + member_id + " : " + board_num);
		comment.setBoard_num(Integer.parseInt(board_num));
		comment.setMember_id(member_id);
		comment.setComment_content(request.getParameter("comment_content"));
		
		String msg = "댓글 등록 실패";
		String url = "info.do?board_num="+board_num+"&&board_type="+board_type;
		
		if(new CommentDao().insert(comment)) {
			new CommentDao().addPoint(member_id, board_type, 5);
			msg = "댓글 등록 성공";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	
	public ActionForward updateComment(HttpServletRequest request, HttpServletResponse response) {
		Comment comment = new Comment();
		String comment_num = request.getParameter("comment_num");
		String comment_content = request.getParameter("comment_content");
		System.out.println("commentUpdate function -> " + comment_num + " : " + comment_content);
		comment.setComment_num(Integer.parseInt(comment_num));
		comment.setComment_content(comment_content);
		Comment curComment = new CommentDao().selectOne(Integer.parseInt(comment_num));
		String msg = "댓글 수정 실패";
		String url = "info.do?board_num=" + curComment.getBoard_num();
		if(new CommentDao().update(comment)) {
			msg = "댓글 수정 성공";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	
	public ActionForward deleteComment(HttpServletRequest request, HttpServletResponse response) {
		String comment_num = request.getParameter("comment_num");
		System.out.println("commentDelete function -> " + comment_num);
		Comment curComment = new CommentDao().selectOne(Integer.parseInt(comment_num));
		String msg = "댓글 삭제 실패";
		String url = "info.do?board_num=" + curComment.getBoard_num();
		if(new CommentDao().delete(comment_num)) {
			msg = "댓글 삭제 성공";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	
	public ActionForward recommand(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("recommand board activated");
		String board_num = request.getParameter("board_num");
		String msg = "게시글 추천 실패!";
		String url = "info.do?board_num=" + board_num;
		Board board = new Board();
		board.setBoard_num(Integer.parseInt(board_num));
		if(new BoardDao().recommand(board)) {
			msg = "게시글 추천 성공!";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	
	public ActionForward notRecommand(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("not recommand board activated");
		String board_num = request.getParameter("board_num");
		String msg = "게시글 비추천 실패!";
		String url = "info.do?board_num=" + board_num;
		Board board = new Board();
		board.setBoard_num(Integer.parseInt(board_num));
		if(new BoardDao().notRecommand(board)) {
			msg = "게시글 비추천 성공!";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward alert(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("alert board activated");
		String board_num = request.getParameter("board_num");
		String msg = "게시글 신고 실패!";
		String url = "info.do?board_num=" + board_num;
		Board board = new Board();
		board.setBoard_num(Integer.parseInt(board_num));
		if(new BoardDao().alert(board)) {
			msg = "게시글 신고 성공!";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	
	public ActionForward recommandComment(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("recommand comment activated");
		String comment_num = request.getParameter("comment_num");
		System.out.println("recommand method -> " + comment_num);
		Comment curComment = new CommentDao().selectOne(Integer.parseInt(comment_num));
		
		String msg = "댓글 추천 실패";
		String url = "info.do?board_num=" + curComment.getBoard_num();
		
		if(new CommentDao().recommand(comment_num)) {
			msg = "댓글 추천 성공";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	
	public ActionForward notRecommandComment(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("not recommand comment activated");
		String comment_num = request.getParameter("comment_num");
		System.out.println("notrecommand method function -> " + comment_num);
		Comment curComment = new CommentDao().selectOne(Integer.parseInt(comment_num));
		
		String msg = "댓글 비추천 실패";
		String url = "info.do?board_num=" + curComment.getBoard_num();
		
		if(new CommentDao().notRecommand(comment_num)) {
			msg = "댓글 비추천 성공";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward alertComment(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("alert comment activated");
		String comment_num = request.getParameter("comment_num");
		System.out.println("alertcomment method -> " + comment_num);
		Comment curComment = new CommentDao().selectOne(Integer.parseInt(comment_num));
		System.out.println(curComment.getBoard_num());
		String msg = "댓글 신고 실패";
		String url = "info.do?board_num=" + curComment.getBoard_num();
		
		if(new CommentDao().alert(comment_num)) {
			msg = "댓글 신고 성공";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	
	public ActionForward index(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("activated index function");
     	List<Board> readcntlist = dao.readcntlist();
     	List<Board> recommandlist = dao.recommandlist();
     	List<Board> noticelist = dao.noticelist();
     	List<Board> recentboardlist = new BoardDao().selectrecentboard();
		List<Comment> recentcommentlist = new CommentDao().selectrecentcomment();
     	System.out.println(readcntlist  + " / " + recommandlist + " / " + noticelist);
     	request.setAttribute("readcntlist", readcntlist);
     	request.setAttribute("recommandlist", recommandlist);
     	request.setAttribute("noticelist", noticelist);
     	request.setAttribute("recentboard", recentboardlist);
		request.setAttribute("recentcomment", recentcommentlist);
		return new ActionForward();
	}
	
	public ActionForward myboard(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("mylistfunction activated");
		int board_type = Integer.parseInt(request.getParameter("board_type"));
		String member_id = (String)request.getSession().getAttribute("login");
		List<Board> boardlist = new BoardDao().selectmyboard(member_id, board_type);
		List<Comment> commentlist = new CommentDao().selectmycomment(member_id, board_type);
		request.setAttribute("boardlist", boardlist);
		request.setAttribute("commentlist", commentlist);
		return new ActionForward();
	}
	public ActionForward encount(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("encount activated");
		String board_num = request.getParameter("board_num");
		String member_id = request.getParameter("member_id");
		String msg = "참여 실패!";
		String url = "info.do?board_num=" + board_num;
		Activity_Encounter ae = new Activity_Encounter();
		ae.setBoard_num(Integer.parseInt(board_num));
		ae.setMember_id(member_id);
		if(new Activity_EncounterDao().select(ae)) {
			msg = "이미 참여했습니다!";
		}else {
			if(new Activity_EncounterDao().insert(ae)) {
				msg = "참여 성공!";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	
	public ActionForward encountcancel(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("encountcancel activated");
		String board_num = request.getParameter("board_num");
		String member_id = request.getParameter("member_id");
		String msg = "참여 제거 실패!";
		String url = "info.do?board_num=" + board_num;
		Activity_Encounter ae = new Activity_Encounter();
		ae.setBoard_num(Integer.parseInt(board_num));
		ae.setMember_id(member_id);
		if(!(new Activity_EncounterDao().select(ae))) {
			msg = "참여자 명단에 없습니다!";
		}else {
			if(new Activity_EncounterDao().delete(ae)) {
				msg = "참여 제거 성공!";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
}
