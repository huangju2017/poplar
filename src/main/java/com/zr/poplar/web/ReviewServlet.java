package com.zr.poplar.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.jdt.internal.compiler.env.IModule.IService;

import com.zr.poplar.pojo.ReviewExt;
import com.zr.poplar.service.IReviewService;
import com.zr.poplar.service.impl.ReviewService;

@WebServlet("/reviewServlet")
@SuppressWarnings("serial")
public class ReviewServlet extends HttpServlet{

	public ReviewServlet(){
		
	}
	
	private String encoding;
	
	@Override
	public void init() throws ServletException {
		encoding = super.getServletContext().getInitParameter("encoding");
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/**
		 * 编码格式
		 */
		req.setCharacterEncoding(encoding);
		resp.setCharacterEncoding(encoding);
		resp.setContentType("text/html;charset=" + encoding);

		String cmd = req.getParameter("cmd");
		System.out.println(cmd);
		
		if ("findreview".equals(cmd)) {
			findreview(req,resp);
		}
	}
	
	/**
	 * 查看所有评论
	 * @param req
	 * @param resp
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void findreview(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		IReviewService service=new ReviewService();
		List<ReviewExt> showAllReview = service.showAllReview();
		System.out.println(showAllReview);
		req.setAttribute("commentList", showAllReview);
		req.getRequestDispatcher("/OA_comment_query.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
