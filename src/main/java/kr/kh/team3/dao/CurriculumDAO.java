package kr.kh.team3.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.model.vo.CurriculumVO;

public interface CurriculumDAO {

	List<CurriculumVO> getCurriculum(@Param("cl_num") int cl_num);

}
