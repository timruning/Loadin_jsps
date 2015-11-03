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
			
		<%!
			//这儿先不管中文乱码问题
			String DRIVER="com.mysql.jdbc.Driver";
			String URL="jdbc:mysql://localhost:3306/pageload";
			String USR="root";
			String PSW="vv159bb357";
			Connection conn=null;
			PreparedStatement stat=null;
			ResultSet rs=null;
		%>
		<%
			String name=request.getParameter("name");
			String password=request.getParameter("password");
		%>
		<%
			boolean flag=false;
			String sql="select author from person where author=? and password=?";
			try
			{
				Class.forName(DRIVER);
				conn=DriverManager.getConnection(URL,USR,PSW);
				stat=conn.prepareStatement(sql);
				
				stat.setString(1,name);
				
				stat.setString(2,password);
				rs=stat.executeQuery();
				if(rs.next())
				{
					flag=true;
					session.setAttribute("uname",name);
				}
				else
				{
					request.setAttribute("err","登陆用户名或者密码错误");
					
				}
				rs.close();
				stat.close();
				conn.close();
			}
			catch(Exception e)
			{
				out.print("errpr!");
			}
			if(flag)
			{
				%>
				<jsp:forward page="login_suc.jsp"/>
				<%
			}
			else
			{
				%>
				<jsp:forward page="login.jsp"/>
				<%
			}
		%>
		</center>
	</body>
</html>