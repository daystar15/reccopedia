package com.reccopedia.notinterest.bo;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reccopedia.notinterest.dao.NotinterestDAO;

@Service
public class NotinterestBO {

	@Autowired
	private NotinterestDAO notinterestDAO;
	
	public void notinterestToggle(int id, int userId) {
		// 위시 리스트에 있는지 확인
		if (notinterestDAO.selectNotinterestByApiIdOrUserId(id, userId) > 0) {
			// 있으면 제거
			notinterestDAO.deleteNotinterestByApiIdUserId(id, userId);
		} else {
			// 없으면 추가
			notinterestDAO.insertNotinterest(id, userId);
		}
	};
	
	public boolean existNotinterest(int id, Integer userId) {
		if(userId == null) {
			return false;
		}
		return notinterestDAO.selectNotinterestByApiIdOrUserId(id, userId) > 0 ? true:false;
	}
	
	
	public void deleteNotinterestByApiId(int id) {
		notinterestDAO.deleteNotinterestByApiId(id);
	}
	
	public List<Map<String, Object>> getNotinterestList(int userId) {
		return notinterestDAO.selectNotinterestListByApiIdOrUserId(userId);
	}
}
