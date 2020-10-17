package com.zr.poplar.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zr.poplar.pojo.Emp;
import com.zr.poplar.pojo.Root;
import com.zr.poplar.service.IRootService;
import com.zr.poplar.service.impl.RootService;

@SuppressWarnings("serial")
@WebServlet("/rootServlet")
public class AdminServlet extends HttpServlet{
	
	/**
	 * 实现RootService类
	 */
	IRootService root = new RootService();
	
	/**
	 * 无参构造方法
	 */
	public AdminServlet() {
		
	}
	
	private String encoding;

	/**
	 * 全局格式utf-8
	 */
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
		
		/**
		 * 获取请求参数
		 */
		String cmd = req.getParameter("cmd");
		System.out.println(cmd);
		
		if ("rootLogin".equals(cmd)) {
			rootLogin(req,resp);
		}else if ("deleteEmp".equals(cmd)) {
			deleteEmp(req,resp);
		}else if ("showAllEmp".equals(cmd)) {
			showAllEmp(req,resp);
		}else if ("addEmp".equals(cmd)) {
			addEmp(req,resp);
		}
		
	}
	
	private void addEmp(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		String empNumber = req.getParameter("empNumber");
		String empName = req.getParameter("empName");
		String empPassword = req.getParameter("empPassword");
		
		System.out.println(empNumber);
		Emp emp = new Emp(null, empNumber, empName, empPassword);
		
		Boolean lint = root.addEmp(emp);
		
		if (lint) {
			resp.getWriter().write("添加成功");
			showAllEmp(req, resp);
			req.getRequestDispatcher("/OA_YiYi_index1.jsp").forward(req, resp);
		}else {
			req.setAttribute("register_msg", "添加失败，请检查数据");
			
		}
	}

	private void showAllEmp(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		List<Emp> list = root.showAllEmp();
		req.setAttribute("root", list);
		System.out.println(list);
	}

	private void deleteEmp(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String id = req.getParameter("id");
		root.deleteEmp(id);
		showAllEmp(req, resp);
		req.getRequestDispatcher("/OA_YiYi_index1.jsp").forward(req, resp);
	}

	private void rootLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String rootName = req.getParameter("rootName");
		String rootPassword = req.getParameter("rootPassword");
		System.out.println(rootName);
		System.out.println(rootPassword);
		Root login = root.rootLogin(rootName,rootPassword);
		System.out.println(login);
		if (login == null) {
			req.setAttribute("login_msg", "账号或密码有误，请检查登录");
			req.getRequestDispatcher("/OA_adminLogin1.jsp.jsp").forward(req, resp);
			return;
		}
			req.getSession().setAttribute("root1", login);
			showAllEmp(req, resp);
			req.getRequestDispatcher("/OA_YiYi_index1.jsp").forward(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}