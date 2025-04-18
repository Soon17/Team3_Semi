package kr.kh.team3.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team3.dao.SubCategoryDAO;
import kr.kh.team3.model.vo.ClassVO;
import kr.kh.team3.model.vo.SubCategoryVO;


@Service
public class SubCategoryServiceImp implements SubCategoryService{

    @Autowired
    private SubCategoryDAO subCategoryDao;
    
	@Override
	public List<SubCategoryVO> getSubListCaNum(int ca_num) {
		return subCategoryDao.selectSubListCaNum(ca_num);
	}

	@Override
	public List<SubCategoryVO> getScNameList(int ca_num) {
		return subCategoryDao.getScNameList(ca_num);
	}

	@Override
	public void insertClass(ClassVO cl, SubCategoryVO sc) {
		subCategoryDao.insertClass(cl,sc);
	}
	
	
}
