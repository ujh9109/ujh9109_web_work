package test.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.UUID;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import test.dao.UserDao;
import test.dto.UserDto;

@WebServlet("/user/update")
@MultipartConfig(
		fileSizeThreshold = 1024*1024*10, //업로드 처리하기 위한 메모리 사이즈(10MB)
		maxFileSize = 1024*1024*50, //업로드 되는 최대 파일 사이즈(50MB)
		maxRequestSize =1024*1024*60//이 요청의 최대 사이즈(60MB), 파일 외의 다른 문자열도 전송되기 때문.
		)
public class UserUpdateServlet extends HttpServlet {
	String fileLocation;
	
	
	@Override
	public void init() throws ServletException {
		//이 서블릿이 초기화되는 시점에 최초 1번 호출되는 메소드
		
		//무언가 초기화 작업을 여기서 하면된다.
		ServletContext context = getServletContext();
		//web.xml 파일에 "filelocation 이라는 이름으로 저장된 정보 읽어와서 필드에 저장
		fileLocation = context.getInitParameter("fileLocation");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userName = req.getParameter("userName");
		String email = req.getParameter("email");
		
		//파일 데이터 불러오기
		//input type file의 name = profileImage
		Part filePart = req.getPart("profileImage");
		
		//DB에서 사용자 정보를 불러온다.
		UserDto dto = UserDao.getInstance().getByUserName(userName); 
		
		//만약 업로드된 프로필 이미지가 있다면(수정하지 않았으면 없다.)
		if(filePart !=null && filePart.getSize() >0) {
			//원본 파일의 이름 얻어내기
			String orgFileName = filePart.getSubmittedFileName();
			//파일명이 겹치지 않게 랜덤한 id 값 얻어내기
			String uid = UUID.randomUUID().toString();
			//저장할 파일명을 구성.
			String saveFileName = uid+orgFileName;
			//저장할 파일의 경로 구성하기
			String filePath =fileLocation+"/"+uid+orgFileName;
			
			/*
			 * 업로드 된 파일은 임시 폴더의 임시 파일로 저장이 된다.
			 * 해당 파일에서 바이트 알갤이를 읽어 들일 수 있는 inputStream 객체를 얻어낸다.
			 * 
			 * */
			
			InputStream is = filePart.getInputStream();
			//원하는 목적지에 copy를 해야한다.
			Files.copy(is, Paths.get(filePath));
			
			if(dto.getProfileImage() !=null) {
				//삭제할 파일의 전체 경로
				String deleteFilePath = fileLocation+"/"+dto.getProfileImage();
				//Files 클래스의 delete() 메소드 이용해서 삭제하기
				Files.delete(Paths.get(deleteFilePath));
			}
			
			//dto에 이메일과 저장된 파일명을 담는다.
			dto.setEmail(email);
			dto.setProfileImage(saveFileName);
			//dto의 email과 profile을 수정하는 메소드를 이용해서 수정반영
			
			UserDao.getInstance().updateEmailAndProfile(dto);
			
			
		}else {// 업로드 된 프로필 이미지가 없으면 이메일만 수정
			//dto에 이메일만 담는다.
			dto.setEmail(email);
			//수정하는 메소드를 이용해서 수정 반영
			UserDao.getInstance().updateEmail(dto);
		}
		
		//리다이렉트 응답
		String cPath = req.getContextPath();
		resp.sendRedirect(cPath+"/user/info.jsp");
		
	}
}
