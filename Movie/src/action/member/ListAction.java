package action.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;
/**
 * 1. db 에서 모든 회원 정보를 조회하여 List<Member> 객체로 리턴...
 * List<Member> MemberDao().list()
 * 
 * 2. list 객체를 request.setAttribute() 메소드로 등록하여 view 단으로 날려줍니당...
 * @author dhtmd
 *
 */
public class ListAction extends AdminLoginAction{

	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Member> list = new MemberDao().list();
		request.setAttribute("list", list);
		return new ActionForward();
	}

}
