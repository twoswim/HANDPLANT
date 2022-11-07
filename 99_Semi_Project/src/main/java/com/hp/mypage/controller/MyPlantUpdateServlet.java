package com.hp.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hp.common.util.MyFileRenamePolicy;
import com.hp.common.util.MyHttpServlet;
import com.hp.mypage.model.service.MyPlantService;
import com.hp.mypage.model.vo.MyPlant;
import com.hp.user.model.vo.User;
import com.oreilly.servlet.MultipartRequest;


//반려식물 수정
@WebServlet("/myplant/update")
public class MyPlantUpdateServlet extends MyHttpServlet {
	private static final long serialVersionUID = 1L;

	private MyPlantService service = new MyPlantService();

	@Override
	public String getServletName() {
		return "MyPlantUpdate";
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 파라메처 name = bardNo
		int myplantNo = Integer.parseInt(req.getParameter("myplantNo"));
		MyPlant myplant = service.findMyPlantByNo(myplantNo, false);
		req.setAttribute("myplant", myplant);
		// jsp연결!
		req.getRequestDispatcher("/views/myplant/update.jsp").forward(req, resp);
	}

	// 1. 파라메터 가져온다.
	// 2. DB CRUD + File 관리★★★★★
	// 3. 결과에 따라 페이지 보내준다. 파라메터와 함께
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// resources에서 upload폴더의 board
			String path = getServletContext().getRealPath("/resources/upload/myplant");
			int maxSize = 104857600; // 100 MB
			String encoding = "UTF-8";
			MultipartRequest mr = new MultipartRequest(req, path, maxSize, encoding, new MyFileRenamePolicy());

			User loginUser = getSessionUser(req);

			// writer = login No랑 다를때 보안상 튕겨낸다.
			if (loginUser == null || loginUser.getuIds().equals(mr.getParameter("writer")) == false) {
				if (loginUser.getuRole().equals("관리자") == false) {
					sendCommonPage("잘못된 접근입니다. (code=201)", "/myplant/list", req, resp);
					return;
				}
			}

			int myplantNo = Integer.parseInt(mr.getParameter("myplantNo"));
			MyPlant myplant = service.findMyPlantByNo(myplantNo, false);

			// 실제 게시물과 Writer_no가 다를때 보안상 튕겨낸다.
//			if (myplant.getuNo().equals(loginUser.getuNo()) == false) {
//				if (loginUser.getuRole().equals("ROLE_ADMIN") == false) {
//					sendCommonPage("잘못된 접근입니다. (code=202)", "/myplant/list", req, resp);
//					return;
//				}
//			}

			// 파라메터 party
			myplant.setMpNo(Integer.parseInt(mr.getParameter("mpNo")));   //식물번호
			myplant.setMpName(mr.getParameter("Name"));					  //내식물이름
			myplant.setMpSctNm(mr.getParameter("SctNm"));                 //품종
			myplant.setMpWatering(mr.getParameter("Watering"));           //물주기기록
			myplant.setMpCreateDate(mr.getParameter("CreateDate"));       //분양날짜
			myplant.setMpFileName(mr.getParameter("FileName"));     	  //첨부파일
			myplant.setRe_mpFileName(mr.getParameter("re_boFileName"));   //첨부파일
			myplant.setuNo(loginUser.getuNo());
			

			// 기존꺼 파일이름
// 			String boFileName = mr.getParameter("boFileName");
			String re_mpFileName = mr.getParameter("re_boFileName");

			// 재업로드
			String ReloadMpFileName = mr.getOriginalFileName("upfile");
			String re_ReloadMpFileName = mr.getFilesystemName("upfile");

			if (ReloadMpFileName != null && ReloadMpFileName.length() > 0) {
				// 파일수정이 있을때
				try {
					File deleteFile = new File(path, re_mpFileName);
					deleteFile.delete();
					System.out.println("renamed_filename : " + re_mpFileName);
				} catch (Exception e) {
				}
				myplant.setMpFileName(ReloadMpFileName);
				myplant.setRe_mpFileName(re_ReloadMpFileName);
			}

			int result = service.save(myplant); // DB에 update

			if (result > 0) {
				sendCommonPage("반려식물이 정상적으로 업데이트 되었습니다.", "/myPage/list", req, resp);
			} else {
				sendCommonPage("반려식물을 업데이트 할수 없습니다!! (code=202)", "/myPage/list", req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
			sendCommonPage("반려식물을 수정할수 없습니다.(code=203)", "/myPage/list", req, resp);
		}
	}
}
