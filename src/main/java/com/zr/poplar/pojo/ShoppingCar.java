package com.zr.poplar.pojo;

import java.io.Serializable;

/**
 * 
 * 购物车实体类
 *
 */
public class ShoppingCar implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer shoppingCarId; // 购物车id
	private Integer goodsId; // 商品id
	private Integer customerId; // 用户id
	private Integer shoppingcarSum; // 购物车商品数量
	private Double sumGoodsnumber; // 商品商品小计
	private Integer orderId; // 订单id

	public ShoppingCar() {
		// TODO Auto-generated constructor stub
	}

	public ShoppingCar(Integer shoppingCarId, Integer goodsId, Integer customerId, Integer shoppingcarSum,
			Double sumGoodsnumber, Integer orderId) {
		super();
		this.shoppingCarId = shoppingCarId;
		this.goodsId = goodsId;
		this.customerId = customerId;
		this.shoppingcarSum = shoppingcarSum;
		this.sumGoodsnumber = sumGoodsnumber;
		this.orderId = orderId;
	}

	public Integer getShoppingCarId() {
		return shoppingCarId;
	}

	public void setShoppingCarId(Integer shoppingCarId) {
		this.shoppingCarId = shoppingCarId;
	}

	public Integer getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}

	public Integer getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}

	public Integer getShoppingcarSum() {
		return shoppingcarSum;
	}

	public void setShoppingcarSum(Integer shoppingcarSum) {
		this.shoppingcarSum = shoppingcarSum;
	}

	public Double getSumGoodsnumber() {
		return sumGoodsnumber;
	}

	public void setSumGoodsnumber(Double sumGoodsnumber) {
		this.sumGoodsnumber = sumGoodsnumber;
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((customerId == null) ? 0 : customerId.hashCode());
		result = prime * result + ((goodsId == null) ? 0 : goodsId.hashCode());
		result = prime * result + ((orderId == null) ? 0 : orderId.hashCode());
		result = prime * result + ((shoppingCarId == null) ? 0 : shoppingCarId.hashCode());
		result = prime * result + ((shoppingcarSum == null) ? 0 : shoppingcarSum.hashCode());
		result = prime * result + ((sumGoodsnumber == null) ? 0 : sumGoodsnumber.hashCode());
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
		ShoppingCar other = (ShoppingCar) obj;
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
		if (orderId == null) {
			if (other.orderId != null)
				return false;
		} else if (!orderId.equals(other.orderId))
			return false;
		if (shoppingCarId == null) {
			if (other.shoppingCarId != null)
				return false;
		} else if (!shoppingCarId.equals(other.shoppingCarId))
			return false;
		if (shoppingcarSum == null) {
			if (other.shoppingcarSum != null)
				return false;
		} else if (!shoppingcarSum.equals(other.shoppingcarSum))
			return false;
		if (sumGoodsnumber == null) {
			if (other.sumGoodsnumber != null)
				return false;
		} else if (!sumGoodsnumber.equals(other.sumGoodsnumber))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ShoppingCar [shoppingCarId=" + shoppingCarId + ", goodsId=" + goodsId + ", customerId=" + customerId
				+ ", shoppingcarSum=" + shoppingcarSum + ", sumGoodsnumber=" + sumGoodsnumber + ", orderId=" + orderId
				+ "]";
	}
}