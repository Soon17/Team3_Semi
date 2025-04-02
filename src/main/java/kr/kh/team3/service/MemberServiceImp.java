package kr.kh.team3.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.kh.team3.dao.MemberDAO;
import kr.kh.team3.model.vo.MemberVO;

@Service
public class MemberServiceImp implements MemberService{

	@Autowired
	private MemberDAO memberDao;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
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
		//아이디가 일치하지 않을 때 
		if(user == null) {
			System.out.println("아이디 일치x");
			return null;
		}
		//비번이 일치하지 않을 때
		if(!passwordEncoder.matches(member.getMe_pw(), user.getMe_pw())) {
			System.out.println("비번 일치x");
			return null;
		}
		System.out.println("다 일치");
		//아이디 비번이 다 일치할 때
		return user;
	}
	@Override
	public boolean insertSingup(MemberVO member) {
		if(member == null) return false;
		System.out.println(member.getMe_pw());
		String encPw = passwordEncoder.encode(member.getMe_pw());
		member.setMe_pw(encPw);
		try {
			//가입된 아이디로 가입한 경우.
			return memberDao.insertSignup(member);
		}catch(Exception e) {
			//e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean checkId(String id) {
		MemberVO user = memberDao.selectMember(id);
		return user == null;
	};
}
