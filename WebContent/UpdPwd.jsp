<jsp:useBean id="ud" class="pp.UserDao"></jsp:useBean>
<jsp:useBean id="u" class="pp.User"></jsp:useBean>
<%
	String id=request.getParameter("id");
	String oldpwd=request.getParameter("oldPassword");
	String newpwd=request.getParameter("newPassword");
	String confirm=request.getParameter("confirmPassword");
	
	int i=ud.search(id, oldpwd);
	
	if(oldpwd.equals(newpwd))
	{
		out.println("<script>window.alert('Your Old Password and New Password Cannor be same!!!');</script>");
		out.println("<script>window.location.href='UpdatePassword.jsp';</script>");
	}
	else if(!newpwd.equals(confirm))
	{
		out.println("<script>window.alert('Password Mismatch!!!');</script>");
		out.println("<script>window.location.href='UpdatePassword.jsp';</script>");
	}
	else if(i<1)
	{
		out.println("<script>window.alert('Wrong Password!!!');</script>");
		out.println("<script>window.location.href='UpdatePassword.jsp';</script>");
	}
	else
	{
		int j=ud.updatePassword(newpwd, id);
		if(i>0)
		{
			out.println("<script>window.alert('Password Changed');</script>");
			out.println("<script>window.location.href='index2.jsp';</script>");
		}
	}
%>