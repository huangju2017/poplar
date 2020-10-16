package com.zr.poplar.service;

import java.util.List;

import com.zr.poplar.pojo.Emp;

/**
 * 员工接口
 * @author IEmpDao
 *
 */
public interface IEmpService {
	
	/**
	 * 员工登录
	 * @param email
	 * @param password
	 * @return
	 */
	Emp empLogin(String empNumber, String empPassword);
	
	/**
	 * 添加员工
	 * @return addEmp
	 */
	Boolean addEmp(Emp emp);
	
	/**
	 * 删除员工
	 * @param deleteEmp
	 * @return
	 */
	Boolean deleteEmp(String id);
	
	/**
	 * 显示所有员工
	 * @return showAllEmp
	 */
	List<Emp> showAllEmp();
}
