package com.zr.poplar.service;

import java.util.List;

import com.zr.poplar.pojo.Emp;
import com.zr.poplar.pojo.Root;

public interface IRootService {

	
	/**
	 * 员工登录
	 * @param email
	 * @param password
	 * @return
	 */
	Root rootLogin(String rootName, String rootPassword);
	
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
