package kr.kh.team3.dao;

import org.apache.ibatis.annotations.Param;

public interface MemberDAO {
	public String getPw(@Param("me_id")String me_id);
}
