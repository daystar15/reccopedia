package com.reccopedia.wish.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reccopedia.wish.dao.WishDAO;

@Service
public class WishBO {

	@Autowired
	private WishDAO wishDAO;
	
	public void wishToggle(int apiId, int userId) {
		// 위시 리스트에 있는지 확인
		if (wishDAO.selectWishByApiIdOrUserId(apiId, userId) > 0) {
			// 있으면 제거
			wishDAO.deleteWishByApiIdUserId(apiId, userId);
		} else {
			// 없으면 추가
			wishDAO.insertWish(apiId, userId);
		}
	};
	
	public boolean existWish(int apiId, Integer userId) {
		if(userId == null) {
			return false;
		}
		return wishDAO.selectWishByApiIdOrUserId(apiId, userId) > 0 ? true:false;
	}
	
	
	public void deleteWishByApiId(int apiId) {
		wishDAO.deleteWishByApiId(apiId);
	}
	
}
