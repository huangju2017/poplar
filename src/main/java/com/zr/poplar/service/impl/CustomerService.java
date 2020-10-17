package com.zr.poplar.service.impl;

import java.util.List;

import com.zr.poplar.dao.ICustomerDao;
import com.zr.poplar.dao.impl.CustomerDao;
import com.zr.poplar.pojo.Customer;
import com.zr.poplar.service.ICustomerService;

public class CustomerService implements ICustomerService {

	/**
	 * 数据实现层
	 */
	ICustomerDao dao = new CustomerDao();

	/**
	 * 用户注册
	 */
	@Override
	public Boolean register(Customer customer) {
		return dao.register(customer);
	}
	
	/**
	 * 用户登录
	 */
	@Override
	public Customer login(String email, String password) {
		return dao.login(email, password);
	}
	
	/**
	 * 编辑个人资料（根据用户ID修改）
	 */
	@Override
	public boolean changeInfor(Customer customer) {
		return dao.changeInfor(customer);
	}
	
	/**
	 * 显示所有客户
	 */
	@Override
	public List<Customer> showAllCustomer() {
		return dao.showAllCustomer();
	}
	
	/**
	 * 根据名字查询客户
	 */
	@Override
	public Customer findCustomerByName(String name) {
		return dao.findCustomerByName(name);
	}
	
	/**
	 * 根据昵称/地址/电话号码/邮箱模糊查询用户
	 */
	@Override
	public List<Customer> findCustomerLike(String info) {
		return dao.findCustomerLike(info);
	}

}
