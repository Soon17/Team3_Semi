package kr.kh.team3.service;

import java.util.List;

import kr.kh.team3.model.vo.CommentVO;
import kr.kh.team3.model.vo.MemberVO;

public interface CommentService {

	List<CommentVO> getComment(int cl_num);
	
	boolean insertComment(CommentVO comment, MemberVO user);
	
	boolean updateComment(int co_num, String content, MemberVO user);
	
	boolean deleteComment(int co_num, MemberVO user);

}
