<%@page contentType="text/html; charset=GB2312"%>
<%
request.setCharacterEncoding ("GB2312");
%>
<html>
	<head>
		
		<title>
			ע��ҳ��
		</title>
	</head>
	<body>
		<center>
		<h1>SF�ĵ�һ�γ��Ե�¼ҳ��</h1>
		<hr>
		<br>
		<br>
		
		<%
			if(request.getAttribute("error1")!=null)
			{
				%>
				<%=request.getAttribute("error1")%>
				<%
			}
		%>
		<form action="sign_conf.jsp" method="post">
			<table>
				<tr>
					<td>�û��� :</td>
					<td><input type="text" name="name1"></td>
				</tr>
				<tr>
					<td>��&nbsp;�� :</td>
					<td><input type="text" name="email"></td>
				</tr>
				<tr>
					<td>��&nbsp;�� :</td>
					<td><input type="password" name="password1"></td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="ע��">
						<input type="reset" value="����">
						<a href="login.jsp">���µ�½</a>
					</td>
				</tr>
			</table>
		</form>
		</center>
	</body>
</html>