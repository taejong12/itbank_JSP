package sec04.ex01;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class LoginImpl implements HttpSessionBindingListener{
	String id;
	String pwd;
	static int total_user = 0;
	
	public LoginImpl(String id, String pwd) {
		this.id = id;
		this.pwd = pwd;
	}

	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		// 세션에 값을 저장하면 실행
		System.out.println("사용자 접속");
		++total_user;
	}

	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		// 세션에 값을 삭제하면 실행
		System.out.println("사용자 접속 해제");
		--total_user;
	}
	
	
}