<%@page contentType="text/html; charset=GB2312"%>
<%@page import="java.sql.*"%>
<%
request.setCharacterEncoding ("GB2312");
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>
			ҳ���½
		</title>
	</head>
	<body>
		<center>
		<h1>SF�ĵ�һ�γ��Ե�¼ҳ��</h1>
		<hr>
		<br>
		<br>
			
		<%!
			//����Ȳ���������������
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
					request.setAttribute("err","��½�û��������������");
					
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