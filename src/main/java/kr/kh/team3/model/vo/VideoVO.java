package kr.kh.team3.model.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class VideoVO {
	private int vd_num;
	private String vd_name;
	private String vd_vidoe;
	private int vd_cr_num;
	private MultipartFile vd_file;
}