package kr.kh.team3.dao;

import java.util.List;

import kr.kh.team3.model.vo.RequestVO;

public interface RequestDAO {

	List<RequestVO> selectRequestList();

}
