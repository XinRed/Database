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
						out.print("連線失敗");
					}
					
					//指令區
					String sql = "";
					
					sql = "use midterm";
					st.execute(sql);
					
					String f_account = request.getParameter("f_account");
					String f_password = request.getParameter("f_password");					
					if (f_account.equals("") || f_password.equals("")) {
						session.setAttribute("s_info", "error");	
						response.setHeader("Refresh", "0.2; url=login.jsp");
					}
					
					try {
						sql = "select user_account from t_user_information where user_account = '" + f_account + "';";
						ResultSet account_check = st.executeQuery(sql);

						if (account_check.next()) {
							session.setAttribute("s_info", "already_exist");
							response.setHeader("Refresh", "0.2; url=login.jsp");
						} else {
							sql = "select * from `t_user_information`; ";
							ResultSet r = st.executeQuery(sql);
							int u = 0;
							while (r.next()) {
								u = Integer.valueOf(r.getString(1).substring(1)) + 1;
							}
							
							String u_id = "";
							if (u > 100){
								u_id = "U" + String.valueOf(u);
							} else if (u > 10){
								u_id = "U0" + String.valueOf(u);
							} else {
								u_id = "U00" + String.valueOf(u);
							} 	
								
							sql = "insert into midterm.t_user_information values ('" + u_id + "', 'Unknown', '" + f_password + "', '" + f_account + "' , 'player', '', 0, '', '', '', '');" ;		
							st.executeUpdate(sql);
							
							session.setAttribute("s_info", "");							
							
							session.setAttribute("s_account", f_account);
							session.setAttribute("s_status", "player");
							
							response.setHeader("Refresh", "0.2; url=user.jsp");
						}
					} catch (Exception e) {
						out.print(e.toString());
					}
					
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