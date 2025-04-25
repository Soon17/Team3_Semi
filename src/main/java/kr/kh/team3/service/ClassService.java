package kr.kh.team3.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.kh.team3.model.vo.ClassVO;
import kr.kh.team3.model.vo.SubCategoryVO;

public interface ClassService {

	List<ClassVO> getClassList();

	void acceptRequest(int cl_num);

	void rejectRequest(int cl_num);

	ClassVO getClass(int cl_tc_me_num);

	List<ClassVO> getClassListCaNum(int ca_num);
	
	List<ClassVO> getCaClassList(int ca_num);

	List<ClassVO> getLatestClassList();

	List<ClassVO> getMostClassList();

	ClassVO ClassDetail(int cl_num);

	boolean insertClass(ClassVO cl, int me_num, SubCategoryVO sc, MultipartFile file);

	ClassVO checkRequest(int me_num);

	int getWaitingCount();

}
