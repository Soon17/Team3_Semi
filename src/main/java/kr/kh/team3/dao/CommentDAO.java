package kr.kh.team3.dao;

import java.util.List;

import kr.kh.team3.model.vo.CommentVO;

public interface CommentDAO {

	boolean insertComment(CommentVO comment);

	List<CommentVO> getCommentList(int cl_num);


}
