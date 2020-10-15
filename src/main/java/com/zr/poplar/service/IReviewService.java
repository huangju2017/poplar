package com.zr.poplar.service;

import java.util.List;

import com.zr.poplar.pojo.Goods;
import com.zr.poplar.pojo.Review;

/**
 * 评论接口
 * @author IReviewDao
 *
 */
public interface IReviewService {
	
	/**
	 * 添加评论
	 * @param goods
	 * @param customerId
	 * @return
	 */
	Boolean addReview(Goods goods,Integer customerId);
	
	/**
	 * 撤回评论
	 * @param goodsId
	 * @return
	 */
	Boolean deleteAllReview(Integer goodsId);
	
	/**
	 * 展示所有评论
	 * @param goodsId
	 * @return
	 */
	List<Review> showAllReview(Integer goodsId);
	
}
