package kr.kh.team3.model.vo;

import lombok.Data;

@Data
public class ThumbnailVO {
	private int th_num;
	private String th_name;
	private String th_picture;
	private int th_cl_num;
	public ThumbnailVO(String th_name, String th_picture, int th_cl_num) {
		this.th_name = th_name;
		this.th_picture = th_picture;
		this.th_cl_num = th_cl_num;
	}
	
}
