package kr.kh.team3.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.model.vo.MemberVO;

public interface MemberDAO {
	public String getPw(@Param("me_id")String me_id);
	
	MemberVO selectMember(@Param("me_id")String me_id);
	    
	void insertMember(@Param("member")MemberVO member);
}
