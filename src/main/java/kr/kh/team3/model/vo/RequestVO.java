package kr.kh.team3.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class RequestVO {
	private int rq_name;
	private String rq_state; 
	private Date rq_date;
	private String rq_content;
	private int rq_me_num;
}
