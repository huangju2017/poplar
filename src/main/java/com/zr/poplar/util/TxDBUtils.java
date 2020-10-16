package com.zr.poplar.util;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.commons.dbutils.DbUtils;

import com.mchange.v2.c3p0.ComboPooledDataSource;

/**
 * 带有事务功能的连接池工具类<br>
 * 有点AOP(面向切面编程思想)<br>
 * 优点动态代理<br>
 */
public class TxDBUtils {

	/**
	 * 私有化构造方法
	 */
	private TxDBUtils() {

	}

	// 获取到连接池对象(也就是数据源对象)
	private static DataSource source = new ComboPooledDataSource();

	/**
	 * ThreadLocal是本地线程对象<br>
	 * set()方法, 是向ThreadLocal中存入数据<br>
	 * get()方法, 是从ThreadLocal中获取数据<br>
	 * remove()方法, 把对象从ThreadLocal中清除
	 */

	// 做是否开启事务的标记
	private static ThreadLocal<Boolean> isTx_local = new ThreadLocal<Boolean>() {
		@Override
		protected Boolean initialValue() {
			// 设置为false, 说明是没有开启事务
			return false;
		}
	};

	// 保存真实连接的代理连接, 改造close()方法
	private static ThreadLocal<Connection> proxyConn_local = new ThreadLocal<Connection>() {
	};

	// 保存真实的连接
	private static ThreadLocal<Connection> realConn_local = new ThreadLocal<Connection>() {
	};

	/**
	 * 开启事务的方法
	 * 
	 * @throws SQLException
	 */
	public static void startTx() throws SQLException {
		// 这是标记为true
		isTx_local.set(true);

		// 首先获取连接对象, 然后对该连接对象进行处理,
		final Connection connection = source.getConnection();

		// 开启事务, 也就是不自动提交事务
		connection.setAutoCommit(false);

		// 将该连接对象保存到当前线程中
		realConn_local.set(connection);

		// 由于一个事务需要执行多条sql语句, 每个sql执行完毕之后都要关闭连接,
		// 这样的话, 后面的sql就没办法执行了, 所以我们需要改造close(), 使它不关闭连接
		Connection proxyConn = (Connection) Proxy.newProxyInstance(connection.getClass().getClassLoader(),
				connection.getClass().getInterfaces(), new InvocationHandler() {

					@Override
					public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {

						if ("close".equals(method.getName())) {
							return null;
						} else {
							return method.invoke(connection, args);
						}
					}
				});

		proxyConn_local.set(proxyConn);
	}

	/**
	 * 提交事务
	 */
	public static void commit() {
		// 关闭的是代理的connection对象
		DbUtils.commitAndCloseQuietly(proxyConn_local.get());
	}

	/**
	 * 回滚事务
	 */
	public static void rollback() {
		// 回滚的是代理的connection对象
		DbUtils.rollbackAndCloseQuietly(proxyConn_local.get());
	}

	/**
	 * 获取到连接池对象<br>
	 * 如果没有开启过事务, 则返回的就是普通的连接池对象<br>
	 * 如果是开启过事务, 则必须返回一个改造过的getConnection()对象<br>
	 * 
	 * @return
	 */
	public static DataSource getSource() {
		if (isTx_local.get()) {
			// 这里也就是说, 开启了事务
			// 所以, 我们需要改造getConnection()方法
			return (DataSource) Proxy.newProxyInstance(source.getClass().getClassLoader(),
					source.getClass().getInterfaces(), new InvocationHandler() {

						@Override
						public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
							if ("getConnection".equals(method.getName())) {
								return proxyConn_local.get();
							} else {
								return method.invoke(source, args);
							}
						}
					});
		} else {
			// 这里是没有开启事务,
			// 直接过去到普通的连接对象
			return source;
		}
	}

	/**
	 * 释放资源
	 */
	public static void release() {
		// 关闭真实对象的连接
		DbUtils.closeQuietly(realConn_local.get());

		// 把对象和ThreadLocal拆开
		realConn_local.remove();
		proxyConn_local.remove();
		isTx_local.remove();
	}

}
