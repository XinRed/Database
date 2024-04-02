<%@ page contentType = "text/html; charset=UTF-8"%>
<%@ page pageEncoding = "utf-8" %>
<%@ page language = "Java" %>
<%@ page import = "java.util.*, java.sql.*" %>

<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>公會</title>
		<link href="guild.css"rel="stylesheet">
		<style>
		</style>
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
			
			if(!con.isClosed()){
				out.print("");
			} else {
				out.print("連線失敗");
			}
			
			//指令區
						
			sql = "use `midterm`; ";
			st.execute(sql);
			//直接執行 execute()
			
			sql = "select * from `guild_view`; ";
			ResultSet r = st.executeQuery(sql);
			//使用 r 作為 ResultSet 儲存 executeQuery() 的結果
					
			String display_mode = "";
					try {
						display_mode = session.getAttribute("s_status").toString();
					} catch (Exception e) {
						display_mode = "None";
					}			
			//SQL插入
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
					<div class="selected">
						<a href="../display_pages/guild.jsp">公會</a>
					</div>
					<div>
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
						
			sql = "select * from `guild_view`; ";
			r = st.executeQuery(sql);
			//使用 r 作為 ResultSet 儲存 executeQuery() 的結果
			
			
			//顯示表單
			while(r.next()) {
				
				if (display_mode.equals("developer")) {
					%>
						<form method="post" action="" name="form<%=  r.getString(1) %>">
							<table class="edit bg">
								<tr> 
									<td rowspan="2" class="number">
										<input type="text" name="number" value="<%=  r.getString(1) %>"></input>
									</td> 
									<td class="lable purple">
										公會名稱
									</td>
									<td class="input">
										<input type="text" name="name" class="purple" value="<%=  r.getString(2) %>"></input>
									</td>
									<td class="green lable">
										公會等級
									</td>
									<td class="input">
										<input type="text" name="lv" class="green" value="<%=  r.getString(5) %>"></input>
									</td>
									<td class="green lable">
										公會戰力
									</td>
									<td class="input">
										<input type="text" name="combat_effectiveness" class="green" value="<%=  r.getString(7) %>"></input>
									</td>
									<td rowspan="2" class="edit">
										<input type="submit" name="modify" value="修改" formaction="guild_modify.jsp"></input>
										<input type="submit" name="delete" value="刪除" formaction="guild_delete.jsp"></input>
									</td> 
								</tr>
								<tr>
									<td class="lable blue">
										<span>創建者</span>
									</td>
									<td class="input">
										<input type="text" name="creator" class="blue"value="<%=  r.getString(3) %>"></input>
									</td>
									<td class="green lable">
										創建時間
									</td>
									<td class="input ct">
										<input type="text" name="creater_time" class="green" value="<%=  r.getString(4) %>"></input>
									</td>
									<td class="green lable">
										公會人數
									</td>
									<td class="input">
										<input type="text" name="people_quantity" class="green" value="<%=  r.getString(6) %>"></input>
									</td>				
								</tr>				
							</table>
						</form>
					<%
				} else {
					%>  
						<table class="view bg">
							<tr> 
								<td rowspan="2" class="number"><%= r.getString(1) %></td> 
								<td>
									<span class="purple"><%= r.getString(2) %></span>
								</td>
								<td>
									公會等級:
									<span class="green"><%= r.getString(5) %></span>
								</td>
								<td>
									公會戰力:
									<span class="green"><%= r.getString(7) %></span>
								</td>
							</tr>
							<tr>
								<td class="lable">
									創建者
									<span class="blue"><%= r.getString(3) %></span>
								</td>
								<td>
									創建時間:
									<span class="green"><%= r.getString(4) %></span>
								</td>
								<td>
									公會人數:
									<span class="green"><%= r.getString(6) %></span>
								</td>
							</tr> 
						</table> 
					<%
				}
			}					
			
			//指令區關閉
			r.close();
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