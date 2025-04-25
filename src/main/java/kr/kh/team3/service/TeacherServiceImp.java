package kr.kh.team3.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team3.dao.TeacherDAO;
import kr.kh.team3.model.vo.ClassVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.TeacherVO;
import kr.kh.team3.model.vo.ThumbnailVO;

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
		//강사 번호로 강사 프로필을 가져옴
		int tc_me_num = (Integer)map.get("tc_me_num");
		TeacherVO teacher = teacherDao.selectIntro(tc_me_num);
		//없으면 추가
		if(teacher == null) {
			teacherDao.insertContent(map);
		}
		//있으면 수정
		else {
			teacherDao.updateContent(map);
		}
	}

	@Override
	public MemberVO getMemberNum(int tc_me_num) {	
		return teacherDao.selectTcNum(tc_me_num);
	}

	@Override
	public List<ThumbnailVO> getClassThumbnail(int th_cl_num) {

		return teacherDao.getClassThumbnail(th_cl_num);
	}


}
