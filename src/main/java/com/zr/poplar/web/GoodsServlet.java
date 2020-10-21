package com.zr.poplar.web;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import com.zr.poplar.pojo.Goods;
import com.zr.poplar.service.IGoodsService;
import com.zr.poplar.service.impl.GoodsService;

@SuppressWarnings("serial")
@WebServlet("/goods")
public class GoodsServlet extends HttpServlet {

	/**
	 * 空参构造方法
	 */
	public GoodsServlet() {

	}

	private String encoding;
	IGoodsService service = new GoodsService();

	@Override
	public void init() throws ServletException {
		encoding = super.getServletContext().getInitParameter("encoding");
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
		if ("addGoods".equals(cmd)) {
			addGoods(req, resp);
		} else if ("deleteGoods".equals(cmd)) {
			deleteGoods(req, resp);
		} else if ("showAllGoods".equals(cmd)) {
			showAllGoods(req, resp);
		} else if ("findGoodsByName".equals(cmd)) {
			findGoodsByName(req, resp);
		} else if ("changeGoods".equals(cmd)) {
			changeGoods(req, resp);
		} else if ("lowerOrUpper".equals(cmd)) {
			lowerOrUpper(req, resp);
		} else if ("productpage".equals(cmd)) {
			productpage(req, resp);
		} else if ("showSort".equals(cmd)) {
			showSort(req, resp);
		}else if("showGoods".equals(cmd)) {
			showGoods(req,resp);
		}
	}

	private void showGoods(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Integer gid = Integer.valueOf(req.getParameter("goodsId"));
		System.out.println(gid);
		Goods goods = service.showGoods(gid);
		HttpSession session = req.getSession();
		session.setAttribute("goodsById",goods );
	}

	private void showSort(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Integer kind = Integer.valueOf(req.getParameter("kind"));
		List<Goods> showSort = null;
		if (kind == 1) {
			showSort = service.showSort("手机");
			req.setAttribute("showSort", showSort);
			req.getRequestDispatcher("showPhones.jsp").forward(req, resp);
		} else if (kind == 2) {
			showSort = service.showSort("电脑");
			req.setAttribute("showSort", showSort);
			req.getRequestDispatcher("showPCs.jsp").forward(req, resp);
		} else if (kind == 3) {
			showSort = service.showSort("化妆品");
			req.setAttribute("showSort", showSort);
			req.getRequestDispatcher("showCosmetics.jsp").forward(req, resp);
		} else if (kind == 4) {
			showSort = service.showSort("服装");
			req.setAttribute("showSort", showSort);
			req.getRequestDispatcher("showCloths.jsp").forward(req, resp);
		}
	}

	/**
	 * 根据id 获取该商品的信息
	 * 
	 * @param req
	 * @param resp
	 * @throws IOException
	 * @throws ServletException
	 */

