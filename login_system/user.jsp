<%@ page import = "java.util.*, java.sql.*"%>
<%@ page language = "java" contentType = "text/html; charset=UTF-8"%>

<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>會員</title>
		<link href="user.css"rel="stylesheet">
	</head>
	<body>
		<%
			//載入資料庫驅動程式
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				
				//建立連線
				try {
					String url = "jdbc:mysql://localhost/?serverTimezone=UTC";
					Connection con = DriverManager.getConnection(url, "root", "lws14119");
					Statement st = con.createStatement();
					
					if(con.isClosed()) {
						out.println("連線失敗");
					}
					
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
							<div>
								<a href="../gamer_related/gamer.jsp">玩家</a>
							</div>
							<div class="selected">
								<a href="../login_system/user.jsp">會員</a>
							</div>
						</nav>
					<%
					
					//指令區
					String sql = "";
					
					sql = "use midterm";
					st.execute(sql);
					
					//取得資料
					try {
						String s_account = session.getAttribute("s_account").toString();
					} catch (Exception e) {
						response.setHeader("Refresh", "0.01; url=login.jsp");
					}
					
					String s_account = session.getAttribute("s_account").toString();
					sql = "select * from t_user_information where user_account = '" + s_account + "'";
					ResultSet user_data = st.executeQuery(sql);
					
					String user_status = "";					
					String user_age = "";
					String user_sex = "";	
					
					user_data.next();
					
					if (user_data.getString(5).toString().equals("player")) {
						user_status = "玩家";
					} else if (user_status.equals("developer")) {
						user_status = "開發者";
					}
					
					if (user_data.getString(7).toString().equals("0")) {
						user_age = "";
					} else {
						user_age = user_data.getString(7).toString() + "歲";
					}
					
					if (user_data.getString(8).toString().equals("F")) {
						user_sex = "女性";
					} else if (user_data.getString(8).toString().equals("M")) {
						user_sex = "男性";
					} else {
						user_sex = "未知";
					}
					
					//角色姓名					
					sql = "select c_Player_Name from t_players where c_Player_Id = '" + user_data.getString(11) + "'";
					ResultSet user_player_name = st.executeQuery(sql);
					user_data.close();
					
					String user_character = "";
					if (user_player_name.next()) {
						user_character = user_player_name.getString(1);
					} else {
						user_character = "尚未擁有";
					}	

					user_player_name.close();
					
					//再次開啟用戶資料
					sql = "select * from t_user_information where user_account = '" + s_account + "'";
					user_data = st.executeQuery(sql);
					
					user_data.next();
					
					%>
						<table>		
							<tr>
								<td colspan="2" class="green">
									登入成功 <br>
									歡迎回來！<%= user_status %> <%= user_data.getString(2) %>
								</td>
							</tr>	
							<tr>
								<td class="label">
									用戶帳號：
								</td>
								<td class="data">
									<%= user_data.getString(4) %>
								</td>
							</tr>	
							<tr>
								<td class="label">
									用戶名稱：
								</td>
								<td class="data">
									<%= user_data.getString(2) %>
								</td>
							</tr>
							</tr>	
							<tr>
								<td class="label">
									用戶國籍：
								</td>
								<td class="data">
									<%= user_data.getString(6) %>
								</td>
							</tr>
							</tr>	
							<tr>
								<td class="label">
									用戶年紀：
								</td>
								<td class="data">
									<%= user_age %>
								</td>
							</tr>
							</tr>	
							<tr>
								<td class="label">
									用戶性別：
								</td>
								<td class="data">
									<%= user_sex %>
								</td>
							</tr>	
							<tr>
								<td class="label">
									綁定郵箱：
								</td>
								<td class="data">
									<%= user_data.getString(9) %>
								</td>
							</tr>	
							<tr>
								<td class="label">
									綁定電話：
								</td>
								<td class="data">
									<%= user_data.getString(10) %>
								</td>
							</tr>
							<tr>
								<td class="label">
									擁有角色：
								</td>
								<td class="data">
									<%= user_character %>
								</td>
							</tr>
							<tr>
								<td>
									<a href="modify_password.jsp">
										<input type="button" value="修改密碼"></input>
									</a>
								</td>
								<td>
									<a href="modify_data.jsp">
										<input type="button" value="修改資料"></input>
									</a>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<a href="logout.jsp">
										<input type="button" value="登出"></input>
									</a>
								</td>
							</tr>		
						</table>
					<%						
					//關閉連線
					st.close();
					con.close();
					
				} catch (SQLException sqle) {
					out.println("無法連線SQL " + sqle.toString());
				}
				
			} catch (ClassNotFoundException cnfe) {
				out.println("無法找到Class " + cnfe.toString());
			}
		%>
	</body>
</html>