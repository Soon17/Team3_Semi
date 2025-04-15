package kr.kh.team3.service;

import kr.kh.team3.model.vo.TeacherVO;

public interface TeacherService {

	void insertIntro(String tcId, String intro);

	void updateIntro(String tcId, String intro);

	TeacherVO selectIntro(int tc_me_num);



}
