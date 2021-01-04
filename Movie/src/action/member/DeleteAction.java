package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;

public class DeleteAction extends UserLoginAction{

	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(id.equals("admin")) {
			request.setAttribute("msg", "관리자는 탈퇴가 불가능합니다...");
			request.setAttribute("url", "../board/index.do");
			return new ActionForward(false, "../alert.jsp");
		}
		
		String pass = request.getParameter("password");
		System.out.println(id + "," + pass);
		String msg = null;
		String url = null;
		
		if(login.equals("admin")) {
			url = "../member/list.me";
		}else {
			url = "../Movie/index.jsp";
		}
		
		MemberDao dao = new MemberDao();
		Member dbmember =null;
		dbmember = dao.selectOne(login);
		
		if(pass.equals(dbmember.getMember_password())) {
			if(dao.delete(id) > 0) {
				if(login.equals("admin")) {
					msg = id + " 사용자 강제 탈퇴 성공";
				}else {
					msg = id + " 님의 회원탈퇴가 완료되었습니다.";
					request.getSession().invalidate();
				}
			}else {
				msg = id + "님의 탈퇴시 오류 발생...";
				if(!login.equals("admin")) {
					url = "../member/info.me?id=" + id;
				}
			}
		}else {
			msg = login + "님의 비밀번호가 틀립니다...";
			url = "../member/deleteForm.me?id="+id;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

}
