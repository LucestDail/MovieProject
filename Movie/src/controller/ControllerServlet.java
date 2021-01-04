package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import action.Action;
import action.ActionForward;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class ControllerServlet
 */
@WebServlet(
		urlPatterns = {"*.me"},
		initParams = {
				@WebInitParam(
						name = "properties",
						value = "action.properties")
				}
		)
public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Action> commandMap = new HashMap<>();
    public ControllerServlet() {
        super();
    }
    //config : ("properties","action.properties")
    //	@WebInitParam 객체가 전달됨.
    
    @Override // ControllerServlet 클래스의 객체 생성시 한번 호출
    public void init(ServletConfig config) throws ServletException{
    	//props : action.properties
    	String props = config.getInitParameter("properties");
    	//Properties : Hashtable 하위클래스임!
    	//Hashtable 은 맵<- 객체입니당...
    	//<String, String> map 객체라고 볼 수 있습니다..
    	Properties pr = new Properties();
    	FileInputStream f = null;
    	try {
    		//f : action.properties 파일을 읽기 위한 입력스트림
    		f = new FileInputStream(config.getServletContext().getRealPath("/") + "WEB-INF/" + props);
    		//model2/hello.me = action.HelloAction
    		//key : /model2/hello.me
    		//value : action.HelloAction
    		//("/model2/hello.me","action.HelloAction") 좌측은 키로, 오른쪽은 밸류로 자동으로 들어오게 하는 함수!
    		pr.load(f);
    	}catch(IOException e) {
    		throw new ServletException(e);
    	}finally {
    		try {
    			if(f != null) {
    				f.close();
    			}
    		}catch(IOException e) {
    			e.printStackTrace();
    		}
    	}
    	for(Object k : pr.keySet()) {
    		String command = (String)k;
    		//className : "action.HelloAction"
    		String className = pr.getProperty(command);
    		try {
    			//commandClass : action.HelloAction 클래스정보
    			Class commandClass = Class.forName(className.trim());
    			//newInstance() : 객체화 해라...
    			//commandObj : action.HelloAction 객체를 저장함.
    			Object commandObj = commandClass.newInstance();
    			commandMap.put(command, (Action)commandObj);
    		}catch(Exception e) {
    			throw new ServletException(e);
    		}
    	}
    }
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//http://localhost:8080/jspstudy2/model2/hello.me
		request.setCharacterEncoding("euc-kr");
		Action action = null;
		ActionForward forward = null;
		String command = null;
		try {
			
			//request.getRequestURI() : /jspstudy2/model2/hello.me
			//request.getContextPath() : /jspstudy2
			//command : /model1/hello.me
			command = request.getRequestURI().substring(request.getContextPath().length());
			action = commandMap.get(command);
			System.out.println(request.getSession().getAttribute("login") + " : " + command);
			forward = action.execute(request, response);
		}catch(NullPointerException e) {
			forward = new ActionForward();
		}catch(Exception e) {
			throw new ServletException(e);
		}
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getView());
			}else {
				if(forward.getView() == null) {
					forward.setView(command.replace(".me", ".jsp"));
				}
				
				//forward.getView() : hello.jsp
				RequestDispatcher disp = request.getRequestDispatcher(forward.getView());
				disp.forward(request, response); //forward
			}
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
