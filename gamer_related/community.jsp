<%@ page contentType = "text/html; charset=UTF-8"%>
<%@ page pageEncoding = "utf-8" %>
<%@ page language = "Java" %>
<%@ page import = "java.util.*, java.sql.*" %>

<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>社群</title>
		<link href="community.css"rel="stylesheet">
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
							<div class="selected">
								<a href="../gamer_related/community.jsp">社群</a>
							</div>
							<div>
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
						
						sql = "call guild_information('" + s_account + "');";
						ResultSet rs_guild_info = st.executeQuery(sql);
						rs_guild_info.next();
						String sql_guild_creater = rs_guild_info.getString(2);
						
						%>
							<table class="view bg info">
								<tr>
									<td rowspan="2" colspan="2" class="purple_b">
										<%= rs_guild_info.getString(1) %>
									</td>
									<td>
										創建時間<br>
										<span class="green"><%= rs_guild_info.getString(4) %></span>
									</td>
								</tr>
								<tr>
									<td>
										公會戰力 <span class="purple"><%= rs_guild_info.getString(7) %></span>
									</td>
								</tr>
								<tr>
									<td class="gold_n">
										Lv.<%= rs_guild_info.getString(5) %>
									</td>
									<td class="blue_n">
										創建者 <%= rs_guild_info.getString(3) %>
									</td>
									<td>
										公會人數
										<span class="gold_n">
											<%= rs_guild_info.getString(6) %>/<%= Integer.valueOf(rs_guild_info.getString(5))*20 %>
										</span>
									</td>
								</tr>
							</table> 
						<%
				
						rs_guild_info.close();
						
						sql = "select player_ID from t_user_information where user_account = '" + s_account + "';";
						ResultSet rs_user_id = st.executeQuery(sql);
						rs_user_id.next();
						String sql_player_id = rs_user_id.getString(1);
						rs_user_id.close();
						
						sql = "call guild_member_list('" + s_account + "');";
						ResultSet rs_guild_member = st.executeQuery(sql);
						if (sql_guild_creater.equals(sql_player_id)) {
							//顯示可修改資料
							while (rs_guild_member.next()) {
								if (rs_guild_member.getString(1).equals(sql_guild_creater)) {
									%>
										<table class="view bg">
											<tr>
												<td>
													<span class="blue"><%= rs_guild_member.getString(2) %></span>
													<br>
													<span class="gold">Lv.<%= rs_guild_member.getString(3) %></span>
												</td>
												<td>
													公會貢獻
												</td>
												<td class="purple">
													<%= rs_guild_member.getString(4) %>
												</td>
												<td>
													加入時間
												</td>
												<td class="green">
													<%= rs_guild_member.getString(5) %>
												</td>
												<td>
													<input type="button" value="創建者"></input>
												</td>
											</tr>
										</table> 
									<%
								} else {
									%>
									<form method="post" action="member_delete.jsp">
										<table class="view bg">
											<tr>
												<td>
													<span class="blue"><%= rs_guild_member.getString(2) %></span>
													<br>
													<span class="gold">Lv.<%= rs_guild_member.getString(3) %></span>
												</td>
												<td>
													公會貢獻
												</td>
												<td class="purple">
													<%= rs_guild_member.getString(4) %>
												</td>
												<td>
													加入時間
												</td>
												<td class="green">
													<%= rs_guild_member.getString(5) %>
												</td>
												<td>
													<input type="hidden" name="f_id" value="<%= rs_guild_member.getString(1) %>"></input>
													<input type="submit" value="刪除"></input>
												</td>
											</tr>
										</table> 
									</form>
								<%
								}
							}
						} else {
							//顯示資料
							while (rs_guild_member.next()) {
								%>
									<table class="view bg">
										<tr>
											<td>
												<span class="blue"><%= rs_guild_member.getString(2) %></span>
												<br>
												<span class="gold">Lv.<%= rs_guild_member.getString(3) %></span>
											</td>
											<td>
												公會貢獻
											</td>
											<td class="purple">
												<%= rs_guild_member.getString(4) %>
											</td>
											<td>
												加入時間
											</td>
											<td class="green">
												<%= rs_guild_member.getString(5) %>
											</td>
										</tr>
									</table> 
								<%
							}
						}
						rs_guild_member.close();
						
						
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