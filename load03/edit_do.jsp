<%@page contentType="text/html;charset=GBK"%>
<%@page import="java.sql.*"%>
<html>
	<head>
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
			//����Ȳ���������������
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