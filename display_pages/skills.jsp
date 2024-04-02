<%@ page contentType = "text/html; charset=UTF-8"%>
<%@ page pageEncoding = "utf-8" %>
<%@ page language = "Java" %>
<%@ page import = "java.util.*, java.sql.*" %>

<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>技能</title>
		<link href="skills.css"rel="stylesheet">
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
					
					// nav 修改到這裡 並更新 裝備、坐騎、公會都有 ../display_pages/XXX
					%>
						<nav>
							<div>
								<a href="../display_pages/job.jsp">職業</a>
							</div>
							<div class="selected">
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
						
						sql = "select count(*) from `t_skills`; ";
						ResultSet r = st.executeQuery(sql);
						//使用 r 作為 ResultSet 儲存 executeQuery() 的結果
										
						r.next();
						int c = Integer.valueOf(r.getString(1));
						
						String s_name = request.getParameter("name");
						String s_type = request.getParameter("type");
						String s_consume = request.getParameter("consume");
						String s_cd = request.getParameter("cd");
						String s_description = request.getParameter("description");
										
						if ((s_name == null || s_name.equals("")) && (s_type == null || s_type.equals("") || s_type.equals("None")) && (s_consume == null || s_consume.equals("")) && (s_cd == null || s_cd.equals(""))) {
							
						} else {
							if (s_name == null || s_name.equals(""))
								s_name = "未知技能";
							if (s_type == null || s_type.equals("") || s_type.equals("None"))
								s_type = "未知類型";
							if (s_consume == null || s_consume.equals(""))
								s_consume = "0";
							if (s_cd == null || s_cd.equals(""))
								s_cd = "0";
							
							
							//代號邏輯修改
							sql = "select * from `t_skills`; ";
							ResultSet count = st.executeQuery(sql);
							int s = 0;
							while (count.next()) {
								s = Integer.valueOf(count.getString(1).substring(1)) + 1;
							}
							
							String s_id = "";
							if (s > 100){
								s_id = "S" + String.valueOf(s);
							} else if (s > 10){
								s_id = "S0" + String.valueOf(s);
							} else {
								s_id = "S00" + String.valueOf(s);
							}
							//代號邏輯修改
							
							sql = "INSERT INTO t_skills VALUES ('" + s_id + "', '"
									+ s_name + "', '" 
									+ s_type + "', '" 
									+ s_consume + "', " 
									+ s_cd + ", '" 
									+ s_description + "');" ;
							
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
										<td rowspan="2" class="number">
											編號<br>
										</td> 
										<td class="lable">
											<span class="blue">技能名稱</span>
											<br>
											<span class="gold">技能種類</span>
										</td>
										<td class="input">
											<input type="text" name="name" class="blue"></input>
											<select name="type" class="gold">
												<option value="None">請選擇</option>
												<option value="MainSkill">Main</option>
												<option value="MinorSkill">Minor</option>
												<option value="PassiveSkill">Passive</option>
												<option value="AwakenSkill">Awaken</option>
											</select>
										</td>
										<td class="green lable">
											技能消耗
										</td>
										<td class="input">
											<input type="text" name="consume" class="green"></input>
										</td>
										<td class="green lable">
											技能冷卻
										</td>
										<td class="input">
											<input type="text" name="cd" class="green"></input>
										</td>
									</tr>
									<tr>
										<td class="lable">
											技能說明 
										</td>
										<td colspan="5" class="description">
											<input type="text" name="description"></input>
										</td>				
									</tr>
									<tr class="space">
										<td colspan="7">
											<input type="submit" value="新增技能"></input>
											<input type="reset" value="重設技能"></input>
										</td>
									</tr>					
								</table>
							</form>
							
							<hr>
						<%
					}
					
								
					sql = "select * from `t_skills`; ";
					ResultSet r = st.executeQuery(sql);
					//使用 r 作為 ResultSet 儲存 executeQuery() 的結果
					
					
					//顯示表單
					while(r.next()) {
						if (r.getString(2).equals("還未覺醒")) {
							continue;
						}
						
						String s_None = "";
						String s_Main = "";
						String s_Minor = "";
						String s_Passive = "";
						String s_Awaken = "";
						
						if (display_mode.equals("developer")) {
							%>
								<form method="post" action="" name="form<%=  r.getString(1) %>">
									<table class="edit bg">
										<tr> 
											<td rowspan="2" class="number">
												<input type="text" name="number" value="<%=  r.getString(1) %>"></input>
											</td> 
											<td class="lable">
												<span class="blue">技能名稱</span>
												<br>
												<span class="gold">技能種類</span>
											</td>
											<td class="input">
												<input type="text" name="name" class="blue" value="<%=  r.getString(2) %>"></input>
												<select name="type" class="gold">
													<%
														s_None = "";
														s_Main = "";
														s_Minor = "";
														s_Passive = "";
														s_Awaken = "";
														
														switch (r.getString(3)) {
															case "None" :
																s_None = "selected";
																break;
															case "MainSkill" :
																s_Main = "selected";
																break;
															case "MinorSkill" :
																s_Minor = "selected";
																break;
															case "PassiveSkill" :
																s_Passive = "selected";
																break;
															case "AwakenSkill" :
																s_Awaken = "selected";
																break;
														}
													%>
													<option value="None" >請選擇</option>
													<option value="MainSkill" <%= s_Main %>>Main</option>
													<option value="MinorSkill" <%= s_Minor %>>Minor</option>
													<option value="PassiveSkill" <%= s_Passive %>>Passive</option>
													<option value="AwakenSkill" <%= s_Awaken %>>Awaken</option>
												</select>
											</td>
											<td class="green lable">
												技能消耗
											</td>
											<td class="input">
												<input type="text" name="consume" class="green" value="<%=  r.getString(4) %>"></input>
											</td>
											<td class="green lable">
												技能冷卻
											</td>
											<td class="input">
												<input type="text" name="cd" class="green" value="<%=  r.getString(5) %>"></input>
											</td>
											<td rowspan="2" class="edit">
												<input type="submit" name="modify" value="修改" formaction="skills_modify.jsp"></input>
												<input type="submit" name="delete" value="刪除" formaction="skills_delete.jsp"></input>
											</td> 
										</tr>
										<tr>
											<td class="lable">
												技能說明 
											</td>
											<td colspan="5" class="description">
												<input type="text" name="description" value="<%=  r.getString(6) %>"></input>
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
											<span class="blue"><%= r.getString(2) %></span><br>
											<span class="gold"><%= r.getString(3) %></span>
										</td>
										<td>
											技能消耗:
											<span class="green">
												<%
													String l = "魔力";
													int x = 0;
													try {									
														x = Integer.parseInt(r.getString(4));
													} catch (NumberFormatException e){
														l = "";
													}
													
												%>
												<%= r.getString(4) %><%= l %>
											</span>
										</td>
										<td>
											技能冷卻:
											<span class="green">
												<%= r.getString(5) %>秒
											</span>
										</td>
									</tr>
									<tr>
										<td colspan="3" class="description"><%= r.getString(6) %></td>				
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