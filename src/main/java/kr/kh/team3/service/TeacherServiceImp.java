package kr.kh.team3.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team3.dao.TeacherDAO;
import kr.kh.team3.model.vo.TeacherVO;

@Service
public class TeacherServiceImp implements TeacherService{

	@Autowired
	TeacherDAO teacherDao;

	@Override
	public TeacherVO selectIntro(int tc_me_num) {
	   
	    return teacherDao.selectIntro(tc_me_num);
	}

	@Override
	public void insertIntro(String tcId, String intro) {
		teacherDao.insertIntro(tcId, intro);
		
	}

	@Override
	public void updateIntro(String tcId, String intro) {
		teacherDao.updateIntro(tcId, intro);
		
	}

	


}
