package com.zr.poplar.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.zr.poplar.pojo.Customer;
import com.zr.poplar.pojo.MyOrder;
import com.zr.poplar.pojo.Orderform;
import com.zr.poplar.service.impl.OrderService;

import cn.hutool.core.util.IdUtil;

@SuppressWarnings("serial")
@WebServlet("/orderServlet")
public class OrderServlet extends HttpServlet {

	OrderService service = new OrderService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");

		// 获取请求参数
		String cmd = req.getParameter("cmd");

		if ("queryAllOrder".equals(cmd)) {
			findAllOrder(req, resp);
		} else if ("delOrder".equals(cmd)) {
			delOrderById(req, resp);
		} else if ("addOrder".equals(cmd)) {
			System.out.println("addorder");
			addOrder(req, resp);
		} else if ("showAllOrder".equals(cmd)) {
			showAll(req, resp);
		}
	}

	/**
	 * 卖家可以查看所有的订单
	 * 
	 * @param req
	 * @param resp
	 * @throws IOException
	 * @throws ServletException
	 */
	private void showAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 直接调用查看所有订单的方法
		List<MyOrder> list = service.showAllOrder();
		// 把数据发送到请求作用域中
		req.setAttribute("Orders", list);
		// 转发到订单显示页面
		req.getRequestDispatcher("/MyOrder.jsp").forward(req, resp);

	}

	/**
	 * 结算购物车，生成订单的方法
	 * 
	 * @param req
	 * @param resp
	 * @throws IOException
	 */
	private void addOrder(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		// 获取session中用户的id

		Customer customer = (Customer) req.getSession().getAttribute("customer");
		Integer customerId = customer.getCustomerId();
		String orderNumber = OrderServlet.uuid();
		// 成单时间
		Date date = new Date();
//		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		String creatTime = dateFormat.format(date);
		// 获取购物车商品信息
		double total_price = 0;
		int goodscount = 0;
		int goodsid = 0;
		int shoppingcar = 0;
		String orlist = req.getParameter("data");
		JSONArray jArray = new JSONArray(orlist);

		for (int i = 0; i < jArray.length(); i++) {
			JSONObject object = jArray.getJSONObject(i);
			total_price = object.getDouble("total_price");
			goodscount = object.getInt("goodscount");
			goodsid = object.getInt("goodsid");
			shoppingcar = object.getInt("shoppingcar");
			Orderform orderform = new Orderform(null, orderNumber, goodscount, total_price, customerId, goodsid, "已支付", date);
			boolean addOrder = service.addOrder(orderform);
		}
		
		// 生成随机订单编号

		// 商品数量
		// 商品总价
		// 用户id
		// 商品id
		// 支付状态

		// 封装订单对象

		// 调用添加订单方法

		// 创建一个数据返回前端页面
		Map<String, Object> temp = new HashMap<>();
		temp.put("ok", true);
		JSONObject jsonObject = new JSONObject(temp);
		String re = jsonObject.toString();
		if (re != null) {
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.write(re);
			out.flush();
			out.close();
		}
	}

	/**
	 * 根据订单id删除订单
	 * 
	 * @param req
	 * @param resp
	 * @throws IOException
	 * @throws ServletException
	 */
	private void delOrderById(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 获取订单id
		String string = req.getParameter("orderId");

		Integer id = Integer.parseInt(string);

		// 调用service删除方法
		service.deleteOrder(id);

		// 刷新订单列表
		findAllOrder(req, resp);

	}

	/**
	 * 显示该用户所有订单的功能
	 * 
	 * @param req
	 * @param resp
	 * @throws IOException
	 * @throws ServletException
	 */
	private void findAllOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 获取session中用户的id

		Customer customer = (Customer) req.getSession().getAttribute("customer");
		Integer customerId = customer.getCustomerId();

		// 调用OrderService服务中查询所有订单的方法
		List<MyOrder> list = service.findById(customerId);
		// System.out.println(list);
		// 把数据存储在请求作用域中
		req.setAttribute("myorders", list);
		// 转发到订单显示页面
		req.getRequestDispatcher("/MyOrder.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

	/**
	 * 判断是否为数字的函数
	 * 
	 * @param str
	 * @return
	 */
	public static boolean isNumeric(String str) {
		for (int i = 0; i < str.length(); i++) {
			System.out.println(str.charAt(i));
			if (!Character.isDigit(str.charAt(i))) {
				return false;
			}
		}
		return true;
	}

	/**
	 * 生成一个随机订单编号的方法
	 * 
	 * @return
	 */
	public static String uuid() {

		return IdUtil.randomUUID().toUpperCase().substring(0, IdUtil.randomUUID().toUpperCase().length() - 13);

	}

}
