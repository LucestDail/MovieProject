package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
/**
 * 1. 로그인 정보 제거
 * 2. 로그아웃 하셨습니다 메시지 출력 후 loginForm.me 페이지로 이동
 * @author dhtmd
 *
 */
public class LogoutAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.getSession().invalidate();
		request.setAttribute("msg", "로그아웃하셨습니다");
		request.setAttribute("url", "../board/index.do");
		return new ActionForward(false,"../board/index.do");
	}

}
