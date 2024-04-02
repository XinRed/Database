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
					
					//指令區
					String sql = "";
					
					sql = "use midterm";
					st.execute(sql);
					
					String old_p = request.getParameter("password_old"); 
					String new_p = request.getParameter("password_new"); 
					String confirm_p = request.getParameter("password_confirm"); 
					
					//取得form的資料
					String s_account = session.getAttribute("s_account").toString();		
					sql = "select * from t_user_information where user_account = '" + s_account + "'";
					ResultSet user_data = st.executeQuery(sql);
					
					String user_name = request.getParameter("f_name");
					String user_account = request.getParameter("f_account"); 
					String user_country = request.getParameter("f_country"); 
					String user_age = request.getParameter("f_age"); 
					String user_sex = request.getParameter("f_sex"); 
					String user_gmail = request.getParameter("f_gmail"); 
					String user_phone = request.getParameter("f_phone"); 
					
					if (user_sex.equals("男性")) {
						user_sex = "M";
					} else if (user_sex.equals("女性")) {
						user_sex = "F";
					}
					
					//修改資料
					sql = "UPDATE `t_user_information` SET "
								+ "`user_name` = '" + user_name + "', "
								+ "`user_account` = '" + user_account + "', "
								+ "`user_country` = '" + user_country + "', "
								+ "`user_age` = '" + user_age + "', "
								+ "`user_sex` = '" + user_sex + "', "
								+ "`user_gmail` = '" + user_gmail + "', "
								+ "`user_phone` = '" + user_phone + "' "
								+ "WHERE `user_account` = '" + s_account + "';";
					st.executeUpdate(sql);
					response.setHeader("Refresh", "0.1; url=user.jsp");
					
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