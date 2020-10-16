package com.zr.poplar.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * 评论表实体类
 *
 */
public class Review implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer reviewId; // 评论id
	private Integer customerId; // 用户id
	private Integer goodsId; // 商品id
	private String reviewContent; // 评论内容
	private Date reviwDate; // 评论时间

	public Review() {
		// TODO Auto-generated constructor stub
	}

	public Review(Integer reviewId, Integer customerId, Integer goodsId, String reviewContent, Date reviwDate) {
		super();
		this.reviewId = reviewId;
		this.customerId = customerId;
		this.goodsId = goodsId;
		this.reviewContent = reviewContent;
		this.reviwDate = reviwDate;
	}

	public Integer getReviewId() {
		return reviewId;
	}

	public void setReviewId(Integer reviewId) {
		this.reviewId = reviewId;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((customerId == null) ? 0 : customerId.hashCode());
		result = prime * result + ((goodsId == null) ? 0 : goodsId.hashCode());
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
		return "Review [reviewId=" + reviewId + ", customerId=" + customerId + ", goodsId=" + goodsId
				+ ", reviewContent=" + reviewContent + ", reviwDate=" + reviwDate + "]";
	}
}
