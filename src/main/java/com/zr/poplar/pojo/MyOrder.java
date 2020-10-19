package com.zr.poplar.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * 这是客户查看订单需要用到的实体类
 *
 */

public class MyOrder implements Serializable{
		
	private static final long serialVersionUID = 1L;
	
	private Integer orderId ; // 订单id
	private String  orderNumber ;  //订单编号
	private String  goodsName ;     //商品名称
	private Double  goodsPrice ;    //商品单价
	private Integer orderGoodsCount ;   //订单商品数量
	private String  payStatus ;         //支付状态
	private Date    createTime ;        //成单时间
	
	public MyOrder() {
		// TODO Auto-generated constructor stub
	}

	public MyOrder(Integer orderId, String orderNumber, String goodsName, Double goodsPrice, Integer orderGoodsCount,
			String payStatus, Date createTime) {
		super();
		this.orderId = orderId;
		this.orderNumber = orderNumber;
		this.goodsName = goodsName;
		this.goodsPrice = goodsPrice;
		this.orderGoodsCount = orderGoodsCount;
		this.payStatus = payStatus;
		this.createTime = createTime;
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public Double getGoodsPrice() {
		return goodsPrice;
	}

	public void setGoodsPrice(Double goodsPrice) {
		this.goodsPrice = goodsPrice;
	}

	public Integer getOrderGoodsCount() {
		return orderGoodsCount;
	}

	public void setOrderGoodsCount(Integer orderGoodsCount) {
		this.orderGoodsCount = orderGoodsCount;
	}

	public String getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((createTime == null) ? 0 : createTime.hashCode());
		result = prime * result + ((goodsName == null) ? 0 : goodsName.hashCode());
		result = prime * result + ((goodsPrice == null) ? 0 : goodsPrice.hashCode());
		result = prime * result + ((orderGoodsCount == null) ? 0 : orderGoodsCount.hashCode());
		result = prime * result + ((orderId == null) ? 0 : orderId.hashCode());
		result = prime * result + ((orderNumber == null) ? 0 : orderNumber.hashCode());
		result = prime * result + ((payStatus == null) ? 0 : payStatus.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MyOrder other = (MyOrder) obj;
		if (createTime == null) {
			if (other.createTime != null)
				return false;
		} else if (!createTime.equals(other.createTime))
			return false;
		if (goodsName == null) {
			if (other.goodsName != null)
				return false;
		} else if (!goodsName.equals(other.goodsName))
			return false;
		if (goodsPrice == null) {
			if (other.goodsPrice != null)
				return false;
		} else if (!goodsPrice.equals(other.goodsPrice))
			return false;
		if (orderGoodsCount == null) {
			if (other.orderGoodsCount != null)
				return false;
		} else if (!orderGoodsCount.equals(other.orderGoodsCount))
			return false;
		if (orderId == null) {
			if (other.orderId != null)
				return false;
		} else if (!orderId.equals(other.orderId))
			return false;
		if (orderNumber == null) {
			if (other.orderNumber != null)
				return false;
		} else if (!orderNumber.equals(other.orderNumber))
			return false;
		if (payStatus == null) {
			if (other.payStatus != null)
				return false;
		} else if (!payStatus.equals(other.payStatus))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "MyOrder [orderId=" + orderId + ", orderNumber=" + orderNumber + ", goodsName=" + goodsName
				+ ", goodsPrice=" + goodsPrice + ", orderGoodsCount=" + orderGoodsCount + ", payStatus=" + payStatus
				+ ", createTime=" + createTime + "]";
	}

	

	
	
	

}
