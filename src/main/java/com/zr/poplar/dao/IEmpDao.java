package com.zr.poplar.dao;

import java.util.List;

import com.zr.poplar.pojo.Emp;

/**
 * 员工接口
 * @author IEmpDao
 *
 */
public interface IEmpDao {
	
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
	Boolean deleteEmp(Integer id);
	
	/**
	 * 显示所有员工
	 * @return showAllEmp
	 */
	List<Emp> showAllEmp();

	
}
