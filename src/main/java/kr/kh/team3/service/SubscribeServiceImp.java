package kr.kh.team3.service;



import java.util.HashMap;
import java.util.Map;

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

	@Override
	public boolean subscribe(int me_num, int cl_num) {
	    int updated = subscribeDao.updateSubscribe(me_num, cl_num);
	    if (updated == 0) {
	        return subscribeDao.insertSubscribe(me_num, cl_num);
	    }
	    return true;
	}

	@Override
	public String getStatus(int me_num, int cl_num) {
		return subscribeDao.getStatus(me_num, cl_num);
	}	
	
	@Override
	public boolean createDeleteEvent(int me_num, int cl_num) {
	    Map<String, Object> map = new HashMap<>();
	    map.put("me_num", me_num);
	    map.put("cl_num", cl_num);
	    return subscribeDao.createDeleteEvent(map);
	}

}