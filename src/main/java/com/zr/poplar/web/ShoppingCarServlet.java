package com.zr.poplar.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.zr.poplar.pojo.Customer;
import com.zr.poplar.pojo.ShoppingCar;
import com.zr.poplar.pojo.ShoppingCarExt;
import com.zr.poplar.service.IShoppingCarSevice;
import com.zr.poplar.service.impl.ShoppingCarService;
import com.zr.poplar.util.UUIDUtils;

@SuppressWarnings("serial")
@WebServlet("/shoppingcarServlet")
public class ShoppingCarServlet extends HttpServlet{

	/**
	 * 空参构造方法
	 */
	public ShoppingCarServlet() {
		
	}
	
	private String encoding;
	
	@Override
	public void init() throws ServletException {

		encoding = super.getServletContext().getInitParameter("encoding");
	
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		req.setCharacterEncoding(encoding);
		resp.setCharacterEncoding(encoding);
		resp.setContentType("text/html;charset="+encoding);
		
		/**
		 * 获取请求参数
		 */
		
		String cmd=req.getParameter("cmd");
		
		if ("addShoppingCar".equals(cmd)) {
			System.out.println("添加购物车");
			addShoppingCar(req,resp);
		}else if ("showShoppingCar".equals(cmd)) {
			System.out.println("显示所有数据");
			showShoppingCar(req,resp);
		}else if ("showShoppingCarValidate".equals(cmd)) {
			System.out.println("验证用户是否登录");
			showShoppingCarValidate(req,resp);
		}else if ("deleteShoppingcar".equals(cmd)) {
			System.out.println("删除购物车");
			deleteShoppingcar(req,resp);
		}
	}
	
	/**
	 * 删除购物车
	 * @param req
	 * @param resp
	 */
	private void deleteShoppingcar(HttpServletRequest req, HttpServletResponse resp) {
		
		Integer id=Integer.parseInt(req.getParameter("goodsId"));
		
		IShoppingCarSevice service= new ShoppingCarService();
		
		Boolean deleteShoppingCar = service.deleteShoppingCar(id);
		
		try {
			PrintWriter out=resp.getWriter();
			
			if (deleteShoppingCar) {
				out.write("{\"success\":true}");
			} else {
				out.write("{\"success\":false}");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 显示所有数据
	 * @param req
	 * @param resp
	 */
	private void showShoppingCarValidate(HttpServletRequest req, HttpServletResponse resp) {
		try {
			Map<String, Object> res = new HashMap<>();
			
			HttpSession session = req.getSession();
			if(session.getAttribute("customer") != null) {
				res.put("success", true);
			}else {
				res.put("success", false);
			}
			JSONObject jsonObject = new JSONObject(res);
			
			
			String re = jsonObject.toString();
			
			if (re != null) {
				resp.setContentType("text/html;charset=UTF-8");
				
				PrintWriter out = resp.getWriter();
				
				out.write(re);
				
				out.flush();
				out.close();
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 显示所有数据
	 * @param req
	 * @param resp
	 * @throws IOException 
	 * @throws ServletException 
	 */
	
	private void showShoppingCar(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		Customer customer= (Customer) req.getSession().getAttribute("customer");;
		/*
		 * System.out.println("customer:"+customer); Map<String, Object> temp = new
		 * HashMap<>(); if (customer==null) { System.out.println("请先登录");
		 * temp.put("success", false); JSONObject jsonObject = new JSONObject(temp);
		 * String re = jsonObject.toString();
		 * 
		 * if (re != null) { resp.setContentType("text/html;charset=UTF-8"); PrintWriter
		 * out; try { out = resp.getWriter(); out.write(re); out.flush(); out.close(); }
		 * catch (IOException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); }
		 * 
		 * } return; }
		 */
		
		int customerId=customer.getCustomerId();
		IShoppingCarSevice service= new ShoppingCarService();
		List<ShoppingCarExt> showShoppingCars = service.showShoppingCar(customerId);
		System.out.println("showShoppingCars:"+showShoppingCars);
		req.setAttribute("showShoppingCars", showShoppingCars);
		req.getRequestDispatcher("/shoppingcar.jsp").forward(req, resp);
		
		/*
		 * if (showShoppingCars==null) { temp.put("success", true); }
		 */
		/*
		 * JSONObject jsonObject = new JSONObject(temp);
		 * 
		 * 
		 * String re = jsonObject.toString();
		 * 
		 * if (re != null) { resp.setContentType("text/html;charset=UTF-8"); PrintWriter
		 * out; try { out = resp.getWriter(); out.write(re); out.flush(); out.close(); }
		 * catch (IOException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); }
		 * 
		 * }
		 */
	}
	/**
	 * 添加购物车
	 * @param req
	 * @param resp
	 * @throws IOException 
	 * @throws ServletException 
	 */
	
	private void addShoppingCar(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//商品数量
		int shoppingcarSum = Integer.parseInt(req.getParameter("count"));
		//商品小计
		double sumGoodsnumber = Double.parseDouble(req.getParameter("sum"));
		
		System.out.println(shoppingcarSum);
		System.out.println(sumGoodsnumber);
		
		//商品id
		int goodsId=Integer.parseInt(req.getParameter("goodsid"));
		System.out.println(goodsId);
		
		//从session中拿到customer对象
//		Ht tpSession session = req.getSession(false);
//		Customer customer = (Customer)session.getAttribute("customer");
		
		//用户id
		Customer customer= (Customer) req.getSession().getAttribute("customer");;
		System.out.println("customer:"+customer);
		Map<String, Object> temp = new HashMap<>();
		if (customer==null) {
			System.out.println("请先登录");
			temp.put("success", false);
			JSONObject jsonObject = new JSONObject(temp);
			String re = jsonObject.toString();
			
			if (re != null) {
				resp.setContentType("text/html;charset=UTF-8");
				PrintWriter out;
				try {
					out = resp.getWriter();
					out.write(re);
					out.flush();
					out.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			return;
		}
		int customerId=customer.getCustomerId();
		
		
		
		System.out.println("cus");
		//订单编号
		String orderId = UUIDUtils.getCode();
		//购物车实体类封装数据
		ShoppingCar shoppingCar=new ShoppingCar(null, goodsId, customerId, shoppingcarSum, sumGoodsnumber, orderId);
		
		//调用购物车的service方法
		IShoppingCarSevice service=new ShoppingCarService();
		Boolean addShoppingCar = service.addShoppingCar(shoppingCar);
		
		
		if (addShoppingCar) {
			temp.put("success", true);
		} 
		JSONObject jsonObject = new JSONObject(temp);
		
		
		String re = jsonObject.toString();
		
		if (re != null) {
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter out;
			try {
				out = resp.getWriter();
				out.write(re);
				out.flush();
				out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
	}
}
