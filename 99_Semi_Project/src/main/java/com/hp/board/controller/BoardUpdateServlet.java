package com.hp.board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.board.model.service.BoardService;
import com.hp.board.model.vo.Board;
import com.hp.common.util.MyFileRenamePolicy;
import com.hp.common.util.MyHttpServlet;
import com.hp.user.model.vo.User;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/board/update")
public class BoardUpdateServlet extends MyHttpServlet {
	private static final long serialVersionUID = 1L;

	private BoardService service = new BoardService();

	@Override
	public String getServletName() {
		return "BoardUpdate";
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int boardNo = Integer.parseInt(req.getParameter("boardNo"));
		Board board = service.findBoardByNo(boardNo, false);
		req.setAttribute("board", board);
		req.getRequestDispatcher("/views/html/3_boardupdate.jsp").forward(req, resp);
	}

	// 1. 파라메터 가져온다.
	// 2. DB CRUD + File 관리★★★★★
	// 3. 결과에 따라 페이지 보내준다. 파라메터와 함께
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// resources에서 upload폴더의 board
			String path = getServletContext().getRealPath("/resources/upload/board");
			int maxSize = 104857600; // 100 MB
			String encoding = "UTF-8";
			MultipartRequest mr = new MultipartRequest(req, path, maxSize, encoding, new MyFileRenamePolicy());

			User loginUser = getSessionUser(req);

			int boardNo = Integer.parseInt(mr.getParameter("boardNo"));
			Board board = service.findBoardByNo(boardNo, false);

			// 실제 게시물과 uIds가 다를때 보안상 튕겨낸다.
			if (board.getuIds().equals(loginUser.getuIds()) == false) {
				if (loginUser.getuRole().equals("관리자") == false) {
					sendCommonPage("잘못된 접근입니다. (code=202)", "/board/list", req, resp);
					return;
				}
			}

			board.setBoNo(Integer.parseInt(mr.getParameter("boardNo")));
			board.setBoTitle(mr.getParameter("title"));
			board.setuIds(loginUser.getuIds());
			board.setuNo(loginUser.getuNo());
			board.setBoCont(mr.getParameter("content"));

			// 기존꺼 파일이름
//			String boFileName = mr.getParameter("boFileName");
			String re_boFileName = mr.getParameter("re_boFileName");

			// 재업로드
			String ReloadBoFileName = mr.getOriginalFileName("upfile");
			String renamedBoFileName = mr.getFilesystemName("upfile");

			if (ReloadBoFileName != null && ReloadBoFileName.length() > 0) {
				// 파일수정이 있을때
				try {
					File deleteFile = new File(path, re_boFileName);
					deleteFile.delete();
					System.out.println("renamed_filename : " + re_boFileName);
				} catch (Exception e) {
				}
				board.setBoFileName(ReloadBoFileName);
				board.setRe_boFileName(renamedBoFileName);
			}

			int result = service.save(board); // DB에 update

			if (result > 0) {
				sendCommonPage("게시글이 정상적으로 업데이트 되었습니다.", "/board/list", req, resp);
			} else {
				sendCommonPage("게시글을 업데이트 할수 없습니다!! (code=202)", "/board/list", req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
			sendCommonPage("게시글을 수정할수 없습니다.(code=203)", "/board/list", req, resp);
		}
	}
}