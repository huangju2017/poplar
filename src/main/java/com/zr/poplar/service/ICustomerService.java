package com.zr.poplar.service;

import com.zr.poplar.pojo.Customer;

public interface ICustomerService {
	/**
	 * 用户注册
	 */
	Boolean register(Customer customer);

	/**
	 * 用户登录
	 */
	Customer Login(String email, String password);

	/**
	 * 修改个人信息
	 */
	void changeInfor(Customer customer);

}
