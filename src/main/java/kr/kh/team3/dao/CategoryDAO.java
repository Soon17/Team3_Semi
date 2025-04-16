package kr.kh.team3.dao;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.model.vo.CategoryVO;


public interface CategoryDAO {

	List<CategoryVO> selectCateList();

	CategoryVO selectCategoryNum(@Param("ca_num")int ca_num);

}
