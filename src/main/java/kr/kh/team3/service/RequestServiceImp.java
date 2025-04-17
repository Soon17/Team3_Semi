package kr.kh.team3.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team3.dao.RequestDAO;
import kr.kh.team3.model.vo.RequestVO;

@Service
public class RequestServiceImp implements RequestService{
	
	@Autowired
	RequestDAO requestDao;

	@Override
	public List<RequestVO> getRequestList() {
		return requestDao.selectRequestList();
	}
}
