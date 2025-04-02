package kr.kh.team3.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team3.dao.CategoryDAO;
import kr.kh.team3.model.vo.CategoryVO;

@Service
public class CategoryServiceImp implements CategoryService{
	@Autowired
	private CategoryDAO categotyDao;

	@Override
	public List<CategoryVO> selectCateList() {
		return categotyDao.selectCateList();
	}
	
}
