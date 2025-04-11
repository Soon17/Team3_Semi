package kr.kh.team3.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team3.dao.TeacherDAO;





@Service
public class TeacherServiceImp implements TeacherService {

	@Autowired
	private TeacherDAO teacherDao;

	
	@Override
	public void save(Map<String, Object> map) {
		teacherDao.insertContent(map);
		
	}
	
   
}
