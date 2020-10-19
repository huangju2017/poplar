package com.zr.poplar.web;

import java.io.IOException;
import java.io.Serializable;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zr.poplar.pojo.Customer;
import com.zr.poplar.pojo.Emp;
import com.zr.poplar.service.ICustomerService;
import com.zr.poplar.service.IEmpService;
import com.zr.poplar.service.impl.CustomerService;
import com.zr.poplar.service.impl.EmpService;

@SuppressWarnings("serial")
@WebServlet("/empServlet")
public class EmpServlet extends HttpServlet{
	
	/**
	 * 实现UserServicr类
	 */
	IEmpService emp = new EmpService();

	/**
	 * 无参构造方法
	 */

	public EmpServlet() {

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
		
		if ("empLogin".equals(cmd)) {
			empLogin(req,resp);
		}else if ("deleteEmp".equals(cmd)) {
			deleteEmp(req,resp);
		}else if ("showAllEmp".equals(cmd)) {
			showAllEmp(req,resp);
		}
		
		
	}
	

	
	private void empLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String empNumber = req.getParameter("empNumber");
		String empPassword = req.getParameter("empPassword");

		Serializable login = emp.empLogin(empNumber, empPassword);

		if (login == null) {
			req.setAttribute("login_msg", "账号或密码有误，请检查登录");
			req.getRequestDispatcher("/sellerLogin.jsp").forward(req, resp);
			return;
		}
			req.getSession().setAttribute("emp", login);
//			showAllEmp(req, resp);O
			req.getRequestDispatcher("/OA_goods_query.jsp").forward(req, resp);
		
	}

	private void showAllEmp(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		List<Emp> list = emp.showAllEmp();
		req.setAttribute("emp1", list);
		System.out.println(list);
		req.getRequestDispatcher("/OA_YiYi_index.jsp").forward(req, resp);
	}

	private void deleteEmp(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String id = req.getParameter("id");
		emp.deleteEmp(id);
		showAllEmp(req, resp);
		
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
