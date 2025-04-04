package kr.kh.team3.service;

import java.util.List;

import kr.kh.team3.model.vo.ClassVO;

public interface ClassService {

	List<ClassVO> getClassList();

	void acceptRequest(int cl_num);

	void rejectRequest(int cl_num);

	ClassVO getClass(int cl_tc_me_num);


}
