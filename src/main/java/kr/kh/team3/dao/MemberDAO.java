package kr.kh.team3.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.model.vo.MemberVO;

public interface MemberDAO {
	public String getPw(@Param("me_id")String me_id);
	
	MemberVO selectMember(@Param("me_id")String me_id);
	    
	void insertMember(@Param("member")MemberVO member);

	void onlineMember(@Param("member")MemberVO member);
	
	void offlineMember(@Param("member")MemberVO member);

	public MemberVO selectLogin(@Param("me_id")String me_id, @Param("me_pw")String me_pw);

	public boolean insertSignup(@Param("member")MemberVO member);
}
