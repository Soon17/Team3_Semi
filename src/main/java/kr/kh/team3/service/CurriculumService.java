package kr.kh.team3.service;

import java.util.List;
import kr.kh.team3.model.vo.CurriculumVO;

public interface CurriculumService {

	List<CurriculumVO> getCurriculum(int cl_num);

}
