insert into category (ca_name) values ("음악"),("영화"),("요리");
insert into class (cl_title,cl_item,cl_intro,cl_money,cl_level,cl_tc_me_num)
values("쉽게 배우는 자바","컴퓨터 손가락","자바를 마스터하면 뭐든 쉽다!",13000
,"중",2),("파이썬 잘하는 법","컴퓨터 손가락","파이썬 세상에서 제일 쉽습니다!!",20000
,"하",2);
insert into teacher (tc_me_num,tc_intro) values(2,"반갑습니다 저는 수영선수 박해완입니다");

insert into subcategory (sc_name,sc_ca_num,sc_cl_num) values("파이썬",3,4);