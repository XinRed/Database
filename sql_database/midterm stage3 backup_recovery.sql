use midterm;

#txt檔
select * into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/t_equipment.txt' from midterm.t_equipment;
select * into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/t_job.txt' from midterm.t_job;
select * into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/t_mount.txt' from midterm.t_mount;
select * into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/t_players.txt' from midterm.t_players;
select * into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/t_skills.txt' from midterm.t_skills;
select * into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/t_guild.txt' from midterm.t_guild;
select * into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/t_user_information.txt' from midterm.t_user_information;

use midterm;
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/t_equipment.txt' into table midterm.t_equipment;
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/t_job.txt'  into table midterm.t_job;
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/t_mount.txt' into table midterm.t_mount;
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/t_players.txt' into table midterm.t_players;
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/t_skills.txt' into table midterm.t_skills;
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/t_guild.txt' into table midterm.t_guild;
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/t_user_information.txt' into table midterm.t_user_information;