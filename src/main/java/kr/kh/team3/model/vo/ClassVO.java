package kr.kh.team3.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ClassVO {
	private int cl_num;
	private String cl_title;
	private String cl_item;
	private String cl_intro;
	private int cl_money;
	private Date cl_date;
	private String cl_level;
	private String cl_able;
	private int cl_tc_me_num;
	private String me_name;
	//서브카테고리 담는곳
	private String sc_name;
	private String cl_th_picture;
}
