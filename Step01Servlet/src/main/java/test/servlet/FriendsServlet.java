package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/friends")
public class FriendsServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		List<String> names = new ArrayList<>();
		names.add("김구라");
		names.add("해골");
		names.add("원숭이");
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		PrintWriter pw = response.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset=utf-8>");
		pw.println("<title>친구 목록</title>");
		pw.println("</head>");
		pw.println("<body>");
			pw.println("<h1>친구 목록입니다</h1>");
			pw.println("<ul>");
		
				for(String tmp : names) {
					pw.println("<li>"+tmp+"</li>");
				};
		
			pw.println("</ul>");		
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
		
	}

}
