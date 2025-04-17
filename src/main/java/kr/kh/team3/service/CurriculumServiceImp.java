package kr.kh.team3.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team3.dao.CurriculumDAO;
import kr.kh.team3.model.vo.ClassVO;
import kr.kh.team3.model.vo.CurriculumVO;

@Service
public class CurriculumServiceImp implements CurriculumService{
	
	@Autowired
	private CurriculumDAO curriculumDao;

	@Override
	public List<CurriculumVO> getCurriculum(int cl_num) {
		return curriculumDao.getCurriculum(cl_num);
	}

}
