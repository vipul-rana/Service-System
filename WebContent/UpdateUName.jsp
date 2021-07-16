<jsp:useBean id="ud" class="pp.UserDao"></jsp:useBean>
<%
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	int i=ud.updateName(name, id);
	if(i>0)
	{
		out.println("<script>window.alert('Updated!!!');</script>");
		out.println("<script>window.location.href='index2.jsp';</script>");
	}
	else
	{
		out.println("<script>window.alert('Something Went Wrong!!!!');</script>");
		out.println("<script>window.location.href='index2.jsp';</script>");
	}
%>
