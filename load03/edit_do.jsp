<%@page contentType="text/html;charset=GBK"%>
<%@page import="java.sql.*"%>
<html>
	<head>
		<title>
			页面登陆
		</title>
	</head>
	<body>
		<center>
		<h1>SF的第一次尝试登录页面</h1>
		<hr>
		<br>
		<br>
		
		<%
		request.setCharacterEncoding("GB2312");
		if(session.getAttribute("uname")!=null)
		{
			String author=(String)session.getAttribute("uname");
			String title1=(String)session.getAttribute("title1");
			out.print(title1);
			String title2=request.getParameter("title");
			out.print(title2);
			String content2=request.getParameter("content");
			
			
		%>
		<%!
			//这儿先不管中文乱码问题
			String DRIVER="com.mysql.jdbc.Driver";
			String URL="jdbc:mysql://localhost:3306/pageload";
			String USR="root";
			String PSW="vv159bb357";
			Connection conn=null;
			PreparedStatement stats=null;
		%>
		<%
		String sql="UPDATE note SET title=?,content=? WHERE author=? and title=?";
			try{
				Class.forName(DRIVER);
				
				conn=DriverManager.getConnection(URL,USR,PSW);
				
				stats=conn.prepareStatement(sql);
				
				stats.setString(1,title2);
				stats.setString(2,content2);
				stats.setString(3,author);
				stats.setString(4,title1);
				stats.executeUpdate();
				stats.close();
				conn.close();
			}catch(Exception e){
				out.print("some thing wrong");
				}
			%>
			<jsp:forward page="login_suc.jsp"/>
			<%
		}
	else
		{
				response.setHeader("refresh","5;URL=login.jsp");
			%>
			你还没有登陆，5秒后自动跳转到登录页面<br>
			如果没有跳转，请点击
			<a href="login.jsp">登陆</a><br>
			或者点击<a href="signin.jsp">注册</a>新的账号<br>
			<%
		}
		%>
		
		</center>
	</body>
</html>