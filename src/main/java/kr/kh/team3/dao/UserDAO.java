package kr.kh.team3.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.model.vo.MemberVO;

public interface UserDAO {

	List<Map<String, Object>> selectSubscribeList(@Param("me_num") int me_num);

	boolean insertRequest(@Param("content") String content, @Param("user") MemberVO user);

	int countRequest(@Param("user") MemberVO user);

}
