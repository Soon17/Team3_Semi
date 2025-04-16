package kr.kh.team3.service;

import java.util.List;
import java.util.Map;

public interface SearchService {

	List<Map<String, Object>> searchAll(String keyword);

}
