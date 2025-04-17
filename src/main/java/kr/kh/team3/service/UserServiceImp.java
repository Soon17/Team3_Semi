package kr.kh.team3.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team3.dao.UserDAO;
import kr.kh.team3.model.vo.MemberVO;




@Service
public class UserServiceImp implements UserService {

	@Autowired
	private UserDAO userDao;
	
    @Override
    public List<Map<String, Object>> getSubscribeList(int me_num) {
        return userDao.selectSubscribeList(me_num);
    }

	@Override
	public boolean insertRequest(String content, MemberVO user) {
		if(content == null || content == "" || user == null) return false;
		return userDao.insertRequest(content, user);
	}

	@Override
	public boolean isNewRequest(MemberVO user) {
		if(user == null) return false;
		int count = userDao.countRequest(user);
		return count == 0;
	}
}
