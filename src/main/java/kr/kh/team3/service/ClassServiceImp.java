package kr.kh.team3.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team3.dao.ClassDAO;
import kr.kh.team3.model.vo.ClassVO;

@Service
public class ClassServiceImp implements ClassService{
	@Autowired
	private ClassDAO classDao;

	@Override
	public List<ClassVO> getClassList() {
		return classDao.getClassList();
	}

	@Override
	public void acceptRequest(int cl_num) {
		classDao.updateAccept(cl_num);
	}

	@Override
	public void rejectRequest(int cl_num) {
		classDao.rejectAccept(cl_num);
	}

	@Override
	public ClassVO getClass(int cl_tc_me_num) {
		
		return classDao.getClass(cl_tc_me_num);
	}

	@Override
	public List<ClassVO> getClassListCaNum(int ca_num) {
		return classDao.selectClassListCaNum(ca_num);
	}

	@Override
	public List<ClassVO> getCaClassList(int ca_num) {
		
		return classDao.getCaClassList(ca_num);
	}

	@Override
	public List<ClassVO> getLatestClassList() {
		return classDao.getLatestClassList();
	}

	@Override
	public List<ClassVO> getMostClassList() {
		return classDao.getMostClassList();
	}

	@Override
	public ClassVO ClassDetail(int cl_num) {
		return classDao.ClassDetail(cl_num);
	}
	
}