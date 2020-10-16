package com.zr.poplar.pojo;

import java.io.Serializable;
import java.util.Date;
/**
 * 
 * 商品实体类
 *
 */
public class Goods implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Integer goodsId ;       //商品id
	private String  goodsName ;     //商品名称
	private Double  goodsPrice ;    //商品单价
	private Integer goodsNumber ;   //商品数量
	private String  goodsType ;     //商品分类
	private String  goodsImg ;      //商品图片地址
	private String  goodsContent ;  //商品描述
	private String  goodsStatus ;   //商品状态
	private Date    dateTime ;      //上架时间
	public Integer getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
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
	public Integer getGoodsNumber() {
		return goodsNumber;
	}
	public void setGoodsNumber(Integer goodsNumber) {
		this.goodsNumber = goodsNumber;
	}
	public String getGoodsType() {
		return goodsType;
	}
	public void setGoodsType(String goodsType) {
		this.goodsType = goodsType;
	}
	public String getGoodsImg() {
		return goodsImg;
	}
	public void setGoodsImg(String goodsImg) {
		this.goodsImg = goodsImg;
	}
	public String getGoodsContent() {
		return goodsContent;
	}
	public void setGoodsContent(String goodsContent) {
		this.goodsContent = goodsContent;
	}
	public String getGoodsStatus() {
		return goodsStatus;
	}
	public void setGoodsStatus(String goodsStatus) {
		this.goodsStatus = goodsStatus;
	}
	public Date getDateTime() {
		return dateTime;
	}
	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((dateTime == null) ? 0 : dateTime.hashCode());
		result = prime * result + ((goodsContent == null) ? 0 : goodsContent.hashCode());
		result = prime * result + ((goodsId == null) ? 0 : goodsId.hashCode());
		result = prime * result + ((goodsImg == null) ? 0 : goodsImg.hashCode());
		result = prime * result + ((goodsName == null) ? 0 : goodsName.hashCode());
		result = prime * result + ((goodsNumber == null) ? 0 : goodsNumber.hashCode());
		result = prime * result + ((goodsPrice == null) ? 0 : goodsPrice.hashCode());
		result = prime * result + ((goodsStatus == null) ? 0 : goodsStatus.hashCode());
		result = prime * result + ((goodsType == null) ? 0 : goodsType.hashCode());
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
		Goods other = (Goods) obj;
		if (dateTime == null) {
			if (other.dateTime != null)
				return false;
		} else if (!dateTime.equals(other.dateTime))
			return false;
		if (goodsContent == null) {
			if (other.goodsContent != null)
				return false;
		} else if (!goodsContent.equals(other.goodsContent))
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
		if (goodsNumber == null) {
			if (other.goodsNumber != null)
				return false;
		} else if (!goodsNumber.equals(other.goodsNumber))
			return false;
		if (goodsPrice == null) {
			if (other.goodsPrice != null)
				return false;
		} else if (!goodsPrice.equals(other.goodsPrice))
			return false;
		if (goodsStatus == null) {
			if (other.goodsStatus != null)
				return false;
		} else if (!goodsStatus.equals(other.goodsStatus))
			return false;
		if (goodsType == null) {
			if (other.goodsType != null)
				return false;
		} else if (!goodsType.equals(other.goodsType))
			return false;
		return true;
	}
	
	public Goods() {
		// TODO Auto-generated constructor stub
	}
	public Goods(Integer goodsId, String goodsName, Double goodsPrice, Integer goodsNumber, String goodsType,
			String goodsImg, String goodsContent, String goodsStatus, Date dateTime) {
		super();
		this.goodsId = goodsId;
		this.goodsName = goodsName;
		this.goodsPrice = goodsPrice;
		this.goodsNumber = goodsNumber;
		this.goodsType = goodsType;
		this.goodsImg = goodsImg;
		this.goodsContent = goodsContent;
		this.goodsStatus = goodsStatus;
		this.dateTime = dateTime;
	}
	@Override
	public String toString() {
		return "Goods [goodsId=" + goodsId + ", goodsName=" + goodsName + ", goodsPrice=" + goodsPrice
				+ ", goodsNumber=" + goodsNumber + ", goodsType=" + goodsType + ", goodsImg=" + goodsImg
				+ ", goodsContent=" + goodsContent + ", goodsStatus=" + goodsStatus + ", dateTime=" + dateTime + "]";
	}
	

}
