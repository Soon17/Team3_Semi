package kr.kh.team3.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.team3.dao.ClassDAO;
import kr.kh.team3.dao.SubCategoryDAO;
import kr.kh.team3.model.vo.ClassVO;
import kr.kh.team3.model.vo.SubCategoryVO;
import kr.kh.team3.model.vo.ThumbnailVO;
import kr.kh.team3.utils.UploadFileUtils;

@Service
public class ClassServiceImp implements ClassService{
	@Autowired
	private ClassDAO classDao;
	@Autowired
    private SubCategoryDAO subCategoryDao;
	@Value("${file.location}")
	String classProfilePath;
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
	public boolean insertClass(ClassVO cl, int me_num, SubCategoryVO sc, MultipartFile file) {
		try {
			classDao.insertClass(cl);
			System.out.println(cl.getCl_num()+"=================================");
			subCategoryDao.insertClass(cl,sc);
			String th_name= file.getOriginalFilename();
			int index = th_name.lastIndexOf("."); 
			String suffix = th_name.substring(index);
			try {
				String th_picture = UploadFileUtils.uploadFile(classProfilePath+"\\thumnail",""+me_num, cl.getCl_num()+suffix, file.getBytes());
				ThumbnailVO thumbnail = new ThumbnailVO(th_name,th_picture,cl.getCl_num());
				classDao.insertThumbnail(thumbnail);
			}catch (Exception e) {
				e.printStackTrace();
				return false;
			}
			return true;
		}catch (Exception e) {
			return false;
		}
		
	}

	@Override
	public ClassVO checkRequest(int me_num) {
		return classDao.checkRequest(me_num);
	}

	
}