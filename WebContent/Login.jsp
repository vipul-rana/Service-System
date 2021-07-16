<%@page import="pp.Worker"%>
<%@page import="pp.User"%>
<%@page import="java.util.List"%>
<jsp:useBean id="ud" class="pp.UserDao"></jsp:useBean>
<jsp:useBean id="u" class="pp.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
	String id=request.getParameter("id");
	String uemail=request.getParameter("id");
	String password=request.getParameter("password");
	int i=ud.search(id, password);
	if(i>0)
	{
		session.setAttribute("uemail", uemail);
		String email=(String)session.getAttribute("email");
		response.sendRedirect("index2.jsp?email="+uemail);
	}
	else
	{
		out.println("<script>window.alert('Incorrect ID or Password');</script>");
	}
	out.println("<script>window.location.href='Ulogin.html';</script>");
%>
