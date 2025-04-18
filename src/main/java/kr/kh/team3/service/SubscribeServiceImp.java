package kr.kh.team3.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team3.dao.SubscribeDAO;

@Service
public class SubscribeServiceImp implements SubscribeService{
	
	@Autowired
	private SubscribeDAO subscribeDao ;

	@Override
	public boolean checkSubscribed(int me_num, int cl_num) {
		return subscribeDao.checkSubscribed(me_num, cl_num) > 0;
	}

	@Override
	public int countSubscribe(int cl_num) {
		return subscribeDao.countSubscribe(cl_num);
	}

	
}