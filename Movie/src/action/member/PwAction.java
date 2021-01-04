package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.MemberDao;

public class PwAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		MemberDao dao = new MemberDao();
		String pass = dao.pwSearch(id,email);
		String msg = "알수없는 에러 발생";
		String url = "../member/pwForm.me";
		if(id == null) {
			msg = "정보에 맞는 id를 찾을 수 없습니당...";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward();
		}else {
			request.setAttribute("password", "**" + pass.substring(pass.length()-2,pass.length()));
			msg = "pw를 찾았습니다!";
			url = "../member/pw.me";
			return new ActionForward();
		}
	}

}
