<%@ page import = "java.util.*, java.sql.*"%>
<%@ page language = "java" contentType = "text/html; charset=UTF-8"%>

<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>會員</title>
		<link href="user.css" rel="stylesheet">
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
					
					//初始化
					String sql = "";
					
					sql = "create database if not exists db_login;";
					st.executeUpdate(sql);
					sql = "use midterm;";
					st.executeUpdate(sql);
							
					//info設定		
					String info = "請先登入";
					try {
						if (session.getAttribute("s_info").toString().equals("error")) {
							info = "帳號或密碼錯誤！";
						} else if (session.getAttribute("s_info").toString().equals("already_exist")){
							info = "帳號已存在 請嘗試登入";
						} else if (session.getAttribute("s_info").toString().equals("dont_exist")){
							info = "未知的帳號 請嘗試註冊";
						}
					} catch (Exception e) {
						info = "請先登入";
					} 					
					request.setAttribute("info", info);
					
					//error重置	
					session.setAttribute("s_info", "");	
									
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
	
		<form method="post" action="check.jsp">
			<table>
				<tr>
					<td colspan="2">帳號：
						<input type="text" name="f_account"></input>
					</td>
				</tr>			
				<tr>
					<td colspan="2">密碼：
						<input type="password" name="f_password"></input>
					</td>
				</tr>				
				<tr>
					<td>
						<input type="submit" value="登入" formaction="check.jsp"></input>
					</td>
					<td>
						<input type="submit" value="註冊" formaction="signup.jsp"></input>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="reset" value="重新輸入"></input>
					</td>
				</tr>				
				<tr>
					<td colspan="2" class="red">
						<%= request.getAttribute("info") %>
					</td>
				</tr>					
			</table>
		</form>
		
		
	</body>
</html>