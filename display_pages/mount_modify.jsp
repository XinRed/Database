<%@ page contentType = "text/html; charset=UTF-8"%>
<%@ page pageEncoding = "utf-8" %>
<%@ page language = "Java" %>
<%@ page import = "java.util.*, java.sql.*" %>

<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>坐騎修改</title>
		<link href="mount.css"rel="stylesheet">
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
					} else {
						out.print("連線失敗");
					}
					
					//指令區
								
					sql = "use `midterm`; ";
					st.execute(sql);
					//直接執行 execute()
					
					sql = "select count(*) from `t_mount`; ";
					ResultSet r = st.executeQuery(sql);
					//使用 r 作為 ResultSet 儲存 executeQuery() 的結果
					request.setCharacterEncoding("UTF-8");
					String in_num = request.getParameter("number");
					String in_name = request.getParameter("name");
					String in_quality = request.getParameter("quality");
					String in_ATKrange = request.getParameter("ATKrange");
					String in_HP = request.getParameter("HP");
					String in_MP = request.getParameter("MP");
					String in_ATK = request.getParameter("ATK");
					String in_DEF = request.getParameter("DEF");
					String in_ALG = request.getParameter("ALG");
					
					sql = "UPDATE `t_mount` SET "
								+ "`c_Mount_Species` = '" + in_name + "', "
								+ "`c_Mount_Quality` = '" + in_quality + "', "
								+ "`c_AttackRange_Modified` = '" + in_ATKrange + "', "
								+ "`c_HP_Modified` = '" + in_HP + "', "
								+ "`c_MP_Modified` = '" + in_MP + "', "
								+ "`c_ATK_Modified` = '" + in_ATK + "', "
								+ "`c_DEF_Modified` = '" + in_DEF + "', "
								+ "`c_ALG_Modified` = '" + in_ALG + "' "
								+ "WHERE `c_Mount_Id` = '" + in_num + "';";
					st.executeUpdate(sql);
					response.setHeader("Refresh", "0.1; url=mount.jsp");
						
					
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