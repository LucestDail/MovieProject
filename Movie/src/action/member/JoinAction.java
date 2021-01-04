package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.Member;
import model.MemberDao;
/**
 * 1. 파라매터 정보를 Member 객체에 저장
 * 		model.Member
 * 
 * 
 * 2. Member 객체 정보를 db에 추가.
 * 		member 테이블 데이터 저장
 * 
 * 
 * 3. 가입성공 : loginForm.me 페이지 이동
 * 	  가입실패 : joinForm.me 페이지 이동
 * @author dhtmd
 *
 */
public class JoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 맴버 객체 생성하기!
		Member member = new Member();
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
		member.setMember_is_admin(0);
		String msg = "회원가입 실패";
		String url = "../member/joinform.me";
		if(new MemberDao().insert(member) > 0) {
			msg = member.getMember_nickname() + "님 회원가입 완료입니다.";
			url = "../board/index.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}

}
