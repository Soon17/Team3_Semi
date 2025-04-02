package kr.kh.team3.model.vo;

import lombok.Data;

@Data
public class MemberVO {
	private int me_num ;
    private String me_name;
    private String me_id;
    private String me_pw ;
    private String me_nick ;
    private String me_email;
    private String me_number;
    private String me_authority;
    private String me_online;
    private String me_del ;
    private String me_profile;
}