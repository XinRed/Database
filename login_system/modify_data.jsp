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
					String s_account = session.getAttribute("s_account").toString();		
					sql = "select * from t_user_information where user_account = '" + s_account + "'";
					ResultSet user_data = st.executeQuery(sql);
					user_data.next();
					
					String user_sex = "";
										
					if (user_data.getString(8).toString().equals("F")) {
						user_sex = "女性";
					} else if (user_data.getString(8).toString().equals("M")) {
						user_sex = "男性";
					}
					
					
					%>
						<form method="post" class="input_bigger" action="data_input.jsp">
							<table>		
								<tr>
									<td colspan="2">
										用戶帳號：
										<input type="text" name="f_account" value="<%= user_data.getString(4) %>"></input>
									</td>
								</tr>	
								<tr>
									<td colspan="2">
										用戶名稱：
										<input type="text" name="f_name" value="<%= user_data.getString(2) %>"></input>
									</td>
								</tr>	
								<tr>
									<td colspan="2">
										用戶國籍：
										<input type="text" name="f_country" value="<%= user_data.getString(6) %>"></input>
									</td>
								</tr>	
								<tr>
									<td colspan="2">
										用戶年紀：
										<input type="text" name="f_age" value="<%= user_data.getString(7) %>"></input>
									</td>
								</tr>	
								<tr>
									<td colspan="2">
										用戶性別：
										<input type="text" name="f_sex" value="<%= user_sex %>"></input>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										綁定郵箱：
										<input type="text" name="f_gmail" value="<%= user_data.getString(9) %>"></input>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										綁定電話：
										<input type="text" name="f_phone" value="<%= user_data.getString(10) %>"></input>
									</td>
								</tr>
								<tr>
									<td>
										<input type="submit" value="修改資料"></input>
									</td>
									<td>	
										<input type="reset" value="重置資料"></input>
									</td>
								</tr>				
								<tr>
									<td colspan="2">
										<a href="user.jsp">
											<input type="button" value="取消"></input>
										</a>
									</td>
								</tr>		
							</table>
						</form>
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