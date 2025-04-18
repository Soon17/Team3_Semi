package kr.kh.team3.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface SearchDAO {

	List<Map<String, Object>> searchAll(@Param("keyword")String keyword);


}
