package kr.kh.team3.service;

import java.util.List;
import java.util.Map;

import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.TeacherVO;
import kr.kh.team3.model.vo.ThumbnailVO;

public interface TeacherService {

	void save(Map<String, Object> map);

	TeacherVO selectIntro(int tc_me_num);

	MemberVO getMemberNum(int tc_me_num);

}
