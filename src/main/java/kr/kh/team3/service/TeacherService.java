package kr.kh.team3.service;

public interface TeacherService {

	String selectIntro(String tcId);

	void insertIntro(String tcId, String intro);

	void updateIntro(String tcId, String intro);



}
