<%@ page contentType = "text/html; charset=UTF-8"%>
<%@ page pageEncoding = "UTF-8" %>
<%@ page language = "Java" %>
<%@ page import = "java.util.*, java.sql.*" %>

<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>裝備</title>
		<link href="equipment.css"rel="stylesheet">
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
					%>
						<nav>
							<div>
								<a href="../display_pages/job.jsp">職業</a>
							</div>
							<div>
								<a href="../display_pages/skills.jsp">技能</a>
							</div>
							<div class="selected">
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
					//指令區
								
					sql = "use `midterm`; ";
					st.execute(sql);
					//直接執行 execute()
					
					sql = "select count(*) from `t_equipment`; ";
					ResultSet r = st.executeQuery(sql);
					//使用 r 作為 ResultSet 儲存 executeQuery() 的結果
							
								
					//SQL插入
					request.setCharacterEncoding("UTF-8");
					if (request.getMethod().equalsIgnoreCase("post")) {
						String s_name = request.getParameter("name");
						String s_quality = request.getParameter("quality");
						String s_ATKrange = request.getParameter("ATKrange");
						String s_HP = request.getParameter("HP");
						String s_MP = request.getParameter("MP");
						String s_ATK = request.getParameter("ATK");
						String s_DEF = request.getParameter("DEF");
						String s_ALG = request.getParameter("ALG");
										
						if (s_name == null || s_name.equals("")	&& (s_quality == null || s_quality.equals("") || s_quality.equals("None")) && (s_ATKrange == null || s_ATKrange.equals("")) && (s_HP == null || s_HP.equals("")) && (s_MP == null || s_MP.equals("")) && (s_ATK == null || s_ATK.equals("")) && (s_DEF == null || s_DEF.equals(""))	&& (s_ALG == null || s_ALG.equals(""))){

						} else {
							if (s_name == null || s_name.equals(""))
								s_name = "未知裝備";
							if (s_quality == null || s_quality.equals("") || s_quality.equals("None"))
								s_quality = "未知品質";
							if (s_ATKrange == null || s_ATKrange.equals(""))
								s_ATKrange = "0";
							if (s_HP == null || s_HP.equals(""))
								s_HP = "0";
							if (s_MP == null || s_MP.equals(""))
								s_MP = "0";
							if (s_ATK == null || s_ATK.equals(""))
								s_ATK = "0";
							if (s_DEF == null || s_DEF.equals(""))
								s_DEF = "0";
							if (s_ALG == null || s_ALG.equals(""))
								s_ALG = "0";

							sql = "INSERT INTO t_equipment VALUES ('";

							r.next();
							int c = Integer.valueOf(r.getString(1));

							if (c+1 > 100) {
								sql += "E" + String.valueOf(c+1) + "', '" ;
							} else if (c+1 > 10) {
								sql += "E0" + String.valueOf(c+1) + "', '" ;
							} else {
								sql += "E00" + String.valueOf(c+1) + "', '" ;
							} 	

							sql += s_name + "', '" ;
							sql += s_quality + "', '" ;
							sql += s_ATKrange + "', '" ;
							sql += s_HP + "', '" ;
							sql += s_MP + "', '" ;
							sql += s_ATK + "', '" ;
							sql += s_DEF + "', '" ;
							sql += s_ALG + "', '" ;
							sql += 1 + "');" ;


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
										<span class="blue">裝備名稱</span>
										<br>
										<span class="gold">裝備品質</span>
									</td>
									<td class="input">
										<input type="text" name="name" class="blue"></input>
										<br>
										<select name="quality" class="gold">
											<option value="None">None</option>
											<option value="Normal">Normal</option>
											<option value="Fine">Fine</option>
											<option value="Excellent">Excellent</option>
											<option value="Epic">Epic</option>
											<option value="Legendary">Legendary</option>
										</select>
									</td>
									<td class="green lable" colspan="2">
										<input type="submit" value="新增裝備"></input>
									</td>
									<td class="green lable" colspan="2">
										<input type="reset" value="重設裝備"></input>
									</td>
								</tr>
								<tr>
									<td class="green lable">
										距離加成
									</td>
									<td class="input">
										<input type="text" name="ATKrange" class="green"></input>
									</td>
									<td class="green lable">
										生命加成
									</td>
									<td class="input">
										<input type="text" name="HP" class="green"></input>
									</td>	
									<td class="green lable">
										魔力加成
									</td>
									<td class="input">
										<input type="text" name="MP" class="green"></input>
									</td>
								</tr>
								<tr>
									<td class="green lable">
										攻擊加成
									</td>
									<td class="input">
										<input type="text" name="ATK" class="green"></input>
									</td>
									<td class="green lable">
										防禦加成
									</td>
									<td class="input">
										<input type="text" name="DEF" class="green"></input>
									</td>	
									<td class="green lable">
										敏捷加成
									</td>
									<td class="input">
										<input type="text" name="ALG" class="green"></input>
									</td>
								</tr>
							</table>
						</form>
						<hr>
					<%
					}		
					sql = "select * from `t_equipment`; ";
					r = st.executeQuery(sql);
					//使用 r 作為 ResultSet 儲存 executeQuery() 的結果
					
					
					//顯示表單
					while(r.next()) {
						String s_None = "";
						String s_Normal = "";
						String s_Fine = "";
						String s_Excellent = "";
						String s_Epic = "";
						String s_Legendary = "";
						
						if (display_mode.equals("developer")) {
							%>
								<form method="post" action="" name="form<%=  r.getString(1) %>">
									<table class="edit bg">
										<tr> 
											<td rowspan="3" class="number">
												<input type="text" name="number" value="<%=  r.getString(1) %>"></input>
											</td> 
											<td class="lable">
												<span class="blue">裝備名稱</span>
												<br>
												<span class="gold">裝備品質</span>
											</td>
											<td class="input">
												<input type="text" name="name" class="blue" value="<%=  r.getString(2) %>"></input>
												<select name="quality" class="gold">
													<%
														s_None = "";
														s_Normal = "";
														s_Fine = "";
														s_Excellent = "";
														s_Epic = "";
														s_Legendary = "";
														
														switch (r.getString(3)) {
															case "None" :
																s_None = "selected";
																break;
															case "Normal" :
																s_Normal = "selected";
																break;
															case "Fine" :
																s_Fine = "selected";
																break;
															case "Excellent" :
																s_Excellent = "selected";
																break;
															case "Epic" :
																s_Epic = "selected";
																break;
															case "Legendary" :
																s_Legendary = "selected";
																break;
														}
													%>
													<option value="None" <%= s_None %>>請選擇</option>
													<option value="Normal" <%= s_Normal %>>Normal</option>
													<option value="Fine" <%= s_Fine %>>Fine</option>
													<option value="Excellent" <%= s_Excellent %>>Excellent</option>
													<option value="Epic" <%= s_Epic %>>Epic</option>
													<option value="Legendary"<%= s_Legendary %>>Legendary</option>
												</select>
											</td>
											<td colspan="2" class="edit">
												<input type="submit" name="modify" value="修改" formaction="equipment_modify.jsp"></input>
											</td> 
											<td colspan="2" class="edit">
												<input type="submit" name="delete" value="刪除" formaction="equipment_delete.jsp"></input>
											</td> 
										</tr>
										<tr>
											<td class="green lable">
												距離加成
											</td>
											<td class="input">
												<input type="text" name="ATKrange" class="green" value="<%=  r.getString(4) %>"></input>
											</td>
											<td class="green lable">
												生命加成
											</td>
											<td class="input">
												<input type="text" name="HP" class="green" value="<%=  r.getString(5) %>"></input>
											</td>	
											<td class="green lable">
												魔力加成
											</td>
											<td class="input">
												<input type="text" name="MP" class="green" value="<%=  r.getString(6) %>"></input>
											</td>
										</tr>
										<tr>
											<td class="green lable">
												攻擊加成
											</td>
											<td class="input">
												<input type="text" name="ATK" class="green" value="<%=  r.getString(7) %>"></input>
											</td>
											<td class="green lable">
												防禦加成
											</td>
											<td class="input">
												<input type="text" name="DEF" class="green" value="<%=  r.getString(8) %>"></input>
											</td>	
											<td class="green lable">
												敏捷加成
											</td>
											<td class="input">
												<input type="text" name="ALG" class="green" value="<%=  r.getString(9) %>"></input>
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
										<td colspan="3">
											<span class="blue"><%= r.getString(2) %></span>
										</td>
										<td colspan="3">
											<span class="gold"><%= r.getString(3) %></span>
										</td>
									</tr>
									<tr>
										<td class="lable">距離加成</td>
										<td class="green">+<%= r.getString(4) %>%</td>
										<td class="lable">生命加成</td>
										<td class="green">+<%= r.getString(5) %>%</td>
										<td class="lable">魔力加乘</td>
										<td class="green">+<%= r.getString(6) %>%</td>
									</tr> 
									<tr>
										<td class="lable">攻擊加成</td>
										<td class="green">+<%= r.getString(7) %>%</td>
										<td class="lable">防禦加成</td>
										<td class="green">+<%= r.getString(8) %>%</td>
										<td class="lable">敏捷加乘</td>
										<td class="green">+<%= r.getString(9) %>%</td>
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