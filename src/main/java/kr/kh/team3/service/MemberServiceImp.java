package kr.kh.team3.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.team3.dao.MemberDAO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.pagination.MemberCriteria;

@Service
public class MemberServiceImp implements MemberService{

	@Autowired
	private MemberDAO memberDao;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public String getPw(String me_id) {
		return memberDao.getPw(me_id);
	}

	@Override
	public MemberVO getMemberId(String me_id) {
		 return memberDao.selectMember(me_id);
	}

	@Override
	public void insertMember(MemberVO member) {
		 memberDao.insertMember(member);
		
	}


	@Override
	public void onlineMember(MemberVO member) {
		memberDao.onlineMember(member);
		
	}

	@Override
	public void offlineMember(MemberVO member) {
		memberDao.offlineMember(member);
	}
	
	public MemberVO login(MemberVO member) {
		if(member == null) {
			return null;
		}
		MemberVO user = memberDao.selectLogin(member.getMe_id());
		//아이디가 일치하지 않을 때 
		if(user == null) {
			return null;
		}
		//비번이 일치하지 않을 때
		if(!passwordEncoder.matches(member.getMe_pw(), user.getMe_pw())) {
			return null;
		}
		//아이디 비번이 다 일치할 때
		return user;
	}
	
	@Override
	public boolean insertSingup(MemberVO member, MultipartFile fileList) {
	    if(member == null) return false;

	    // 비밀번호 암호화
	    String encPw = passwordEncoder.encode(member.getMe_pw());
	    member.setMe_pw(encPw);

	    // 프로필 이미지 저장
	    if(fileList != null && !fileList.isEmpty()) {
	        try {
	        	String uploadPath = "C:/han/upload/profile"; // 또는 resources/static 등등
	            File folder = new File(uploadPath);
	            if(!folder.exists()) folder.mkdirs();

	            String fileName = UUID.randomUUID().toString() + "_" + fileList.getOriginalFilename();
	            File dest = new File(uploadPath, fileName);
	            fileList.transferTo(dest);

	            member.setMe_profile(fileName); // 저장된 파일명을 DB에 넣기
	        } catch(Exception e) {
	            e.printStackTrace();
	            return false;
	        }
	    }

	    try {
	        return memberDao.insertSignup(member);
	    } catch(Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}

	@Override
	public boolean checkId(String id) {
		MemberVO user = memberDao.selectMember(id);
		return user == null;
	}

	@Override
	public List<MemberVO> getMemberList(MemberCriteria cri) {
		
		return memberDao.selectMemberList(cri);
	}

	@Override
	public boolean createMemberList(int me_num) {
		
		return memberDao.createMember(me_num);
	}

	@Override
	public boolean clearMemberList(int me_num) {
		
		return memberDao.clearMember(me_num);
	}

	@Override
	public boolean updateUser(MemberVO member, MemberVO user, MultipartFile file) {
		if(member == null || user == null) {
			return false;
		}
		//MemberVO user = memberDao.selectMember(member.getMe_id());
		if (user == null || user.getMe_pw() == null || member.getMe_pw() == null) {
		    return false;
		}
		if(!passwordEncoder.matches(member.getMe_pw(), user.getMe_pw())) {
			return false;
		}
		if(member.getMe_newPassword() != null && !member.getMe_newPassword().isBlank()) {
			String encPw = passwordEncoder.encode(member.getMe_newPassword());
			user.setMe_pw(encPw);
		}
		if (file != null && !file.isEmpty()) {
	        try {
	        	String uploadPath = "C:/han/upload/profile";
	            File folder = new File(uploadPath);
	            if (!folder.exists()) folder.mkdirs();

	            String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
	            File dest = new File(uploadPath, fileName);
	            file.transferTo(dest);

	            user.setMe_profile(fileName);
	        } catch (Exception e) {
	            e.printStackTrace();
	            return false;
	        }
	    } 
		try {
			user.setMe_nick(member.getMe_nick());
	        return memberDao.updateUser(user);
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}

	@Override
	public void updateCookie(MemberVO user) {
		memberDao.updateCookie(user);
		
	}

	@Override
	public MemberVO getMemberByCookie(String cookieId) {
		return memberDao.selectMemberByCookie(cookieId);
	}

	@Override
	public boolean setTeacher(int me_num) {
		
		return memberDao.setTeacher(me_num);
	}

	
}
