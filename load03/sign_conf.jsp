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
			PreparedStatement stat1=null;
			PreparedStatement stat2=null;
			ResultSet rs=null;
		%>
		<%
			String name1=request.getParameter("name1");
			String email=request.getParameter("email");
			String password1=request.getParameter("password1");
		%>
		<%
			String sql1="select * from person where author=? or email=?";
			String sql2="insert into person(author,email,password) values(?,?,?)";
			boolean flag=false;
			try{
				Class.forName(DRIVER);
				conn=DriverManager.getConnection(URL,USR,PSW);
				stat1=conn.prepareStatement(sql1);
				stat1.setString(1,name1);
				stat1.setString(2,email);
				rs=stat1.executeQuery();
				if(rs.next())
				{
					request.setAttribute("error1","用户名已存在请重新注册");
				}
			else
				{
					flag=true;
					session.setAttribute("uname",name1);//但是放在这里就会正常的显示
					stat2=conn.prepareStatement(sql2);
					stat2.setString(1,name1);
					stat2.setString(2,email);
					stat2.setString(3,password1);
					stat2.executeUpdate();
					stat2.close();
				}
				rs.close();
				stat1.close();
				conn.close();
			}
			catch(Exception e)
			{
				out.print("error!");
			}
			if(flag)
			{
				%>
				<jsp:forward page="login_suc.jsp"/>
				<%
			}
			else
			{
				//session.setAttribute("uname",name1);session放在这里就会出现登陆成功页显示不正常
				%>
				<jsp:forward page="signin.jsp"/>
				<%
			}
		%>
		</center>
	</body>
</html>