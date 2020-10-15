package com.zr.poplar.pojo;

import java.io.Serializable;
import java.util.Date;
/**
 * 
 * 评论表实体类
 *
 */
public class Review implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Integer reviewId ;        //评论id
	private Customer customer ;       //关联用户表，谁评论的
	private Goods goods ;             //关联商品表 评论的哪个商品
	private String reviewContent ;    //评论内容
	private Date   reviwDate ;        //评论时间
	
	
	public Review() {
		// TODO Auto-generated constructor stub
	}


	public Review(Integer reviewId, Customer customer, Goods goods, String reviewContent, Date reviwDate) {
		super();
		this.reviewId = reviewId;
		this.customer = customer;
		this.goods = goods;
		this.reviewContent = reviewContent;
		this.reviwDate = reviwDate;
	}


	@Override
	public String toString() {
		return "Review [reviewId=" + reviewId + ", customer=" + customer + ", goods=" + goods + ", reviewContent="
				+ reviewContent + ", reviwDate=" + reviwDate + "]";
	}


	public Integer getReviewId() {
		return reviewId;
	}


	public void setReviewId(Integer reviewId) {
		this.reviewId = reviewId;
	}


	public Customer getCustomer() {
		return customer;
	}


	public void setCustomer(Customer customer) {
		this.customer = customer;
	}


	public Goods getGoods() {
		return goods;
	}


	public void setGoods(Goods goods) {
		this.goods = goods;
	}


	public String getReviewContent() {
		return reviewContent;
	}


	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}


	public Date getReviwDate() {
		return reviwDate;
	}


	public void setReviwDate(Date reviwDate) {
		this.reviwDate = reviwDate;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((customer == null) ? 0 : customer.hashCode());
		result = prime * result + ((goods == null) ? 0 : goods.hashCode());
		result = prime * result + ((reviewContent == null) ? 0 : reviewContent.hashCode());
		result = prime * result + ((reviewId == null) ? 0 : reviewId.hashCode());
		result = prime * result + ((reviwDate == null) ? 0 : reviwDate.hashCode());
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
		Review other = (Review) obj;
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
		if (reviewContent == null) {
			if (other.reviewContent != null)
				return false;
		} else if (!reviewContent.equals(other.reviewContent))
			return false;
		if (reviewId == null) {
			if (other.reviewId != null)
				return false;
		} else if (!reviewId.equals(other.reviewId))
			return false;
		if (reviwDate == null) {
			if (other.reviwDate != null)
				return false;
		} else if (!reviwDate.equals(other.reviwDate))
			return false;
		return true;
	}
	
	

}
