package kr.kh.team3.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.pagination.MemberCriteria;

public interface MemberDAO {
	public String getPw(@Param("me_id")String me_id);
	
	MemberVO selectMember(@Param("me_id")String me_id);
	    
	void insertMember(@Param("member")MemberVO member);

	void onlineMember(@Param("member")MemberVO member);
	
	void offlineMember(@Param("member")MemberVO member);

	public MemberVO selectLogin(@Param("me_id")String me_id, @Param("me_pw")String me_pw);

	public boolean insertSignup(@Param("member")MemberVO member);

	public List<MemberVO> selectMemberList(@Param("cri")MemberCriteria cri);

	public boolean createMember(@Param("me_num")int me_num);

	public boolean clearMember(@Param("me_num")int me_num);
}
