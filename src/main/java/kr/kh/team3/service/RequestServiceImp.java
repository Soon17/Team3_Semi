package kr.kh.team3.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team3.dao.RequestDAO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.RequestVO;

@Service
public class RequestServiceImp implements RequestService{
	
	@Autowired
	RequestDAO requestDao;

	@Override
	public List<RequestVO> getRequestList() {
		return requestDao.selectRequestList();
	}
	
	@Override
	public boolean isNewRequest(MemberVO user) {
		if(user == null) return false;
		int count = requestDao.countRequest(user);
		return count == 0;
	}

	@Override
	public boolean insertRequest(String content, MemberVO user) {
		if(content == null || content == "" || user == null) return false;
		return requestDao.insertRequest(content, user);
	}

	@Override
	public RequestVO getRequest(int rqNum) {
		return requestDao.selectRequest(rqNum);
	}

	@Override
	public boolean setNo(int rq_num) {
		
		return requestDao.setNo(rq_num);
	}

	@Override
	public boolean setOk(int rq_num) {
		
		return requestDao.setOk(rq_num);
	}

	@Override
	public boolean setHandling(int rq_num) {
		
		return requestDao.setHandling(rq_num);
	}

	@Override
	public boolean setWaiting(int rq_num) {
		
		return requestDao.setWaiting(rq_num);
	}
}
