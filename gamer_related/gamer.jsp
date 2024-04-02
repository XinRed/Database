<%@ page contentType = "text/html; charset=UTF-8"%>
<%@ page pageEncoding = "utf-8" %>
<%@ page language = "Java" %>
<%@ page import = "java.util.*, java.sql.*" %>

<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>玩家</title>
		<link href="gamer.css"rel="stylesheet">
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
					
					if(con.isClosed()){
						out.print("連線失敗");
					}
					
					//指令區
								
					sql = "use `midterm`; ";
					st.execute(sql);
					//直接執行 execute
					
					%>
						<nav>
							<div>
								<a href="../display_pages/job.jsp">職業</a>
							</div>
							<div>
								<a href="../display_pages/skills.jsp">技能</a>
							</div>
							<div>
								<a href="../display_pages/equipment.jsp">裝備</a>
							</div>
							<div>
								<a href="../display_pages/mount.jsp">坐騎</a>
							</div>
							<div>
								<a href="../display_pages/guild.jsp">公會</a>
							</div>
							<div>
								<a href="../gamer_related/community.jsp">社群</a>
							</div>
							<div class="selected">
								<a href="../gamer_related/gamer.jsp">玩家</a>
							</div>
							<div>
								<a href="../login_system/user.jsp">會員</a>
							</div>
						</nav>
					<%
					
					
					String display_mode = "";
					try {
						display_mode = session.getAttribute("s_status").toString();
					} catch (Exception e) {
						display_mode = "None";
					}
						
					if (display_mode.equals("None")) {
						%>  
							<table class="bg">
								<tr>
									<td class="warning">
										🔒<br>
										噢! 看來您需要先登入才行喔!
									</td>
								</tr>
							</table> 
						<%
						response.setHeader("Refresh", "5; url=../login_system/user.jsp");
					} else if (display_mode.equals("developer")){
						%>  
							<table class="bg">
								<tr>
									<td class="warning">
										❌<br>
										您並未擁有任何玩家角色
									</td>
								</tr>
							</table> 
						<%
					} else {
						
						String s_account = session.getAttribute("s_account").toString();
						
						//取得技能名稱
						sql = "call get_skill_name('" + s_account + "');";
						ResultSet rs_skill_name = st.executeQuery(sql);
						rs_skill_name.next();
						
						String major_skill_name = rs_skill_name.getString(1);
						String minor_skill_name = rs_skill_name.getString(2);
						String awakened_skill_name = rs_skill_name.getString(3);
						String passive_skill_name = rs_skill_name.getString(4);
						
						rs_skill_name.close();
						
						//取得玩家id
						sql = "select player_ID from t_user_information where user_account = '" + s_account + "';";
						ResultSet rs_player_id = st.executeQuery(sql);
						rs_player_id.next();
						
						//取得玩家資訊
						sql = "select * from `v_player_list` where `c_Player_Id` = '" + rs_player_id.getString(1) + "';";
						ResultSet rs_player_data = st.executeQuery(sql);
						rs_player_id.close();
						rs_player_data.next();
						
						//顯示資料						
						%>
							<table class="view bg">
								<tr>
									<td colspan="2" rowspan="3">
										<span class="red">
											<%= rs_player_data.getString(5) %>屬 <%= rs_player_data.getString(2) %>
										</span>
										<br>
										<span class="blue"><%= rs_player_data.getString(3) %></span>
										<br>
										<span class="gold">Lv.<%= rs_player_data.getString(4) %></span>
									</td>
									<td colspan="2">
										隸屬 <span class="purple"><%= rs_player_data.getString(6) %></span>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										當前裝備 <span class="green"><%= rs_player_data.getString(7) %></span>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										當前坐騎 <span class="green"><%= rs_player_data.getString(8) %></span>
									</td>
								</tr>
								<tr class="skill_name">
									<td>
										<%= major_skill_name %>
									</td>
									<td>
										<%= minor_skill_name %>
									</td>
									<td>
										<%= awakened_skill_name %>
									</td>
									<td>
										<%= passive_skill_name %>
									</td>
								</tr>
								<tr class="hr">
									<td>
										<hr>
									</td>
									<td>
										<hr>
									</td>
									<td>
										<hr>
									</td>
									<td>
										<hr>
									</td>
								</tr>
								<tr class="skill_level">
									<td>
										<%= rs_player_data.getString(9) %>階
									</td>
									<td>
										<%= rs_player_data.getString(10) %>階
									</td>
									<td>
										<%= rs_player_data.getString(11) %>階
									</td>
									<td>
										無階級
									</td>
								</tr>
							</table> 
						<%
					}
					
					//指令區關閉
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