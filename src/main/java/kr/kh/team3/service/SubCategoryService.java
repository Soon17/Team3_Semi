package kr.kh.team3.service;

import java.util.List;

import kr.kh.team3.model.vo.ClassVO;
import kr.kh.team3.model.vo.SubCategoryVO;

public interface SubCategoryService {

	List<SubCategoryVO> getSubListCaNum(int ca_num);

	List<SubCategoryVO> getScNameList(int ca_num);

	void insertClass(ClassVO cl, SubCategoryVO sc);
	
}
