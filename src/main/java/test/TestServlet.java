package test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.zr.poplar.dao.IEmpDao;
import com.zr.poplar.dao.IReviewDao;
import com.zr.poplar.dao.impl.EmpDao;
import com.zr.poplar.dao.impl.ReviewDao;
import com.zr.poplar.pojo.Emp;
import com.zr.poplar.pojo.Review;
import com.zr.poplar.service.IEmpService;
import com.zr.poplar.service.impl.EmpService;

public class TestServlet {

	public static void main(String[] args) throws ParseException {

		IEmpService service = new EmpService();
		
		List<Emp> list1 = service.showAllEmp();
		
		System.out.println(list1);

		IEmpDao dao = new EmpDao();

		// 打印所有数据 
		System.out.println(dao.showAllEmp());

		// 添加数据 
		dao.addEmp(new Emp(null,"10010","黄榉","123"));

		// 删除数据 
		dao.deleteEmp("5");

		// 打印所有数据 
		System.out.println(dao.showAllEmp());

		IReviewDao dao2 = new ReviewDao();

		/**
		 * 测试查询
		 */
		List<Review> list = dao2.showAllReview();
		System.out.println(list);

		/**
		 * 测试添加，时间这个有点问题
		 */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date1 = sdf.parse("2008-08-08 12:10:12");
		dao2.addReview(new Review(null, 2, 2, "手机很好用，我很喜欢", date1));
		System.out.println(list);

		/**
		 * 测试删除
		 */

		dao2.deleteAllReview(2);
		System.out.println(list);
	}

}
