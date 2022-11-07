package com.hp.mypage.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.common.util.MyFileRenamePolicy;
import com.hp.common.util.MyHttpServlet;
import com.hp.mypage.model.service.MyPlantService;
import com.hp.mypage.model.vo.MyPlant;
import com.hp.user.model.vo.User;
import com.oreilly.servlet.MultipartRequest;

//반려식물 등록
/**
 * 파일 첨부 있는 게시글 등록 용도
 */

@WebServlet("/myplant/write")
public class MyPlantWriteServlet extends MyHttpServlet {
	private static final long serialVersionUID = 1L;
	private MyPlantService service = new MyPlantService();

	@Override
	public String getServletName() {
		return "MyPlantWrite";
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			User loginUser = getSessionUser(req);
			if(loginUser != null) {
				// 저장경로
				req.getRequestDispatcher("/views/html/3_myplantWrite").forward(req, resp);
				return;
			}
		} catch (Exception e) {}
		sendCommonPage("로그인이 필요합니다!", "/", req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			// 저장 경로 지정
			String path = getServletContext().getRealPath("/resources/upload/myplant");
			// 파일사이즈 지정
			int maxSize = 104857600; // 100 MB
			// 문자열 인코딩 설정
			String encoding = "UTF-8";
			// 멀티파라메터 처리 객체 생성 - cos.jar 활용
			MultipartRequest mr = new MultipartRequest(req, path, maxSize, encoding, new MyFileRenamePolicy());
			// 멀티 파라메터 선언 끝
			System.out.println("멀티파라메터" + path);
			
			User loginUser = getSessionUser(req);
			
			System.out.println("게시글 작성자 : "+(mr.getParameter("writer")));
			/* System.out.println("로그인 아이디 : " + (loginUser.getuIds())); */
			// 세션이 풀렸거나 실제 글쓴사람과 세션이 일치하지 않은 경우 '잘못된 접근'
			if(loginUser == null) {
				sendCommonPage("잘못된 접근입니다. (code=101)", "/myPage/list", req, resp);
				return;
			}
			
			MyPlant myplant = new MyPlant();
			myplant.setuNo(loginUser.getuNo());                          //회원번호
			myplant.setMpSctNm(mr.getParameter("myplantname"));          //품종
			myplant.setMpName(mr.getParameter("myplantmya"));            //내식물이름
			myplant.setMpWatering(mr.getParameter("myplantwater"));      //물주기
			myplant.setMpCreateDate(mr.getParameter("myplantdate")); 	 //분양날짜
			myplant.setMpFileName(mr.getOriginalFileName("myplantpic")); //첨부파일 - 내가저장
			myplant.setRe_mpFileName(mr.getFilesystemName("myplantpic"));//첨부파일 - 컴터저장
			
			
			/* SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); */
//			myplant.setBoCreateDate(now);
			
			System.out.println("● 게시물 보기 : " + myplant);

			int result = service.save(myplant); // DB에 게시글 저장
			
			System.out.println(result);
			
			if(result > 0) {
				sendCommonPage("반려식물이 정상적으로 등록되었습니다.", "/myPage/list", req, resp);
				return;
			}else {
				sendCommonPage("반려식물 등록에 실패하였습니다. (code=102)", "/myPage/list", req, resp);
			}
			} catch (Exception e) {
				e.printStackTrace();
				sendCommonPage("반려식물으로 처리할 수 없습니다. (code=103)",  "/myPage/list", req, resp);
			}
		}

	// 1. 사용자의 파라메터를 읽어온다. -> multi form으로 읽어온다.
	// 2. 사용자의 파라메터를 기준으로 필요시 DB CRUD 한다.
	// -> 파일의 경우 지정된 경로에 따로 저장한다.
	// 3. DB 저장 결과에 따라 페이지를 정하여 보내준다. // 실패-> 실패뜨게끔, 성공-> list로 이동하게끔

}
