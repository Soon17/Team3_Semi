package kr.kh.team3.model.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class VideoVO {
    private String vd_name;                   // 영상 제목
    private String vd_vidoe;                  // DB에 저장될 경로
    private MultipartFile uploadFile;         // 업로드 받을 때만 사용하는 임시 파일
    private int vd_cr_num;                    // 커리큘럼 번호 외래키 등 필요시 추가
}