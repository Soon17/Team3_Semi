package kr.kh.team3.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team3.dao.MemberDAO;

@Service
public class MemberServiceImp implements MemberService{

	@Autowired
	private MemberDAO memberDao;
	
	@Override
	public String getPw(String me_id) {
		return memberDao.getPw(me_id);
	};
}
