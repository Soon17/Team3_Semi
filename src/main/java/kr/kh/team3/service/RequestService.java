package kr.kh.team3.service;

import java.util.List;

import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.RequestVO;

public interface RequestService {

	List<RequestVO> getRequestList();

	boolean isNewRequest(MemberVO user);

	boolean insertRequest(String content, MemberVO user);

	RequestVO getRequest(int rqNum);

	boolean setNo(int rq_num);

	boolean setOk(int rq_num);
	
}
