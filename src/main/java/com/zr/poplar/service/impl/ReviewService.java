package com.zr.poplar.service.impl;

import java.util.List;

import com.zr.poplar.dao.IReviewDao;
import com.zr.poplar.dao.impl.ReviewDao;
import com.zr.poplar.pojo.Goods;
import com.zr.poplar.pojo.Review;
import com.zr.poplar.service.IReviewService;

/**
 * 评论实现类
 * @author ReviewService
 *
 */
public class ReviewService implements IReviewService{
	
	/**
	 * 数据实现层
	 */
	IReviewDao dao = new ReviewDao();
	
	/**
	 * 添加评论
	 */
	@Override
	public Boolean addReview(Goods goods, Integer customerId) {
		return dao.addReview(goods, customerId);
	}
	
	/**
	 * 撤销评论
	 */
	@Override
	public Boolean deleteAllReview(Integer goodsId) {
		return dao.deleteAllReview(goodsId);
	}
	
	/**
	 * 展示所有评论
	 */
	@Override
	public List<Review> showAllReview(Integer goodsId) {
		return dao.showAllReview(goodsId);
	}

}
