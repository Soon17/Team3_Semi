package kr.kh.team3.service;

public interface SubscribeService {

	boolean checkSubscribed(int me_num, int cl_num);

	int countSubscribe(int cl_num);

	boolean subscribe(int me_num, int cl_num);

}