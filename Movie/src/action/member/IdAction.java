package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.MemberDao;

public class IdAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String email = request.getParameter("email");
		MemberDao dao = new MemberDao();
		String id = dao.idSearch(email);
		String msg = "알수없는 에러 발생";
		String url = "../member/idForm.me";
		if(id == null) {
			msg = "정보에 맞는 id를 찾을 수 없습니당...";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward();
		}else {
			request.setAttribute("id", id.substring(0,2) + "**");
			msg = "id를 찾았습니다!";
			url = "../member/id.me";
			return new ActionForward();
		}
	}

}
