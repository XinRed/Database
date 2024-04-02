<%@ page contentType = "text/html; charset=UTF-8"%>
<%@ page pageEncoding = "utf-8" %>
<%@ page language = "Java" %>
<%@ page import = "java.util.*, java.sql.*" %>

<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>職業</title>
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
					sql_get = "SELECT COUNT(*) FROM t_skills WHERE c_Skill_Name = ?";
					PreparedStatement ps_checkSkill = con.prepareStatement(sql_get);
					
					if(con.isClosed()){
						out.print("連線失敗");
					}
					request.setCharacterEncoding("UTF-8");
					// nav 修改到這裡 並更新 裝備、坐騎、公會都有 ../display_pages/XXX
					%>
						<nav>
							<div class="selected">
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
							<div>
								<a href="../login_system/user.jsp">會員</a>
							</div>
						</nav>
					<%
					// nav 修改結束
					
					//指令區
								
					sql = "use `midterm`; ";
					st.execute(sql);
					//直接執行 execute
								
					//SQL插入
					if (request.getMethod().equalsIgnoreCase("post")) {
						
						sql = "select count(*) from `job_view`; ";
						ResultSet r = st.executeQuery(sql);
						//使用 r 作為 ResultSet 儲存 executeQuery() 的結果
										
						r.next();
						int c = Integer.valueOf(r.getString(1));
						
						String s_name = request.getParameter("name");
						String s_mainskill = request.getParameter("mainskill");
						String s_minorskill = request.getParameter("minorskill");
						String s_passiveskill = request.getParameter("passiveskill");
						String s_awakenedskill = request.getParameter("awakenedskill");
										
						if ((s_name == null || s_name.equals("")) && (s_mainskill == null || s_mainskill.equals("")) && (s_minorskill == null || s_minorskill.equals("")) && (s_passiveskill == null || s_passiveskill.equals("")) && (s_awakenedskill == null || s_awakenedskill.equals(""))) {
							
						} else {
							if (s_name == null || s_name.equals(""))
							s_name = "未知職業";
							if (s_mainskill == null || s_mainskill.equals(""))
								s_mainskill = "未知技能";
							if (s_minorskill == null || s_minorskill.equals(""))
								s_minorskill = "未知技能";
							if (s_passiveskill == null || s_passiveskill.equals(""))
								s_passiveskill = "未知技能";
							if (s_awakenedskill == null || s_awakenedskill.equals(""))
								s_awakenedskill = "未知技能";
							sql_get = "select * from t_skills where c_Skill_Name = '" + s_mainskill + "';";
							ResultSet r_get = st.executeQuery(sql_get);
							if(!r_get.next()){
								s_mainskill = "未知技能";
							}
							sql_get = "select * from t_skills where c_Skill_Name = '" + s_minorskill + "';";
							r_get = st.executeQuery(sql_get);
							if(!r_get.next()){
								s_minorskill = "未知技能";
							}
							sql_get = "select * from t_skills where c_Skill_Name = '" + s_passiveskill + "';";
							r_get = st.executeQuery(sql_get);
							if(!r_get.next()){
								s_passiveskill = "未知技能";
							}
							sql_get = "select * from t_skills where c_Skill_Name = '" + s_awakenedskill + "';";
							r_get = st.executeQuery(sql_get);
							if(!r_get.next()){
								s_awakenedskill = "未知技能";
							}
							//代號邏輯修改
							sql = "select * from `t_job`; ";
							ResultSet count = st.executeQuery(sql);
							int s = 0;
							while (count.next()) {
								s = Integer.valueOf(count.getString(1).substring(1)) + 1;
							}
							
							String s_id = "";
							if (s > 100){
								s_id = "J" + String.valueOf(s);
							} else if (s > 10){
								s_id = "J0" + String.valueOf(s);
							} else {
								s_id = "J00" + String.valueOf(s);
							}
							//代號邏輯修改
							sql_get = "select * from t_skills where c_Skill_Name = '" + s_mainskill + "';";
							r_get = st.executeQuery(sql_get);
							while(r_get.next()){
								s_mainskill = r_get.getString("c_Skill_Id");
							}
							sql_get = "select * from t_skills where c_Skill_Name = '" + s_minorskill + "';";
							r_get = st.executeQuery(sql_get);
							while(r_get.next()){
								s_minorskill = r_get.getString("c_Skill_Id");
							}
							sql_get = "select * from t_skills where c_Skill_Name = '" + s_passiveskill + "';";
							r_get = st.executeQuery(sql_get);
							while(r_get.next()){
								s_passiveskill = r_get.getString("c_Skill_Id");
							}
							sql_get = "select * from t_skills where c_Skill_Name = '" + s_awakenedskill + "';";
							r_get = st.executeQuery(sql_get);
							while(r_get.next()){
								s_awakenedskill = r_get.getString("c_Skill_Id");
							}
							sql = "INSERT INTO t_job VALUES ('" + s_id + "', '"
									+ s_name + "', '" 
									+ s_mainskill + "', '" 
									+ s_minorskill + "', '" 
									+ s_passiveskill + "', '" 
									+ s_awakenedskill + "');" ;
							
							st.executeUpdate(sql);
						}
										
					}					
					
					String display_mode = "";
					try {
						display_mode = session.getAttribute("s_status").toString();
					} catch (Exception e) {
						display_mode = "None";
					}
					
					//新增表單
					if (display_mode.equals("developer")) {
						%> 
							<!--新增資料表格-->
							<form method="post" action="">
								<table class="edit bg">
									<tr> 
										<td rowspan="3" class="number">
											編號<br>
										</td> 
										<td class="lable">
											<span class="blue">職業名稱</span>
										</td>
										<td class="input">
											<input type="text" name="name" class="blue"></input>
										</td>
										<td class="green lable">
											<input type="submit" value="新增職業"></input>
										</td>
										<td class="green lable">
											<input type="reset" value="重設職業"></input>
										</td>
										
									</tr>
									<tr>
										<td class="lable">
											主要技能
										</td>
										<td class=" lable">
											次要技能
										</td>
										<td class="lable">
											被動技能
										</td>
										<td class="lable">
											覺醒技能
										</td>
									</tr>
									<tr>
										<td class="input">
											<input type="text" name="mainskill" class="green"></input>
										</td>
										<td class="input">
											<input type="text" name="minorskill" class="green"></input>
										</td>
										<td class="input">
											<input type="text" name="passiveskill" class="green"></input>
										</td>
										<td class="input">
											<input type="text" name="awakenedskill" class="green"></input>
										</td>
									</tr>
								</table>
							</form>
							
							<hr>
						<%
					}
					
								
					sql = "select * from `job_view`; ";
					ResultSet r = st.executeQuery(sql);
					//使用 r 作為 ResultSet 儲存 executeQuery() 的結果
					
					
					//顯示表單	
					while(r.next()){
						if (display_mode.equals("developer")) {
							%>
								<form method="post" action="" name="form<%=  r.getString(1) %>">
									<table class="edit bg">
										<tr> 
											<td rowspan="3" class="number">
												<input type="text" name="number" value="<%=  r.getString(1) %>"></input>
											</td> 
											<td class="lable">
												<span class="blue">職業名稱</span>
											</td>
											<td class="input">
												<input type="text" name="name" class="blue" value="<%=  r.getString(2) %>"></input>
											</td>
											<td class="edit">
												<input type="submit" name="modify" value="修改" formaction="job_modify.jsp"></input>
											</td>
											<td class="edit">
												<input type="submit" name="delete" value="刪除" formaction="job_delete.jsp"></input>
											</td>
										</tr>
										<tr>
											<td class="lable">
												主要技能
											</td>
											
											<td class="lable">
												次要技能
											</td>
												
											<td class="lable">
												被動技能
											</td>
											
											<td class="lable">
												覺醒技能
											</td>
																						
										</tr>
										<tr>
											<td class="input green">
												<input type="text" name="mainskill" class="green" value="<%=  r.getString(3) %>"></input>
											</td>
											<td class="input green">
												<input type="text" name="minorskill" class="green" value="<%=  r.getString(4) %>"></input>
											</td>
											<td class="input green">
												<input type="text" name="passiveskill" class="green" value="<%=  r.getString(5) %>"></input>
											</td>
											<td class="input green">
												<input type="text" name="awakenedskill" class="green" value="<%=  r.getString(6) %>"></input>
											</td>
										</tr>										
									</table>
								</form>
							<%
						} else {
							%>  
								<table class="view bg">
									<tr> 
										<td rowspan="3" class="number"><%= r.getString(1) %></td> 
										<td colspan="4">
											<span class="blue"><%= r.getString(2) %></span>
										</td>
										
									</tr>
									<tr>
										<td class="lable">主要技能</td>
										<td class="lable">次要技能</td>
										<td class="lable">被動技能</td>
										<td class="lable">覺醒技能</td>
									</tr>
									<tr>
										<td class="green"><%= r.getString(3) %></td>
										<td class="green"><%= r.getString(4) %></td>
										<td class="green"><%= r.getString(5) %></td>
										<td class="green"><%= r.getString(6) %></td>
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