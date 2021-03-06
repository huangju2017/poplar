package com.zr.poplar.pojo;

import java.io.Serializable;
import java.util.Date;
/**
 * 
 * 商品的实体类
 *
 */
public class Orderform implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Integer orderId ;           //订单id
	private String  orderNumber ;       //订单编号
	private Integer orderGoodsCount ;   //订单商品数量
	private Double  totalPrice ;        //商品总价
	private Integer customerId ;         // 用户id
	private Integer   goodsId ;             // 商品id
	private String  payStatus ;         //支付状态
	private Date    createTime ;        //成单时间
	
	public Orderform() {
		// TODO Auto-generated constructor stub
	}

	public Orderform(Integer orderId, String orderNumber, Integer orderGoodsCount, Double totalPrice,
			Integer customerId, Integer goodsId, String payStatus, Date createTime) {
		super();
		this.orderId = orderId;
		this.orderNumber = orderNumber;
		this.orderGoodsCount = orderGoodsCount;
		this.totalPrice = totalPrice;
		this.customerId = customerId;
		this.goodsId = goodsId;
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

	public Integer getOrderGoodsCount() {
		return orderGoodsCount;
	}

	public void setOrderGoodsCount(Integer orderGoodsCount) {
		this.orderGoodsCount = orderGoodsCount;
	}

	public Double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Integer getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}

	public Integer getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((createTime == null) ? 0 : createTime.hashCode());
		result = prime * result + ((customerId == null) ? 0 : customerId.hashCode());
		result = prime * result + ((goodsId == null) ? 0 : goodsId.hashCode());
		result = prime * result + ((orderGoodsCount == null) ? 0 : orderGoodsCount.hashCode());
		result = prime * result + ((orderId == null) ? 0 : orderId.hashCode());
		result = prime * result + ((orderNumber == null) ? 0 : orderNumber.hashCode());
		result = prime * result + ((payStatus == null) ? 0 : payStatus.hashCode());
		result = prime * result + ((totalPrice == null) ? 0 : totalPrice.hashCode());
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
		Orderform other = (Orderform) obj;
		if (createTime == null) {
			if (other.createTime != null)
				return false;
		} else if (!createTime.equals(other.createTime))
			return false;
		if (customerId == null) {
			if (other.customerId != null)
				return false;
		} else if (!customerId.equals(other.customerId))
			return false;
		if (goodsId == null) {
			if (other.goodsId != null)
				return false;
		} else if (!goodsId.equals(other.goodsId))
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
		if (totalPrice == null) {
			if (other.totalPrice != null)
				return false;
		} else if (!totalPrice.equals(other.totalPrice))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Orderform [orderId=" + orderId + ", orderNumber=" + orderNumber + ", orderGoodsCount=" + orderGoodsCount
				+ ", totalPrice=" + totalPrice + ", customerId=" + customerId + ", goodsId=" + goodsId + ", payStatus="
				+ payStatus + ", createTime=" + createTime + "]";
	}

	
	
	

}
