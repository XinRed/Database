<%@ page contentType = "text/html; charset=UTF-8"%>
<%@ page pageEncoding = "utf-8" %>
<%@ page language = "Java" %>
<%@ page import = "java.util.*, java.sql.*" %>

<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>公會修改</title>
		<link href="guild.css"rel="stylesheet">
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
					
					sql = "select count(*) from `t_guild`; ";
					ResultSet r = st.executeQuery(sql);
					
					//使用 r 作為 ResultSet 儲存 executeQuery() 的結果
					
					request.setCharacterEncoding("UTF-8");
					String in_num = request.getParameter("number");
					String in_name = request.getParameter("name");
					String in_creator = request.getParameter("creator");
					String in_creater_time = request.getParameter("creater_time");
					String in_lv = request.getParameter("lv");
					String in_people_quantity = request.getParameter("people_quantity");
					String in_combat_effectiveness = request.getParameter("combat_effectiveness");
					sql_get = "select * from t_players where c_Player_Name = '" + in_creator + "';";
					ResultSet r_get = st.executeQuery(sql_get);
					while(r_get.next()){
						in_creator = r_get.getString("c_Player_Id");
						sql = "UPDATE `t_guild` SET "
									+ "`guild_name` = '" + in_name + "', "
									+ "`guild_creator` = '" + in_creator + "', "
									+ "`guild_create_time` = '" + in_creater_time + "', "
									+ "`guild_Lv` = '" + in_lv + "', "
									+ "`guild_people_num` = '" + in_people_quantity + "', "
									+ "`guild_combat_effectiveness` = '" + in_combat_effectiveness + "' "
									+ "WHERE `guild_ID` = '" + in_num + "';";
						st.executeUpdate(sql);
						response.setHeader("Refresh", "0.1; url=guild.jsp");
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