use class101;

insert into category (ca_name) values ("운동"),("프로그래밍"),("생존");

insert into teacher (tc_me_num,tc_intro) values(4,"兵1276期");

insert into class (cl_title,cl_item,cl_intro,cl_money,cl_level,cl_tc_me_num)
values("해병문학","가장 신속한 동작, 가장 큰 목소리,
강인한 정신","무적해병 상승해병 귀신잡는해병대 악!",15000
,"상",4),("수영잘하는법","물안경,수영복","수영은 인생에 한번 배우면 안 까먹는다",20000
,"하",4);

insert into subcategory (sc_name,sc_ca_num,sc_cl_num) values("수영",1,7);

/* GROUP BY 시 속성 에러 발생 해결 쿼리 */
SET GLOBAL SQL_MODE = "STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION";
/* 복구 쿼리 */
SET GLOBAL SQL_MODE = "STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION,ONLY_FULL_GROUP_BY";

ALTER TABLE subscribe
ADD SU_STATUS ENUM('normal', 'regular') DEFAULT 'regular' AFTER SU_CL_NUM;