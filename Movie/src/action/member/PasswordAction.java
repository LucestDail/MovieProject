package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;

public class PasswordAction extends UserLoginAction {

	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		boolean opener = true;
		boolean closer = true;
		String url = null;
		String msg = null;
		String pass = request.getParameter("pass");
		String chgpass = request.getParameter("chgpass");
		MemberDao dao = new MemberDao();
		Member mem = dao.selectOne(login);
		if (pass.equals(mem.getMember_password())) {
			if (dao.updatePass(login, chgpass) > 0) {
				msg = "비밀번호가 변경되었습니당!";
				url = "../member/info.me?id="+login;
			} else {
				msg = "비밀번호 변경 실패";
				url = "../member/updateForm.me?id="+login;
			}
		} else {
			opener = false;
			closer = false;
			msg = "비밀번호 오류입니당... ";
			url = "../memberpasswordForm.me";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		request.setAttribute("opener", opener);
		request.setAttribute("closer", closer);
		return new ActionForward();
	}

}
