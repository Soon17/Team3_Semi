package kr.kh.team3.dao;

import org.apache.ibatis.annotations.Param;

public interface SubscribeDAO {

	int checkSubscribed(@Param("me_num")int me_num, @Param("cl_num")int cl_num);

	int countSubscribe(@Param("cl_num")int cl_num);

	boolean insertSubscribe(@Param("me_num")int me_num,@Param("cl_num") int cl_num);

}