	private void productpage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Integer goodsId = Integer.valueOf(req.getParameter("goodsId"));
		Goods productpage = service.productpage(goodsId);
		req.setAttribute("productpage", productpage);
		req.getRequestDispatcher("productpage.jsp").forward(req, resp);
	}

	/**
	 * 商品上架和下架
	 * 
	 * @param req
	 * @param resp
	 * @throws IOException
	 * @throws ServletException
	 */
	private void lowerOrUpper(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String sel = req.getParameter("sel");
		Integer gid = Integer.valueOf(req.getParameter("goodsId"));
		Boolean flag = service.lowerOrUpper(sel, gid);
		System.out.println(flag);
		if (flag)
			showAllGoods(req, resp);
	}

	/**
	 * 修改商品
	 * 
	 * @param req
	 * @param resp
	 */
	private void changeGoods(HttpServletRequest req, HttpServletResponse resp) {
		try {
			String goodsName = req.getParameter("gname1");
			Double goodsPrice = Double.valueOf(req.getParameter("gprice1"));
			Integer goodsNumber = Integer.valueOf(req.getParameter("gcount1"));
			String goods_Class = req.getParameter("gtype1");
			String goodsContent = req.getParameter("gdes1");
			Integer goodsId = Integer.valueOf(req.getParameter("goodsID1"));
			String goodsType = null;

			if ("1".equals(goods_Class)) {
				goodsType = "电脑";
			} else if ("2".equals(goods_Class)) {
				goodsType = "手机";
			} else if ("3".equals(goods_Class)) {
				goodsType = "服装";
			} else if ("4".equals(goods_Class)) {
				goodsType = "化妆品";
			} else {
				goodsType = "其他";
			}
			Goods goods = new Goods(goodsId, goodsName, goodsPrice, goodsNumber, goodsType, null, goodsContent, null,
					null);
			Boolean flag = service.changeGoods(goods);
			if (flag)
				showAllGoods(req, resp);
		} catch (

		Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * 根据商品名模糊查询商品
	 * 
	 * @param req
	 * @param resp
	 * @throws IOException
	 * @throws ServletException
	 */
	private void findGoodsByName(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String name = req.getParameter("shop");
		System.out.println(name);
		List<Goods> goods1 = service.findGoodsByName(name);
		System.out.println(goods1);
		req.setAttribute("goodsList", goods1);
		req.getRequestDispatcher("goodsSearch.jsp").forward(req, resp);
	}

	/**
	 * 显示
	 * 
	 * @param req
	 * @param resp
	 * @throws IOException
	 * @throws ServletException
	 */
	private void showAllGoods(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String flag = req.getParameter("flag");
		System.out.println("falg：" + flag);
		List<Goods> goods = service.showAllGoods();
		HttpSession session = req.getSession();
		session.setAttribute("goods", goods);
		System.out.println(goods);
		if (flag.equals("1"))
			resp.sendRedirect("index.jsp");
		else
			req.getRequestDispatcher("OA_goods_query.jsp").forward(req, resp);

	}

	/**
	 * 删除商品
	 * 
	 * @param req
	 * @param resp
	 * @throws IOException
	 * @throws ServletException
	 */
	private void deleteGoods(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String[] gID = req.getParameterValues("com");
		Integer gid = 0;
		Boolean flag=false;
		for (String string : gID) {
			gid = (Integer.parseInt(string));
			flag = service.deleteGoods(gid);
		}
		if (flag)
			showAllGoods(req, resp);

	}

	/**
	 * 添加商品
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	private Goods addGoods(HttpServletRequest req, HttpServletResponse resp) {

		/**
		 * 我们就可以通过req.getInputStream()的方法获取到请求中的流对象
		 */

		String savePath = req.getServletContext().getRealPath("formData");

		if (savePath != null) {
			String goodsName = null;
			Double goodsPrice = 0.0;
			Integer goodsNumber = 0;
			String goodsType = null;
			String goodsContent = null;
			String fileName = null;
			/**
			 * 是上传文件的对象, 就需要做文件上传前的准备工作<br>
			 */
			// 获取到磁盘上文件条目列表对象
			DiskFileItemFactory factory = new DiskFileItemFactory();

			factory.setSizeThreshold(1024 * 1024);

			// 创建文件上传对象
			ServletFileUpload upload = new ServletFileUpload(factory);

			/**
			 * 设定上传文件的大小:<br>
			 * 设定单个文件的大小, 设定上传文件的总大小等等<br>
			 */
			// 设置单个文件的总大小
			upload.setFileSizeMax(1024 * 1024);
			// 设置上传文件的总大小
			upload.setSizeMax(1024 * 1024 * 10);
			try {
				/**
				 * 解析请求, 获取到文件条目对象, 说白了, 就是解析请求中有多少上传的文件
				 */
				List<FileItem> list = upload.parseRequest(req);

				/**
				 * 迭代每一个对象, 判断是普通字段, 还是文件类型字段
				 */
				for (FileItem item : list) {
					// isFormField(): 判断获取的字段是什么类型
					// true: 表示普通字段类型
					// false: 表示文件字段类型
					if (item.isFormField()) {
						/**
						 * 这里就是普通字段类型
						 */
						// 获取请求参数名
						String nickname = item.getFieldName();
						// 获取商品名
						if (nickname.equals("goods_Name")) {
							goodsName = item.getString("utf-8");
							System.out.println(goodsName);
							// 获取商品单价
						} else if (nickname.equals("mall_price")) {
							goodsPrice = Double.valueOf(item.getString());

							// 获取商品数量
						} else if (nickname.equals("goods_Number")) {
							goodsNumber = Integer.valueOf(item.getString());

							// 获取商品类型
						} else if (nickname.equals("goods_Class")) {
							goodsType = item.getString("utf-8");
							System.out.println("goodsType" + goodsType);
							// 获取商品描述
						} else if (nickname.equals("describes")) {
							goodsContent = item.getString("utf-8");
						}
						/**
						 * 细节问题: 在处理中文请求的时候, 会出现乱码, <br>
						 * 即使使用了: req.setCharacterEncoding("utf-8"); 也是不能解决的<br>
						 * 
						 * 所以, 我们在getString的时候, 可以显式的指定编码
						 */
						// 获取请求参数值
						// String value = item.getString();
						String value = item.getString("utf-8");

						System.out.println(nickname + "-----" + value);
					} else {
						/**
						 * 文件类型
						 */

						// 获取到文件的名称, 带后缀
						fileName = item.getName();
						System.out.println("fileName: " + fileName);

						/**
						 * 细节问题: getName方法, 如果是使用的google浏览器, 则获取到其文件名称 : girl.jpg<br>
						 * 如果是ie浏览器, 则获取的是文件的全名称, 需要重点注意: fileName: C:\Users\admin\Desktop\girl.jpg<br>
						 */

						/**
						 * FilenameUtils是处理文件名的工具类
						 */
						fileName = FilenameUtils.getName(fileName);
						System.out.println(fileName);

						/**
						 * 如果不同的人上传了相同名称的文件, 我们是不应该把别人的文件给覆盖的<br>
						 * 所以有两种解决方案:<br>
						 * 第一种: 不同的人上传的文件, 都放在不同的目录中<br>
						 * 第二种: 不同的人上传的文件的名称都是不同的<br>
						 */

						/*
						 * // 获取到文件的后缀 String extension = FilenameUtils.getExtension(fileName); <br>//
						 * 设计文件的新名称 fileName = UUID.randomUUID() + "." + extension;
						 */
						// String path = req.getServletContext().getRealPath("/image");
						// String realPath = this.getClass().getResource("").getPath();
						// System.out.println(path);
						String path = "D:\\zr\\eclipse\\poplar\\src\\main\\webapp" + File.separator + "image";
						File dir = new File(path);

						if (!dir.exists()) {
							dir.mkdirs();
						}

						// 根据文件名, 创建出对象
						File file = new File(dir, fileName);

						// 写出文件对象
						item.write(file);

					}

				}
				// 获取当前
				Date date = new Date();
				SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
				simple.format(date);
				Goods goods = new Goods(null, goodsName, goodsPrice, goodsNumber, goodsType, fileName, goodsContent,
						"未上架", date);

				Boolean addGoods = service.addGoods(goods);
				if (addGoods) {
					System.out.println("上架成功");
					return goods;
					// resp.setHeader("refresh", "0;url=/popular/OA_goods_query");

				} else {
					System.out.println("失败");
				}

			} catch (FileUploadException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
