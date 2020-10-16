package com.zr.poplar.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.zr.poplar.dao.IEmpDao;
import com.zr.poplar.pojo.Customer;
import com.zr.poplar.pojo.Emp;
import com.zr.poplar.util.TxDBUtils;

/**
 * 员工实现类
 * @author EmpService
 *
 */
public class EmpDao implements IEmpDao{
	
	/**
	 * 调用工具类
	 */
	QueryRunner runner = new QueryRunner(TxDBUtils.getSource());
	/**
	 * 添加员工
	 */
	@Override
	public Boolean addEmp(Emp emp) {
		String sql = "insert into emp values(null,?,?,?)";
		
		try {
			int lint = runner.update(sql,emp.getEmpNumber(),emp.getEmpName(),emp.getEmpPassword());
			if (lint>0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 删除用户
	 */
	@Override
	public Boolean deleteEmp(String id) {
		String sql = "delete from emp where empid = ?";
		
		try {
			runner.update(sql,id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 显示所有员工
	 */
	@Override
	public List<Emp> showAllEmp() {
		String sql = "select * from emp";
		
		try {
			return runner.query(sql, new BeanListHandler<Emp>(Emp.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Emp empLogin(String empNumber, String empPassword) {
		String sql = "select * from emp where empNumber = ? and empPassword = ?";
		
		try {
			return runner.query(sql, new BeanHandler<Emp>(Emp.class), empNumber,empPassword);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

}
