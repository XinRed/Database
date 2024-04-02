use midterm;
drop procedure if exists guild_member_list;

delimiter $
create procedure guild_member_list (v_account varchar(20))
begin
	# 輸入 account
    # 列出同樣 guild_ID 的玩家
    # 輸出 c_Player_Id, c_Player_Name, c_Player_Level, player_contribution, player_join_guild_time
    
    declare v_player_id varchar(4);
    declare v_guild_id varchar(4);
    
	select player_ID into v_player_id
		from t_user_information
        where user_account = v_account;
    
    select guild_ID into v_guild_id
		from t_players
        where c_Player_Id = v_player_id;
        
     select c_Player_Id, c_Player_Name, c_Player_Level, player_contribution, player_join_guild_time
		from t_players
        where guild_ID = v_guild_id;
   
end $
delimiter ;