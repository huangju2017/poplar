package com.zr.poplar.util;

import java.util.UUID;

/**
 * 
* Copyright: Copyright (c) 2020 LanRu-Caifu
* @ClassName: UUIDUtils.java
* @Description: 调用该类方法生成随机字符串
* @version: v1.0.0
* @author: 27416
* @date: 2020年6月17日 下午10:56:35
 */
public class UUIDUtils {
	/**
	 * 生成随机id
	 * @return
	 */
	public static String getId() {
		return UUID.randomUUID().toString().replace("-", "").toUpperCase();

	}
	
	/**
	 * 生成随机的激活码
	 * @return
	 */
	public static String getCode() {
		return getId();

	}

}
