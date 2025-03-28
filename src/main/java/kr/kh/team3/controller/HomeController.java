package kr.kh.team3.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.kh.team3.model.vo.CategoryVO;
import kr.kh.team3.service.CategoryService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("/")
	public String home(Model model) {
		List<CategoryVO> categoryList = categoryService.selectCateList();
		model.addAttribute("list",categoryList);
		return "home";
	}
	@GetMapping("/signup")
	public String signup(Model model) {
		List<CategoryVO> categoryList = categoryService.selectCateList();
		model.addAttribute("list",categoryList);
		System.out.println("싸발");
		return "/member/signup";
	}
}
