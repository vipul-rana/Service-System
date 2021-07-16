<jsp:useBean id="ad" class="pp.AppDao"></jsp:useBean>
<jsp:useBean id="a" class="pp.Appointment"></jsp:useBean>
<jsp:setProperty property="*" name="a"/>
<%
	/*
	out.println(a.getUid());
	out.println(a.getWid());
	out.println(a.getDate());
	out.println(a.getTime());
	out.println(a.getTime());
	out.println(a.getAddress());
	out.println(a.getWork());
	out.println(a.getStatus());
	*/
	int x=ad.addUser(a);
	if(x>0)
	{
		out.println("<script>window.alert('Request Sent!!!');</script>");
		out.println("<script>window.location.href='index2.jsp';</script>");
	}
	else
	{
		out.println("<script>window.alert('Something Went Wrong!!!!');</script>");
		out.println("<script>window.location.href='index2.jsp';</script>");
	}
%>