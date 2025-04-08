package kr.kh.team3.service;

import java.util.List;

import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.pagination.MemberCriteria;

public interface MemberService {

	public String getPw(String me_id);

	MemberVO getMemberId(String me_id);
    
	void insertMember(MemberVO member);

	void onlineMember(MemberVO member);
	
	void offlineMember(MemberVO member);

	public MemberVO login(MemberVO member);
	
	public boolean insertSingup(MemberVO member);

	public boolean checkId(String id);

	public List<MemberVO> getMemberList(MemberCriteria cri);

	public boolean createMemberList(int me_num);

	public boolean clearMemberList(int me_num);


}
