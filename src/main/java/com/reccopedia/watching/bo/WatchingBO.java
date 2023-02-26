package com.reccopedia.watching.bo;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reccopedia.watching.dao.WatchingDAO;
import com.reccopedia.watching.model.Watching;

@Service
public class WatchingBO {

	@Autowired
	private WatchingDAO watchingDAO;
	
	public void watchingToggle(int id, int userId) {
		// 위시 리스트에 있는지 확인
		if (watchingDAO.selectWatchingByApiIdOrUserId(id, userId) > 0) {
			// 있으면 제거
			watchingDAO.deleteWatchingByApiIdUserId(id, userId);
		} else {
			// 없으면 추가
			watchingDAO.insertWatching(id, userId);
		}
	};
	
	public boolean existwatching(int id, Integer userId) {
		if(userId == null) {
			return false;
		}
		return watchingDAO.selectWatchingByApiIdOrUserId(id, userId) > 0 ? true:false;
	}
	
	
	public void deleteWatchingByApiId(int id) {
		watchingDAO.deleteWatchingByApiId(id);
	}
	

	public List<Map<String, Object>> getWatchingList(int userId) {
		return watchingDAO.selectWatchingListByApiIdOrUserId(userId);
	}
	
	public List<Watching> getWatchingObjList(int userId) {
		return watchingDAO.selectWatchingObjListByApiIdOrUserId(userId);
	}
	
	
}
