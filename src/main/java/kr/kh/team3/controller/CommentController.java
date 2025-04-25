package kr.kh.team3.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.team3.model.vo.CommentVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.service.CommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {

	@Autowired
	CommentService commentService;
	
	@PostMapping("/insert")
	public String insert(Model model,CommentVO comment, HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("member");
		if(user == null) {
			return null;
		}
		System.out.println("123123123123"+comment);
		if(commentService.insertComment(comment, user)) {
			model.addAttribute("url", "/class/"+comment.getCo_cl_num());
			model.addAttribute("msg", "댓글작성.");
			return"message";
		}
		return "/class/"+comment.getCo_cl_num();
	}
	
	@GetMapping("/list/{cl_num}")
	@ResponseBody
	public List<CommentVO> list(@PathVariable("cl_num") int cl_num){
		return commentService.getCommentList(cl_num);
	}
}
