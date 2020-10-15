package com.zr.poplar.dao;

import java.util.List;

import com.zr.poplar.pojo.Customer;

/**
 * 用户接口
 * @author ICustomerDao
 *
 */
public interface ICustomerDao {
	/**
	 * 用户注册
	 * @param customer
	 * @return
	 */
	Boolean register(Customer customer);
	
	/**
	 * 用户登录
	 * @param email
	 * @param password
	 * @return
	 */
	Customer login(String email, String password);
	
	/**
	 * 编辑个人资料（根据用户ID修改）
	 * @param customer
	 */
	void changeInfor(Customer customer);
	
	/**
	 * 显示所有客户
	 * @return
	 */
	List<Customer> showAllCustomer();
	
	/**
	 * 根据名字查询客户
	 * @param name
	 * @return
	 */
	Customer findCustomerByName(String name);
	
	/**
	 * 根据昵称/地址/电话号码/邮箱模糊查询用户
	 * @param info
	 * @return
	 */
	List<Customer> findCustomerLike(String info);
}
