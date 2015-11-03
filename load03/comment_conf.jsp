<%@page contentType="text/html; charset=GB2312"%>

<%@page import="java.sql.*"%>
<%
request.setCharacterEncoding ("GB2312");
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		
		if(session.getAttribute("uname")!=null)
		{
		
		%>
		<%!
			
			//这儿先不管中文乱码问题
			String DRIVER="com.mysql.jdbc.Driver";
			String URL="jdbc:mysql://localhost:3306/pageload";
			String USR="root";
			String PSW="vv159bb357";
			Connection conn=null;
			PreparedStatement stat1=null;
		%>
		<%
			String author=(String)session.getAttribute("uname");
			out.print(session.getAttribute("uname"));
			String title=request.getParameter("title");
			out.print(title);
			String content=request.getParameter("content");
			out.print(content);
			String sql="insert into note(author,title,content) values(?,?,?)";
			try
			{
				Class.forName(DRIVER);
				
				conn=DriverManager.getConnection(URL,USR,PSW);
				
				stat1=conn.prepareStatement(sql);
				
				stat1.setString(1,author);
				
				stat1.setString(2,title);
				
				stat1.setString(3,content);
				stat1.executeUpdate();
				
				stat1.close();
				conn.close();
			}
			catch(Exception e){
				
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