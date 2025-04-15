package kr.kh.team3.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface TeacherDAO {

	void insertContent(@Param("map")Map<String, Object> map);
}
