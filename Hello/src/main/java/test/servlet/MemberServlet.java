package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import test.dao.MemberDao;
import test.dto.MemberDto;


@WebServlet("/회원목록보기")
public class MemberServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        
		MemberDao dao = new MemberDao();
		List<MemberDto> list = dao.selectAll();
		
		PrintWriter pw = response.getWriter();
		pw.println("<!DOCTYPE html>");
        pw.println("<html lang='en'>");
        pw.println("<head>");
        pw.println("    <meta charset='UTF-8'>");
        pw.println("    <meta name='viewport' content='width=device-width, initial-scale=1.0'>");
        pw.println("    <title>회원 목록</title>");
        pw.println("    <style>");
        pw.println("        table, th, td {");
        pw.println("            border: 1px solid black;");
        pw.println("            border-collapse: collapse;");
        pw.println("        }");
       
        pw.println("    </style>");
        pw.println("</head>");
        pw.println("<body>");
        pw.println("    <div class='container'>");
        pw.println("        <h1>회원목록</h1>");
        pw.println("        <table>");
        pw.println("            <thead>");
        pw.println("                <tr>");
        pw.println("                    <th>번호</th>");
        pw.println("                    <th>이름</th>");
        pw.println("                    <th>주소</th>");
        pw.println("                </tr>");
        pw.println("            </thead>");
        /**/
        pw.println("            <tbody>");
        
        for (MemberDto tmp : list) {
        	pw.println("                <tr>");
        	pw.println("                    <td>" + tmp.getNum() + "</td>");
            pw.println("                    <td>" + tmp.getName() + "</td>");
            pw.println("                    <td>" + tmp.getAddr() + "</td>");
            pw.println("                </tr>");
        }

        pw.println("            </tbody>");
        /**/
        pw.println("        </table>");
        pw.println("    </div>");
        pw.println("</body>");
        pw.println("</html>");

        pw.close();
        

	}
}
