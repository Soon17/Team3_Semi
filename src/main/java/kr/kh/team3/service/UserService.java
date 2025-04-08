package kr.kh.team3.service;

import java.util.List;
import java.util.Map;


public interface UserService {
	
    List<Map<String, Object>> getSubscribeList(int me_num);
    
}



