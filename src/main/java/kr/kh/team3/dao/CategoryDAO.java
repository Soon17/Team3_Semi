package kr.kh.team3.dao;
import java.util.List;

import kr.kh.team3.model.vo.CategoryVO;


public interface CategoryDAO {

	List<CategoryVO> selectCateList();

}
