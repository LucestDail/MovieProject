package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
/**
 * 로그인 되어있는 경우 doExecute 호출
 * 로그아웃 상태인 경우는 바로 login 하세요 메시지 출력 후 loginForm.me 로 페이지 이동
 * 로그인이 되어있으나, 파라매터 id 존재할 경우에는 로그인 되었습니다 (로그인 정보, 파라매터 정보 비교) 다른 경우(관리자가 아닌 경우)본인 정보만 조회 가능합니다... -> main.me 로 이동
 * @author dhtmd
 *
 */
public abstract class UserLoginAction implements Action {
	protected String login;
	protected String id;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		login = (String)request.getSession().getAttribute("login");
		id = request.getParameter("id");
		if(login == null) {
			request.setAttribute("msg", "로그인 하세요...");
			request.setAttribute("url", "../member/loginForm.me");
			return new ActionForward(false,"../alert.jsp");
		}
		if(id != null && !id.equals(login) && !login.equals("admin")) {
			request.setAttribute("msg", "본인만 확인 가능합니다...");
			request.setAttribute("url", "../board/index.do");
			return new ActionForward(false,"../alert.jsp");
		}
		return doExecute(request, response);
	}
	public abstract ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
