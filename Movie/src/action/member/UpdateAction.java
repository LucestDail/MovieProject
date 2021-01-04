package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;

public class UpdateAction extends UserLoginAction{

	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member member = new Member();
		System.out.println(request.getParameter("id"));
		member.setMember_picture(request.getParameter("picture"));
		member.setMember_id(request.getParameter("id"));
		member.setMember_password(request.getParameter("password"));
		member.setMember_nickname(request.getParameter("nickname"));
		member.setMember_gender(Integer.parseInt(request.getParameter("gender")));
		member.setMember_age(Integer.parseInt(request.getParameter("age")));
		member.setMember_email(request.getParameter("email"));
		member.setMember_email_receive_ok(Integer.parseInt(request.getParameter("emailreceive")));
		member.setMember_introduction(request.getParameter("introduction"));
		member.setMember_genre(request.getParameter("genre"));
		System.out.println(member);
		String msg = "비밀번호가 틀렸습니다...";
		String url = "../member/info.me?id=" + request.getSession().getAttribute("login");
		
		MemberDao dao = new MemberDao();
		Member dbmember = dao.selectOne(login);
		
		if(member.getMember_password().equals(dbmember.getMember_password())) {
			System.out.println("current type 1");
			int result = dao.update(member);
			if(result > 0) {
				return new ActionForward(true, "../member/info.me?id="+member.getMember_id());
			}else {
				msg = "수정 실패";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
}
