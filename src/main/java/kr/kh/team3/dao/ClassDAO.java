package kr.kh.team3.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.model.vo.ClassVO;

public interface ClassDAO {

	List<ClassVO> getClassList();

	void updateAccept(@Param("cl_num")int cl_num);

	void rejectAccept(@Param("cl_num")int cl_num);

	ClassVO getClass(@Param("cl_tc_me_num")int cl_tc_me_num);

	List<ClassVO> selectClassListCaNum(@Param("ca_num")int ca_num);
	
	List<ClassVO> getCaClassList(@Param("ca_num")int ca_num);

	List<ClassVO> getLatestClassList();

	List<ClassVO> getMostClassList();

	void insertClass(@Param("cl")ClassVO cl);

	ClassVO checkRequest(@Param("me_num")int me_num);

}
