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
		<%!
			
			//����Ȳ���������������
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