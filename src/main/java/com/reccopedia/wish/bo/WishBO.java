package com.reccopedia.wish.bo;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reccopedia.wish.dao.WishDAO;

@Service
public class WishBO {

	@Autowired
	private WishDAO wishDAO;
	
	public void wishToggle(int id, int userId, String title, String posterPath) {
		// 위시 리스트에 있는지 확인
		if (wishDAO.selectWishByApiIdOrUserId(id, userId) > 0) {
			// 있으면 제거
			wishDAO.deleteWishByApiIdUserId(id, userId);
		} else {
			// 없으면 추가
			wishDAO.insertWish(id, userId, title, posterPath);
		}
	};
	
	public boolean existWish(int id, Integer userId) {
		if(userId == null) {
			return false;
		}
		return wishDAO.selectWishByApiIdOrUserId(id, userId) > 0 ? true:false;
	}
	
	
	public void deleteWishByApiId(int id) {
		wishDAO.deleteWishByApiId(id);
	}
	
	public List<Map<String, Object>> getWishList(int userId) {
		return wishDAO.selectWishListByApiIdOrUserId(userId);
	}
	
}
