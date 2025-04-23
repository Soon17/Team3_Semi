package kr.kh.team3.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CommentVO {

	private int co_num;
	private String co_content;
	private Date co_date;
	private int co_me_num;
	private int co_cl_num;
	private String me_nick;
}
