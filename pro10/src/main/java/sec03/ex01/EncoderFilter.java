package sec03.ex01;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpFilter;

//@WebFilter("/*")
public class EncoderFilter extends HttpFilter implements Filter {
	ServletContext context;
	
	public void init(FilterConfig fConfig) throws ServletException {
		// Filter 생성 시 실행되는 함수
		System.out.println("utf-8 인코딩 중 ....");
		context = fConfig.getServletContext();
	}
	
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// Filter 의 실제 실행되는 기능을 구현하는 함수
		// ===============================
		// 요청에 따른 필터를 적용
		System.out.println("doFilter() 실행");
		request.setCharacterEncoding("utf-8");
		long begin = System.currentTimeMillis();
		// ===============================
		chain.doFilter(request, response);
		// ===============================
		// 응답에 따른 필터를 적용
		
		long end = System.currentTimeMillis();
		System.out.println("작업 시간 : " + 
			(end - begin) + "ms");
		// ===============================
	}

	public void destroy() {
		System.out.println("Filter destory() 호출");
	}



}