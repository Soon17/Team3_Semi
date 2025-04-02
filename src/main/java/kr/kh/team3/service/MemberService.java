package kr.kh.team3.service;

import kr.kh.team3.model.vo.MemberVO;

public interface MemberService {

	public String getPw(String me_id);

	MemberVO getMemberId(String me_id);
    
	void insertMember(MemberVO member);

	void OnlineMember(MemberVO member);

	public MemberVO login(MemberVO member);

	public boolean checkId(String id);
}
