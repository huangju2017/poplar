package com.zr.poplar.pojo;

import java.io.Serializable;
/**
 * 
 * 购物车实体类
 *
 */
public class ShoppingCar implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Integer shoppingCarId ;       //购物车id
	private Goods goods ;                 //关联的商品
	private Customer customer ;           //关联的用户
	private Integer shoppingcarSum ;     //购物车商品数量
	private Double  sumGoodsnumber ;     //商品商品小计
	private  Orderform orderform;        //关联的订单表，订单编号
	
	public ShoppingCar() {
		// TODO Auto-generated constructor stub
	}

	public ShoppingCar(Integer shoppingCarId, Goods goods, Customer customer, Integer shoppingcarSum,
			Double sumGoodsnumber, Orderform orderform) {
		super();
		this.shoppingCarId = shoppingCarId;
		this.goods = goods;
		this.customer = customer;
		this.shoppingcarSum = shoppingcarSum;
		this.sumGoodsnumber = sumGoodsnumber;
		this.orderform = orderform;
	}

	public Integer getShoppingCarId() {
		return shoppingCarId;
	}

	public void setShoppingCarId(Integer shoppingCarId) {
		this.shoppingCarId = shoppingCarId;
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
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

	public Orderform getOrderform() {
		return orderform;
	}

	public void setOrderform(Orderform orderform) {
		this.orderform = orderform;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((customer == null) ? 0 : customer.hashCode());
		result = prime * result + ((goods == null) ? 0 : goods.hashCode());
		result = prime * result + ((orderform == null) ? 0 : orderform.hashCode());
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
		if (customer == null) {
			if (other.customer != null)
				return false;
		} else if (!customer.equals(other.customer))
			return false;
		if (goods == null) {
			if (other.goods != null)
				return false;
		} else if (!goods.equals(other.goods))
			return false;
		if (orderform == null) {
			if (other.orderform != null)
				return false;
		} else if (!orderform.equals(other.orderform))
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
		return "ShoppingCar [shoppingCarId=" + shoppingCarId + ", goods=" + goods + ", customer=" + customer
				+ ", shoppingcarSum=" + shoppingcarSum + ", sumGoodsnumber=" + sumGoodsnumber + ", orderform="
				+ orderform + "]";
	}
	
	

}
