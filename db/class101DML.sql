insert into category (ca_name) values ("음악"),("영화"),("요리");
insert into class (cl_title,cl_item,cl_intro,cl_money,cl_level,cl_tc_me_num)
values("해병문학","가장 신속한 동작, 가장 큰 목소리,
강인한 정신","무적해병 상승해병 귀신잡는해병대 악!",15000
,"상",2),("수영잘하는법","물안경,수영복","수영은 인생에 한번 배우면 안 까먹는다",20000
,"하",2);
insert into teacher (tc_me_num,tc_intro) values(2,"반갑습니다 저는 수영선수 박해완입니다");

insert into subcategory (sc_name,sc_ca_num,sc_cl_num) values("수영",1,1);