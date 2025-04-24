package kr.kh.team3.service;

import java.util.List;

import kr.kh.team3.model.vo.CommentVO;
import kr.kh.team3.model.vo.MemberVO;

public interface CommentService {

	boolean insertComment(CommentVO comment, MemberVO user);

	List<CommentVO> getCommentList(int cl_num);


}
