package com.zr.poplar.service.impl;

import com.zr.poplar.dao.ICustomerDao;
import com.zr.poplar.dao.impl.CustomerDao;
import com.zr.poplar.pojo.Customer;
import com.zr.poplar.service.ICustomerService;

public class CustomerService implements ICustomerService {

	/**
	 * 数据实现层
	 */
	ICustomerDao dao = new CustomerDao();

	@Override
	public Boolean register(Customer customer) {
		return dao.register(customer);
	}

	@Override
	public Customer Login(String email, String password) {
		return dao.login(email,password);
	}

	@Override
	public void changeInfor(Customer customer) {
		dao.changeInfor(customer);
	}

}
