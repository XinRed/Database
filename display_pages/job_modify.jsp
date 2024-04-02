<%@ page contentType = "text/html; charset=UTF-8"%>
<%@ page pageEncoding = "utf-8" %>
<%@ page language = "Java" %>
<%@ page import = "java.util.*, java.sql.*" %>

<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>職業修改</title>
		<link href="job.css"rel="stylesheet">
	</head>
	<body>
		<%
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				
				try{			
					String url = "jdbc:mysql://localhost/?serverTimezone=UTC";
					Connection con = DriverManager.getConnection(url, "root", "lws14119");
					Statement st = con.createStatement();
					String sql = "";
					String sql_get = "";
					
					if(!con.isClosed()){
					} else {
						out.print("連線失敗");
					}
					
					//指令區
								
					sql = "use `midterm`; ";
					st.execute(sql);
					//直接執行 execute()
					
					sql = "select count(*) from `t_job`; ";
					ResultSet r = st.executeQuery(sql);
					
					//使用 r 作為 ResultSet 儲存 executeQuery() 的結果
					
					request.setCharacterEncoding("UTF-8");
					String in_num = request.getParameter("number");
					String in_name = request.getParameter("name");
					String in_mainskill = request.getParameter("mainskill");
					String in_minorskill = request.getParameter("minorskill");
					String in_passiveskill = request.getParameter("passiveskill");
					String in_awakenedskill = request.getParameter("awakenedskill");
					
					sql_get = "select * from t_skills where c_Skill_Name = '" + in_mainskill + "';";
					ResultSet r_get = st.executeQuery(sql_get);
					while(r_get.next()){
						in_mainskill = r_get.getString("c_Skill_Id");
					}
					sql_get = "select * from t_skills where c_Skill_Name = '" + in_minorskill + "';";
					r_get = st.executeQuery(sql_get);
					while(r_get.next()){
						in_minorskill = r_get.getString("c_Skill_Id");
					}
					sql_get = "select * from t_skills where c_Skill_Name = '" + in_passiveskill + "';";
					r_get = st.executeQuery(sql_get);
					while(r_get.next()){
						in_passiveskill = r_get.getString("c_Skill_Id");
					}
					sql_get = "select * from t_skills where c_Skill_Name = '" + in_awakenedskill + "';";
					r_get = st.executeQuery(sql_get);
					while(r_get.next()){
						in_awakenedskill = r_get.getString("c_Skill_Id");
						sql = "UPDATE `t_job` SET "
							+ "`c_Job_Name` = '" + in_name + "', "
							+ "`c_MainSkill_id` = '" + in_mainskill + "', "
							+ "`c_MinorSkill_id` = '" + in_minorskill + "', "
							+ "`c_PassiveSkill_id` = '" + in_passiveskill + "', "
							+ "`c_AwakenedSkill_id` = '" + in_awakenedskill + "' "
							+ "WHERE `c_Job_Id` = '" + in_num + "';";
						st.executeUpdate(sql);
						response.setHeader("Refresh", "0.1; url=job.jsp");
					}
					
					//指令區關閉
					r.close();
					r_get.close();
					st.close(); //關閉語句並釋放資源
					con.close(); //關閉連接並釋放資源
				} catch(SQLException e){
					out.print("SQL錯誤!" + e.toString());
				}
				
			} catch(ClassNotFoundException e) {
				out.print("Class錯誤! " + e.toString());
			}
		%>	
	</body>
</html>