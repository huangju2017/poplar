package com.zr.poplar.dao.impl;

import java.util.List;

import com.zr.poplar.dao.ICustomerDao;
import com.zr.poplar.pojo.Customer;

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
		return null;
	}
	
	/**
	 * 用户登录
	 */
	@Override
	public Customer login(String email, String password) {
		return null;
	}
	
	/**
	 * 编辑个人资料（根据用户ID修改）
	 */
	@Override
	public void changeInfor(Customer customer) {

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
