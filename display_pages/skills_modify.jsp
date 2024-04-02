<%@ page contentType = "text/html; charset=UTF-8"%>
<%@ page pageEncoding = "utf-8" %>
<%@ page language = "Java" %>
<%@ page import = "java.util.*, java.sql.*" %>


<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>技能修改</title>
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
					
					//指令區
								
					sql = "use `midterm`; ";
					st.execute(sql);
					//直接執行 execute()
					
					sql = "select count(*) from `t_skills`; ";
					ResultSet r = st.executeQuery(sql);
					//使用 r 作為 ResultSet 儲存 executeQuery() 的結果
					
					String in_num = request.getParameter("number");
					String in_name = request.getParameter("name");
					String in_type = request.getParameter("type");
					String in_consume = request.getParameter("consume");
					String in_cd = request.getParameter("cd");
					String in_description = request.getParameter("description");
					
					sql = "UPDATE `t_skills` SET "
								+ "`c_Skill_Name` = '" + in_name + "', "
								+ "`c_Skill_Type` = '" + in_type + "', "
								+ "`c_Skill_Cumsume` = '" + in_consume + "', "
								+ "`c_Skill_Cooldown` = '" + in_cd + "', "
								+ "`c_Skill_Discription` = '" + in_description + "' "
								+ "WHERE `c_Skill_Id` = '" + in_num + "';";
					st.executeUpdate(sql);
					response.setHeader("Refresh", "0.1; url=skills.jsp");
						
					
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