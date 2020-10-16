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
	public Boolean addReview(Review review) {
		return dao.addReview(review);
	}
	
	/**
	 * 撤销评论
	 */
	@Override
	public Boolean deleteAllReview(Integer customerId) {
		return dao.deleteAllReview(customerId);
	}
	
	/**
	 * 展示所有评论
	 */
	@Override
	public List<Review> showAllReview() {
		return dao.showAllReview();
	}

}
