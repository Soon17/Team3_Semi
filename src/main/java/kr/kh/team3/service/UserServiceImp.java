package kr.kh.team3.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team3.dao.UserDAO;




@Service
public class UserServiceImp implements UserService {

	@Autowired
	private UserDAO userDao;
	
    @Override
    public List<Map<String, Object>> getSubscribeList(int me_num) {
        return userDao.selectSubscribeList(me_num);
    }
}
