package kr.kh.team3.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.RequestVO;

public interface RequestDAO {

	List<RequestVO> selectRequestList();

	int countRequest(@Param("user") MemberVO user);

	boolean insertRequest(@Param("content") String content, @Param("user") MemberVO user);

	RequestVO selectRequest(@Param("rqNum") int rqNum);

}
