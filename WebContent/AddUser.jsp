<jsp:useBean id="ud" class="pp.UserDao"></jsp:useBean>
<jsp:useBean id="u" class="pp.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<%
	String id=request.getParameter("id");
	int x=ud.search1(id);
	if(x>0)
	{
		out.println("<script>window.alert('This email is already registered!!');</script>");
		out.println("<script>window.location.href='Ulogin.html';</script>");
	}
	else
	{
		int i=ud.addUser(u);
		out.println("<script>window.alert('Signed Up Succesfully!!!');</script>");
		out.println("<script>window.location.href='index.html';</script>");
	}
%>
