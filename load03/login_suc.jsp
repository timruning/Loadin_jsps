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
		<%
		if(session.getAttribute("uname")!=null)
		{
		%>
			<h1><%="��ӭ����  "+session.getAttribute("uname")+"!"%></h1><br>
			<form action="comment_conf.jsp" method="post">
				
				<table>
				<tr>
					<td>���� :<input type="text" name="title"></td>
					
				</tr>
				
				<tr>
					<td><textarea name="content" cols="120" rows="15"></textarea></td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="����">
						<input type="reset" value="���">
					</td>
					
				</tr>
				</table>
			
			</form>
			
			
			<%!
			//����Ȳ���������������
			String DRIVER="com.mysql.jdbc.Driver";
			String URL="jdbc:mysql://localhost:3306/pageload";
			String USR="root";
			String PSW="vv159bb357";
			Connection conn=null;
			Statement stats=null;
			ResultSet rs=null;
		%>
		<%
			String sql="SELECT * FROM note";
			try{
				Class.forName(DRIVER);
				conn=DriverManager.getConnection(URL,USR,PSW);
				stats=conn.createStatement();
				rs=stats.executeQuery(sql);
				int i=0;
				while(rs.next())
				{
					i++;
					String author=rs.getString(1);
					String title=rs.getString(2);
					String content=rs.getString(3);
					%>
					<h2><%=title+"--"+author%>
						<a href="edit.jsp?title=<%=title%>">�༭</a>
						<a href="delete.jsp?title=<%=title%>">ɾ��</a>	
					</h2><br>
					<%=content%>
					<hr>
					<%
				}
				if(i==0)
				{
					%>
					<%="Ȼ����û�����ۣ�����"%>
					<%
				}
				rs.close();
				stats.close();
				conn.close();
			}
			catch(Exception e)
			{}
		%>	
				
			
		<%
		}
	else
		{
				response.setHeader("refresh","5;URL=login.jsp");
			%>
			�㻹û�е�½��5����Զ���ת����¼ҳ��<br>
			���û����ת������
			<a href="login.jsp">��½</a><br>
			���ߵ��<a href="signin.jsp">ע��</a>�µ��˺�<br>
			<%
		}
		%>
		
		</center>
	</body>
</html>