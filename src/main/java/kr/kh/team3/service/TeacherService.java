package kr.kh.team3.service;

import java.util.Map;

import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.TeacherVO;

public interface TeacherService {

	void save(Map<String, Object> map);

	void updateIntro(String tcId, String intro);

	TeacherVO selectIntro(int tc_me_num);

	MemberVO getMemberNum(int tc_me_num);



}
