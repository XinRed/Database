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
					
					session.removeAttribute("s_account");
					session.removeAttribute("s_status");
					response.setHeader("Refresh", "0.1; url=login.jsp");
					
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