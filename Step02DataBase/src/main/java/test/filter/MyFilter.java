package test.filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;

/*
 * 요청을 가로채서 필터링 작업을 할 Filter 정의하기
 * 
 * jakarta.servlet.Filter 인터페이스를 구현한다.
 * 
 * 어떤 요청에 대해서 필터링을 할지, @webFilter 어노테이션으로 맴핑한다.
 * */

@WebFilter("/member/*") // "/member/" 하위의 모든 요청에 대해서 필터링을 하겠다는 의미.
public class MyFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		
		System.out.println("MyFilter 작동중");
		
		
		//요청의 흐름 이어가기
		//doFilter() 메소드 호출하면서, request,response 매개변수 전달 안하면 응답 안함.
		chain.doFilter(request, response);
		
	}
	
}
