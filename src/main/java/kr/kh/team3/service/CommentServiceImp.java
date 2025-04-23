package kr.kh.team3.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team3.dao.CommentDAO;
import kr.kh.team3.model.vo.CommentVO;
import kr.kh.team3.model.vo.MemberVO;

@Service
public class CommentServiceImp implements CommentService{
	
	@Autowired
	CommentDAO commentDao;

	@Override
	public List<CommentVO> getComment(int cl_num) {
		
		return commentDao.selectCommentList(cl_num);
	}

	@Override
	public boolean insertComment(CommentVO comment, MemberVO user) {
		if(comment == null) {
			return false;
		}
		if(user == null) {
			return false;
		}
		comment.setCo_me_num(user.getMe_num());
		return commentDao.insertComment(comment, user);
	}
	
	@Override
	public boolean updateComment(int co_num, String content, MemberVO user) {
	    CommentVO c = commentDao.selectCommentById(co_num);
	    if(c == null || user == null || c.getCo_me_num() != user.getMe_num()) return false;
	    return commentDao.updateComment(co_num, content);
	}

	@Override
	public boolean deleteComment(int co_num, MemberVO user) {
	    CommentVO c = commentDao.selectCommentById(co_num);
	    if(c == null || user == null || c.getCo_me_num() != user.getMe_num()) return false;
	    return commentDao.deleteComment(co_num);
	}

}
