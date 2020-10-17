package com.zr.poplar.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.zr.poplar.dao.ICustomerDao;
import com.zr.poplar.pojo.Customer;
import com.zr.poplar.util.TxDBUtils;

/**
 * 用户实现类
 * @author CustomerDao
 *
 */
public class CustomerDao implements ICustomerDao {
	
	/**
	 * 用户注册
	 */
	@Override
	public Boolean register(Customer customer) {
		String sql="insert into customer values(null,?,?,?,?,?,?,?)";
		try {
			QueryRunner runner = new QueryRunner(TxDBUtils.getSource());
			int line = runner.update(sql, customer.getCustomerName(),customer.getPassword(),customer.getGendar(),customer.getAge(),customer.getPhone(),customer.getAddress(),customer.getEmail());
			if (line > 0) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("用户注册dao报错");
//			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 用户登录
	 */
	@Override
	public Customer login(String email, String password) {
		String sql="select * from customer where email =? and password =?";
		QueryRunner runner = new QueryRunner(TxDBUtils.getSource());
		try {
			Customer query = runner.query(sql, new BeanHandler<Customer>(Customer.class),email,password);
			System.out.println("query:"+query);
			if (query!=null) {
				
				return query;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
	
	/**
	 * 编辑个人资料（根据用户ID修改）
	 * @return 
	 */
	@Override
	public boolean changeInfor(Customer customer) {
		String sql="update customer set  customerName=?,password=?,gendar=?,age=?,phone=?,address=?,email=? where customerId=?";
		try {
			QueryRunner runner = new QueryRunner(TxDBUtils.getSource());
			int line = runner.update(sql, customer.getCustomerName(),customer.getPassword(),customer.getGendar(),customer.getAge(),customer.getPhone(),customer.getAddress(),customer.getEmail(),customer.getCustomerId());
			if (line > 0) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("用户注册dao报错");
//			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 显示所有客户
	 */
	@Override
	public List<Customer> showAllCustomer() {
		return null;
	}
	
	/**
	 * 根据名字查询客户
	 */
	@Override
	public Customer findCustomerByName(String name) {
		return null;
	}
	
	/**
	 * 根据昵称/地址/电话号码/邮箱模糊查询用户
	 */
	@Override
	public List<Customer> findCustomerLike(String info) {
		return null;
	}

}
