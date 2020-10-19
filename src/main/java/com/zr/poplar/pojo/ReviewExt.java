package com.zr.poplar.pojo;

import java.io.Serializable;
import java.util.Date;

public class ReviewExt implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private Integer reviewId ;
	private String customerName;
	private String goodsName ;
	private String reviewContent ;
	private Date reviwDate;
	
	public ReviewExt() {
		// TODO Auto-generated constructor stub
	}

	public ReviewExt(Integer reviewId, String customerName, String goodsName, String reviewContent, Date reviwDate) {
		super();
		this.reviewId = reviewId;
		this.customerName = customerName;
		this.goodsName = goodsName;
		this.reviewContent = reviewContent;
		this.reviwDate = reviwDate;
	}

	public Integer getReviewId() {
		return reviewId;
	}

	public void setReviewId(Integer reviewId) {
		this.reviewId = reviewId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
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
		result = prime * result + ((customerName == null) ? 0 : customerName.hashCode());
		result = prime * result + ((goodsName == null) ? 0 : goodsName.hashCode());
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
		ReviewExt other = (ReviewExt) obj;
		if (customerName == null) {
			if (other.customerName != null)
				return false;
		} else if (!customerName.equals(other.customerName))
			return false;
		if (goodsName == null) {
			if (other.goodsName != null)
				return false;
		} else if (!goodsName.equals(other.goodsName))
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

	@Override
	public String toString() {
		return "ReviewExt [reviewId=" + reviewId + ", customerName=" + customerName + ", goodsName=" + goodsName
				+ ", reviewContent=" + reviewContent + ", reviwDate=" + reviwDate + "]";
	}
	

}
