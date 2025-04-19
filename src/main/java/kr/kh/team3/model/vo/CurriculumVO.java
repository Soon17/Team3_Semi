package kr.kh.team3.model.vo;

import java.util.List;

import lombok.Data;


@Data
public class CurriculumVO {
	private int cr_num;
	private int cr_cl_num;
	private String cr_title;
	
	//비디오
    private int vd_num;
    private String vd_name;
    private String vd_vidoe;
    private List<VideoVO> list;
}