package sec04.ex02;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class LoginImpl2 implements HttpSessionListener {
	String id;
	String pwd;
	static int total_user = 0;
	
	public LoginImpl2() {
		// TODO Auto-generated constructor stub
	}
	
    public LoginImpl2(String id, String pwd) {
    	this.id = id;
    	this.pwd = pwd;
    }
    
    public void sessionCreated(HttpSessionEvent se)  { 
         // 세션이 생성 될때 실행
    	System.out.println("세션 생성");
    	++total_user;
    }

    public void sessionDestroyed(HttpSessionEvent se)  { 
         // 세션이 종료 될때 실행
    	System.out.println("세션 종료");
    	--total_user;
    }
	
}