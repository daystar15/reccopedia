package com.reccopedia.point.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PointDAO {

	public void insertPoint(
			@Param("userId") Integer userId, 
			@Param("point") int point, 
			@Param("apiId") int apiId);
}
