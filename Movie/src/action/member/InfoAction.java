package action.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.Board;
import model.BoardDao;
import model.Member;
import model.MemberDao;

public class InfoAction extends UserLoginAction {

	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member member = new MemberDao().selectOne(id);
		//List<Board> MyBoardlist = new BoardDao().selectMyboard(id);
		request.setAttribute("member", member);
		//request.setAttribute("boardlist", MyBoardlist);
		return new ActionForward();
	}
}
