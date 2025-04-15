package kr.kh.team3.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.model.vo.TeacherVO;

public interface TeacherDAO {

	TeacherVO selectIntro(@Param("tc_me_num")int tc_me_num);

	void insertIntro(@Param("tcId")String tcId, @Param("intro")String intro);

	void updateIntro(@Param("tcId")String tcId, @Param("intro")String intro);




}
