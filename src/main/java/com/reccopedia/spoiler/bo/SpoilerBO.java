package com.reccopedia.spoiler.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reccopedia.spoiler.dao.SpoilerDAO;

@Service
public class SpoilerBO {

	@Autowired
	private SpoilerDAO spoilerDAO;
	
	public void spoilerToggle(int apiId, int userId, String spoiler) {
		// 위시 리스트에 있는지 확인
		if (spoilerDAO.selectSpoilerByApiIdOrUserIdOrSpoiler(apiId, userId, spoiler) > 0) {
			// 있으면 제거
			spoilerDAO.deleteSpoilerByApiIdUserIdSpoiler(apiId, userId, spoiler);
		} else {
			// 없으면 추가
			spoilerDAO.insertSpoiler(apiId, userId, spoiler);
		}
	};
	
	
	public boolean existSpoiler(int apiId, int userId, String spoiler) {
		return spoilerDAO.selectSpoilerByApiIdOrUserIdOrSpoiler(apiId, userId, spoiler) > 0 ? true:false;
	}
	
}
