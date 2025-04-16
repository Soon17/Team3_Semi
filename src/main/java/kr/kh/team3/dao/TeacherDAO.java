package kr.kh.team3.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.TeacherVO;

public interface TeacherDAO {

	TeacherVO selectIntro(@Param("tc_me_num")int tc_me_num);

	void insertContent(@Param("map")Map<String, Object> map);

	MemberVO selectTcNum(@Param("tc_me_num")int tc_me_num);

	void updateContent(@Param("map")Map<String, Object> map);


}
