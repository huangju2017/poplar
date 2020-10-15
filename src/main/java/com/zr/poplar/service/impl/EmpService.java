package com.zr.poplar.service.impl;

import java.util.List;

import com.zr.poplar.dao.IEmpDao;
import com.zr.poplar.dao.impl.EmpDao;
import com.zr.poplar.pojo.Emp;
import com.zr.poplar.service.IEmpService;

/**
 * 员工实现类
 * @author EmpService
 *
 */
public class EmpService implements IEmpService{
	
	/**
	 * 数据实现层
	 */
	IEmpDao dao = new EmpDao();
	
	/**
	 * 添加员工
	 */
	@Override
	public Boolean addEmp() {
		return dao.addEmp();
	}
	
	/**
	 * 删除用户
	 */
	@Override
	public Boolean deleteEmp(Emp emp) {
		return dao.deleteEmp(emp);
	}
	/**
	 * 显示所有员工
	 */
	@Override
	public List<Emp> showAllEmp() {
		return dao.showAllEmp();
	}

}
