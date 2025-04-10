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
	public String selectIntro(String tcId) {
        TeacherVO teacher = teacherDao.selectIntro(tcId); // TeacherVO 객체를 받음
        if (teacher != null) {
            return teacher.getTc_intro(); // 강사 소개글만 반환
        }
        return null; // 소개글이 없으면 null 반환
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
