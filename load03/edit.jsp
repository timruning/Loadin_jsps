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
		
			String title=request.getParameter("title");
			session.setAttribute("title1",title);
		%>
			<h1><%="��ӭ����  "+session.getAttribute("uname")+"!"%></h1><br>
			<form action="edit_do.jsp" method="post">
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