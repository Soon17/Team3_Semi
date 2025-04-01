package kr.kh.team3.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.kh.team3.dao.MemberDAO;
import kr.kh.team3.model.vo.MemberVO;

@Service
public class MemberServiceImp implements MemberService{

	@Autowired
	private MemberDAO memberDao;
	
	@Override
	public String getPw(String me_id) {
		return memberDao.getPw(me_id);
	}

	@Override
	public MemberVO getMemberId(String me_id) {
		 return memberDao.selectMember(me_id);
	}

	@Override
	public void insertMember(MemberVO member) {
		 memberDao.insertMember(member);
		
	}


	@Override
	public void OnlineMember(MemberVO member) {
		memberDao.onlineMember(member);
		
	}

	@Override
	public MemberVO login(MemberVO member) {
		if(member == null) {
			return null;
		}
		MemberVO user = memberDao.selectMember(member.getMe_id());
		
		if(user == null) {
			return null;
		}
		
		return user;
	};
}
