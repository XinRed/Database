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
					} else {
						out.println("連線成功");
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
					
					String old_p = request.getParameter("f_password_old"); 
					String new_p = request.getParameter("f_password_new"); 
					String confirm_p = request.getParameter("f_password_confirm"); 
					
					String s_account = session.getAttribute("s_account").toString();		
					sql = "select user_password from t_user_information where user_account = '" + s_account + "'";
					ResultSet rs = st.executeQuery(sql);
					
					String err = "";
					String sql_password = "";
					
					//輸入判定
					try {
						if (rs.next()) {
						sql_password = rs.getString(1);
						
						if (!old_p.equals(sql_password)) {
							err = "舊密碼不正確";
						} else {
							if (!new_p.equals(confirm_p)) {
								err = "新密碼輸入不同";
							} else {
								if (new_p.equals(old_p)) {
									err = "新密碼與舊密碼相同";
								}
							}
						}
					}
					} catch (Exception e) {
						err = "輸入不完整 請重新輸入";
					}
					
					//修改密碼
					if (err.equals("")) {
						sql = "update t_user_information set user_password = '" + new_p + "' WHERE `user_account` = '" + s_account + "';";
						st.executeUpdate(sql);
						response.setHeader("Refresh", "0.5; url=user.jsp");
					}
					
					%>
						<form method="post">
							<table>		
								<tr>
									<td colspan="2">帳號：
										<%= s_account %>
									</td>
								</tr>	
								<tr>
									<td colspan="2">
										輸入舊密碼：
										<input type="text" name="f_password_old"></input>
									</td>
								</tr>			
								<tr>
									<td colspan="2">
										輸入新密碼：
										<input type="text" name="f_password_new"></input>
									</td>
								</tr>	
								<tr>
									<td colspan="2">
										確認新密碼：
										<input type="text" name="f_password_confirm"></input>
									</td>
								</tr>				
								<tr>
									<td>
										<input type="submit" value="修改"></input>
									</td>
									<td>	
										<input type="reset" value="重新輸入"></input>
									</td>
								</tr>				
								<tr>
									<td colspan="2">
										<a href="user.jsp">
											<input type="button" value="取消"></input>
										</a>
									</td>
								</tr>			
								<tr>
									<td colspan="2" class="red">
										<%= err %>
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