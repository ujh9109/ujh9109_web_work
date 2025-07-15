package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.print.attribute.HashPrintRequestAttributeSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/send")
public class SendServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		 * 클라이언트가 요청을 하면서 전송한 요청 파라미터 추출하기
		 * 
		 * HttpServletRequest 객체의 기능을 이용해서 추출하면 된다.
		 * request.setCharacterEncoding("utf-8");
		 * post 방식 전송인 경우 추출하기 전에 인코딩 설정을 해줘야 한글이 깨지지 않는다.
		 * tomcat 10부터는 자동으로  된다.
		 * 
		 * */
		
		request.setCharacterEncoding("utf-8");
		String url = request.getRemoteHost();//위조 방지용으로 url 출력
		String name = request.getParameter("name");
		String msg = request.getParameter("msg");
		System.out.println(url+" : "+name+" : "+msg);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		PrintWriter pw = response.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset=utf-8>");
		pw.println("<title>메시지 전송결과 페이지</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<p>메시지 잘 받았어 클라이언트야</p>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}

}
