package com.zr.poplar.service.impl;

import java.util.List;


import com.zr.poplar.dao.IRootDao;
import com.zr.poplar.dao.impl.RootDao;
import com.zr.poplar.pojo.Emp;
import com.zr.poplar.pojo.Root;
import com.zr.poplar.service.IRootService;

public class RootService implements IRootService{

	/**
	 * 数据实现层
	 */
	IRootDao dao = new RootDao();
	
	/**
	 * 管理员登录
	 */
	@Override
	public Root rootLogin(String rootName, String rootPassword) {
		return dao.rootLogin(rootName,rootPassword);
	}

	/**
	 * 添加员工
	 */
	@Override
	public Boolean addEmp(Emp emp) {
		return dao.addEmp(emp);
	}
	
	/**
	 * 删除用户
	 */
	@Override
	public Boolean deleteEmp(String id) {
		return dao.deleteEmp(id);
	}
	/**
	 * 显示所有员工
	 */
	@Override
	public List<Emp> showAllEmp() {
		return dao.showAllEmp();
	}

	
	
}
