SET GLOBAL event_scheduler = On; #이벤트 켜기

SHOW EVENTS; #이벤트 확인

drop event if exists update_delete_event_123;

# 이벤트 실행날짜 변경
ALTER EVENT delete_subscribe_event_2_27
ON SCHEDULE AT '2025-04-26 19:26:00';
