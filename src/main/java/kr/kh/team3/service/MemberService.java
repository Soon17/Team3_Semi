package kr.kh.team3.service;

import kr.kh.team3.model.vo.MemberVO;

public interface MemberService {

	public String getPw(String me_id);

	MemberVO getMemberId(String me_id);
    
	void insertMember(MemberVO member);

	void onlineMember(MemberVO member);
	
	void offlineMember(MemberVO member);

	public MemberVO login(MemberVO member);
	
	public boolean insertSingup(MemberVO member);

	public boolean checkId(String id);
}
