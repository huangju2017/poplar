package com.zr.poplar.pojo;

import java.io.Serializable;

public class ShoppingCarExt implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Integer shoppingCarId;
	private String goodsImg;
	private String goodsName;
	private Double goodsPrice;
	private Integer shoppingcarSum;
	private Double sumGoodsnumber;
	private String orderId;
	private Integer goodsId;
	private Integer customerId;
	public Integer getShoppingCarId() {
		return shoppingCarId;
	}
	public void setShoppingCarId(Integer shoppingCarId) {
		this.shoppingCarId = shoppingCarId;
	}
	public String getGoodsImg() {
		return goodsImg;
	}
	public void setGoodsImg(String goodsImg) {
		this.goodsImg = goodsImg;
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
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public Integer getCustomerId() {
		return customerId;
	}
	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public Integer getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
		
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((customerId == null) ? 0 : customerId.hashCode());
		result = prime * result + ((goodsId == null) ? 0 : goodsId.hashCode());
		result = prime * result + ((goodsImg == null) ? 0 : goodsImg.hashCode());
		result = prime * result + ((goodsName == null) ? 0 : goodsName.hashCode());
		result = prime * result + ((goodsPrice == null) ? 0 : goodsPrice.hashCode());
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
		ShoppingCarExt other = (ShoppingCarExt) obj;
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
		if (goodsImg == null) {
			if (other.goodsImg != null)
				return false;
		} else if (!goodsImg.equals(other.goodsImg))
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
		return "ShoppingCarExt [shoppingCarId=" + shoppingCarId + ", goodsImg=" + goodsImg + ", goodsName=" + goodsName
				+ ", goodsPrice=" + goodsPrice + ", shoppingcarSum=" + shoppingcarSum + ", sumGoodsnumber="
				+ sumGoodsnumber + ", orderId=" + orderId + ", goodsId=" + goodsId + ", customerId=" + customerId + "]";
	}
	public ShoppingCarExt(Integer shoppingCarId, String goodsImg, String goodsName, Double goodsPrice,
			Integer shoppingcarSum, Double sumGoodsnumber, String orderId, Integer goodsId, Integer customerId) {
		super();
		this.shoppingCarId = shoppingCarId;
		this.goodsImg = goodsImg;
		this.goodsName = goodsName;
		this.goodsPrice = goodsPrice;
		this.shoppingcarSum = shoppingcarSum;
		this.sumGoodsnumber = sumGoodsnumber;
		this.orderId = orderId;
		this.goodsId = goodsId;
		this.customerId = customerId;
	}
	public ShoppingCarExt() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
