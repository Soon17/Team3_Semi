package kr.kh.team3.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.kh.team3.service.SearchService;

@Controller
public class SearchController {

    @Autowired
    SearchService searchService;

    @GetMapping("/search")
    public String search(@RequestParam("keyword") String keyword, Model model) {
        List<Map<String, Object>> resultList = searchService.searchAll(keyword);
        model.addAttribute("keyword", keyword);
        model.addAttribute("resultList", resultList);
        return "search"; 
    }

}
