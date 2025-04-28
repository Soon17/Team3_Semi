package kr.kh.team3.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface SubscribeDAO {

	int checkSubscribed(@Param("me_num")int me_num, @Param("cl_num")int cl_num);

	int countSubscribe(@Param("cl_num")int cl_num);

	boolean insertSubscribe(@Param("me_num")int me_num,@Param("cl_num") int cl_num);

	String getStatus(@Param("me_num")int me_num, @Param("cl_num")int cl_num);

	boolean createDeleteEvent(Map<String, Object> map);

	int updateSubscribe(@Param("me_num")int me_num, @Param("cl_num") int cl_num);

	boolean deleteSubscribe(@Param("me_num")int me_num, @Param("cl_num") int cl_num);


}
