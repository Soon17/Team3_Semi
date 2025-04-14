insert into category (ca_name) values ("운동"),("프로그래밍"),("생존");
insert into class (cl_title,cl_item,cl_intro,cl_money,cl_level,cl_tc_me_num)
values("해병문학","가장 신속한 동작, 가장 큰 목소리,
강인한 정신","무적해병 상승해병 귀신잡는해병대 악!",15000
,"상",1),("수영잘하는법","물안경,수영복","수영은 인생에 한번 배우면 안 까먹는다",20000
,"하",1);
insert into teacher (tc_me_num,tc_intro) values(1,"兵1276期");

insert into subcategory (sc_name,sc_ca_num,sc_cl_num) values("수영",4,4);