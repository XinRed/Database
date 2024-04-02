use midterm;
drop procedure if exists guild_information;

delimiter $
create procedure guild_information (v_account varchar(20))
begin
	# 輸入 account
    # 輸出guild_name, guild_creator, guild_creator的c_Player_Name, guild_create_time, guild_Lv, guild_people_num, guild_combat_effectiveness
    
    declare v_player_id varchar(4);
    declare v_guild_id varchar(4);
    
	select player_ID into v_player_id
		from t_user_information
        where user_account = v_account;
    
    select guild_ID into v_guild_id
		from t_players
        where c_Player_Id = v_player_id;
        
    select t_guild.guild_name, t_guild.guild_creator, t_players.c_Player_Name, t_guild.guild_create_time, t_guild.guild_Lv, t_guild.guild_people_num, t_guild.guild_combat_effectiveness
		from t_guild
			join t_players on t_guild.guild_creator = t_players.c_Player_Id
        where t_guild.guild_ID = v_guild_id;
    
end $
delimiter ;