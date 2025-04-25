package kr.kh.team3.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.team3.dao.ClassDAO;
import kr.kh.team3.dao.SubCategoryDAO;
import kr.kh.team3.model.vo.ClassVO;
import kr.kh.team3.model.vo.CurriculumVO;
import kr.kh.team3.model.vo.SubCategoryVO;
import kr.kh.team3.model.vo.ThumbnailVO;
import kr.kh.team3.model.vo.VideoVO;
import kr.kh.team3.utils.UploadFileUtils;

@Service
public class ClassServiceImp implements ClassService{
	
	@Autowired
	private ClassDAO classDao;
	
	@Autowired
    private SubCategoryDAO subCategoryDao;
	
	@Value("${file.location}")
	String classProfilePath;
	
	@Value("${file.location}")
    private String uploadPath;
	
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
	
	@Override
	public boolean insertClass(ClassVO cl, int me_num, SubCategoryVO sc, MultipartFile file) {
		try {
			//클래스를 등록
			classDao.insertClass(cl);
			//클래스에 서부카테고리를 등록
			subCategoryDao.insertClass(cl,sc);
			//썸네일 업로드
			String th_name= file.getOriginalFilename();
			int index = th_name.lastIndexOf("."); 
			String suffix = th_name.substring(index);
			try {
				String th_picture = UploadFileUtils.uploadFile(classProfilePath, cl.getCl_num()+suffix, file.getBytes(),"\\thumnail", "\\thumnail\\"+me_num);
				ThumbnailVO thumbnail = new ThumbnailVO(th_name,th_picture,cl.getCl_num());
				//업로드 된 썸네일을 DB에 저장
				classDao.insertThumbnail(thumbnail);
				//커리큘럼들을 하나씩 꺼내서 등록
				int crCount=0;
				for(CurriculumVO cr : cl.getList()) {
					++crCount;
					cr.setCr_cl_num(cl.getCl_num());
					classDao.insertCurriculum(cr);
					int vdCount =0;
					
					for(VideoVO vi : cr.getList()) {
						++vdCount;
						String vd_name= vi.getVd_file().getOriginalFilename();
						int index2 = vd_name.lastIndexOf("."); 
						String suffix2 = vd_name.substring(index2);
						String vd_vidoe = UploadFileUtils.uploadFile(classProfilePath, crCount+"_"+vdCount+suffix2, vi.getVd_file().getBytes(),"\\static","\\static\\"+me_num,"\\static\\"+me_num+"\\"+cr.getCr_cl_num());
						vi.setVd_cr_num(cr.getCr_num());
						vi.setVd_vidoe(vd_vidoe);
						classDao.insertVideo(vi);
					}
				}
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

	@Override
	public int getWaitingCount() {
		return classDao.selectWaitingCount();
	}

}