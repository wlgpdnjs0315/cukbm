package BoardPkg;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardUpdateServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		response.setContentType("text/html; charset=EUC-KR");

		
		
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter(); 

		
		BoardMgr bMgr = new BoardMgr();
		BoardBean bean = (BoardBean) session.getAttribute("bean");
		String nowPage = request.getParameter("nowPage");
		
		
		BoardBean upBean = new BoardBean();
		
		
		
	
		upBean.setNum(Integer.parseInt(request.getParameter("num")));
		upBean.setType(request.getParameter("type"));
		
		
		
		upBean.setPlace(request.getParameter("place"));
		upBean.setMem_num(Integer.parseInt(request.getParameter("mem_num")));
		//upBean.setGame_date(request.getParameter("game_date"));


		upBean.setTitle(request.getParameter("title"));
		upBean.setContent(request.getParameter("content"));
		

		upBean.setManager(request.getParameter("manager"));
		upBean.setGame_type(request.getParameter("game_type"));
		
		
		
		

		bMgr.updateBoard(upBean);


		String url = "read.jsp?nowPage=" + nowPage + "&num=" + upBean.getNum();
		response.sendRedirect(url);
	}
}