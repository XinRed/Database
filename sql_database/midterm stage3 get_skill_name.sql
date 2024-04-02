drop procedure if exists get_skill_name;

delimiter $
create procedure get_skill_name (v_account varchar(20))
begin
	declare v_player_id varchar(4);
    declare v_job_id varchar(4);
    declare v_job_name varchar(10);
    declare v_major_name varchar(10);
	declare v_minor_name varchar(10);
	declare v_awakened_name varchar(10);
	declare v_passive_name varchar(10);
    
	select player_ID into v_player_id
		from t_user_information
        where user_account = v_account;
    
    select c_Job_Id into v_job_id
		from t_players
        where c_Player_Id = v_player_id;
        
    select c_Job_Name into v_job_name
		from t_job
        where c_Job_Id = v_job_id;
    
	select mainskill_view.主技能 into v_major_name
		from mainskill_view
		where mainskill_view.職業名稱 = v_job_name;
	select minorskill_view.副技能 into v_minor_name
		from minorskill_view
		where minorskill_view.職業名稱 = v_job_name;
	select awakenskill_view.覺醒技能 into  v_awakened_name
		from awakenskill_view
		where awakenskill_view.職業名稱 = v_job_name;
	select passiveskill_view.被動技能 into  v_passive_name
		from passiveskill_view
		where passiveskill_view.職業名稱 = v_job_name;
        
	select v_major_name, v_minor_name, v_awakened_name, v_passive_name;
end $
delimiter ;