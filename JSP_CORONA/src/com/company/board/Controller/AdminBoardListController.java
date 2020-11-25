package com.company.board.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.board.DAO.IBoardDAO;
import com.company.board.DTO.Board;

/**
 * Servlet implementation class BoardController
 */
@WebServlet(urlPatterns= {"/company/BoardListAdmin","/corona/MainMenu/AdminBoardList"})
public class AdminBoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminBoardListController() {
        super();
        System.out.println("[BoardListController] /BoardList");
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		IBoardDAO dao = new IBoardDAO();
		ArrayList<Board> boardList = dao.select_AdminBoardList();
		/*
		for (int i = 0; i < dao.select_AdminBoardList().size(); i++) {
			System.out.println("getBoard_id :"+dao.select_AdminBoardList().get(i).getBoard_id());
			System.out.println("getBoard_title :"+dao.select_AdminBoardList().get(i).getBoard_title());
			System.out.println("getBoard_content :"+dao.select_AdminBoardList().get(i).getBoard_content());
			System.out.println("getMember_id :"+dao.select_AdminBoardList().get(i).getMember_id());
		}
		*/
		
		request.setAttribute("boardList", boardList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/company/Board/BoardListAdmin.jsp");
		dispatcher.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}