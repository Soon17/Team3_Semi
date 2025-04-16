package kr.kh.team3.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team3.dao.SearchDAO;



@Service
public class SearchServiceImp implements SearchService{

	@Autowired
	private SearchDAO searchDao;
	
	@Override
	public List<Map<String, Object>> searchAll(String keyword) {
		return searchDao.searchAll(keyword);
	}

	
}
