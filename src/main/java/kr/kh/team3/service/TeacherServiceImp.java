package kr.kh.team3.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team3.dao.TeacherDAO;
import kr.kh.team3.model.vo.MemberVO;
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
	public void save(Map<String, Object> map) {
		teacherDao.insertContent(map);
		
	}

	@Override
	public void updateIntro(String tcId, String intro) {
		teacherDao.updateIntro(tcId, intro);
		
	}

	@Override
	public MemberVO getMemberNum(int tc_me_num) {	
		return teacherDao.selectTcNum(tc_me_num);
	}

	


}
