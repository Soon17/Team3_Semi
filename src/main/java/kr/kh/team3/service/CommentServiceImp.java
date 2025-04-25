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
	public boolean insertComment(CommentVO comment, MemberVO user) {
		if(comment == null || user == null || comment.getCo_content().isBlank()) {
			return false;
		}
		comment.setCo_me_num(user.getMe_num());
		return commentDao.insertComment(comment);
	}

	@Override
	public List<CommentVO> getCommentList(int cl_num) {
		
		return commentDao.getCommentList(cl_num);
	}

	@Override
	public boolean deleteComment(int co_num, MemberVO user) {
		if(user == null) {
			return false;
		}
		CommentVO comment = commentDao.selectComment(co_num);
		if(comment == null || comment.getCo_me_num() != user.getMe_num()) {
			return false;
		}
		return commentDao.deleteComment(co_num);
	}

	@Override
	public boolean updateComment(CommentVO comment, MemberVO user) {
		if(comment == null || user == null) {
			return false;
		}
		CommentVO upComment = commentDao.selectComment(comment.getCo_num());
		if(upComment == null || upComment.getCo_me_num() != user.getMe_num()) {
			return false;
		}
		return commentDao.updateComment(comment);
	}


}
