package kr.kh.team3.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.model.vo.CommentVO;
import kr.kh.team3.model.vo.MemberVO;

public interface CommentDAO {

	List<CommentVO> selectCommentList(int cl_num);

	boolean insertComment(@Param("comment")CommentVO comment, MemberVO user);

	CommentVO selectCommentById(int co_num);

	boolean updateComment(int co_num, String content);

	boolean deleteComment(int co_num);

}
