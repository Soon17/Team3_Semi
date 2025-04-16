package kr.kh.team3.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.model.vo.SubCategoryVO;

public interface SubCategoryDAO {

	List<SubCategoryVO> selectSubListCaNum(@Param("ca_num")int ca_num);

}
