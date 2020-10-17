package com.zr.poplar.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zr.poplar.pojo.Customer;
import com.zr.poplar.service.ICustomerService;
import com.zr.poplar.service.impl.CustomerService;
@WebServlet("/customerServlet")
@SuppressWarnings("serial")
public class CustomerServlet extends HttpServlet{

	
	public CustomerServlet() {
		
	}
	private String encoding;
	@Override
	public void init() throws ServletException {
		encoding = super.getServletContext().getInitParameter("encoding");

		System.out.println(encoding);
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding(encoding);
		resp.setCharacterEncoding(encoding);
		resp.setContentType("text/html;charset=" + encoding);

		/**
		 * 获取请求参数
		 */
		String cmd = req.getParameter("cmd");
		System.out.println(cmd);
		if ("register".equals(cmd)) {
			System.out.println("进入注册！");
			register(req, resp);
		} else if ("login".equals(cmd)) {
			System.out.println("进入登录");
			login(req, resp);
		}else if ("logout".equals(cmd)) {
			logout(req, resp);
		}else if ("changeInfor".equals(cmd)) {
			changeInfor(req, resp);
		}
	}
	private void changeInfor(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//获取信息
		int id =Integer.parseInt(req.getParameter("id"));
		String registername = req.getParameter("name");
		String registPassword =req.getParameter("password");
		String registEmail = req.getParameter("email");
		int registAge =Integer.parseInt(req.getParameter("age"));
		String registTelephone = req.getParameter("phone");
		String Address = req.getParameter("address");
		String gendar =req.getParameter("gendar");
		
		Customer customer = new Customer(id, registername, registPassword, gendar, registAge, registTelephone, Address, registEmail);
		System.out.println(customer);
		ICustomerService service= new CustomerService();
		Boolean changeInfor = service.changeInfor(customer);
		if (changeInfor) {
			//注册成功
			System.out.println("修改成功");
			logout(req, resp);
			return;
		}
		System.out.println("修改失败");
	}
	private void logout(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		/**
		 * 清除session
		 */
		req.getSession().invalidate();

		/**
		 * 重定向到主页
		 */
		resp.sendRedirect(req.getContextPath());
		
	}
	private void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/**
		 * 获取用户登录的账号和密码
		 */
		String loginEmail = req.getParameter("loginEmail");
		String password = req.getParameter("loginPassword");
		
		ICustomerService service = new CustomerService();
		Customer login = service.login(loginEmail, password);
		if(login ==null) {
			System.out.println("登录失败");
			req.getRequestDispatcher("/userLogin.jsp").forward(req, resp);
			return;
		}
		/**
		 * 登录成功之后, 我们要把该登录的用户存储到session中
		 */
		System.out.println("login:"+login);
		req.getSession().setAttribute("customer", login);
		req.getRequestDispatcher("/index.jsp").forward(req, resp);
		
	}
	private void register(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/**
		 * 获取注册信息
		 */
		String registername = req.getParameter("registName");
		String registPassword =req.getParameter("registPassword");
		String registEmail = req.getParameter("registEmail");
		int registAge =Integer.parseInt(req.getParameter("registAge"));
		String registTelephone = req.getParameter("registTelephone");
		String Address = req.getParameter("registAddress");
		String gendar =req.getParameter("gendar");
		
		Customer customer = new Customer(null, registername, registPassword, gendar, registAge, registTelephone, Address, registEmail);
		System.out.println(customer);
		ICustomerService service= new CustomerService();
		Boolean register = service.register(customer);
		if (register) {
			//注册成功
			System.out.println("注册成功");
			req.getRequestDispatcher("/userLogin.jsp").forward(req, resp);
			return;
		}
		System.out.println("注册失败");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
