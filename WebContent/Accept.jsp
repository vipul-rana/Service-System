<%@page import="pp.Appointment"%>
<%@page import="pp.Worker"%>
<%@page import="java.util.List"%>
<jsp:useBean id="wd" class="pp.Wdao"></jsp:useBean>
<jsp:useBean id="ad" class="pp.AppDao"></jsp:useBean>
<%
String email=(String)session.getAttribute("uemail");
int wid=wd.profile(email).get(0).getId();
String flag=request.getParameter("flag");
String app=request.getParameter("appno");
int appno=Integer.parseInt(app);
int i=ad.update(flag, appno);
if(flag.equals("Accepted"))
{
	String fg="Pending...";
	int j=ad.updateWork(fg, appno);
}
if(flag.equals("Request Cancelled"))
{
	%>
	<jsp:forward page = "Bookings.jsp?flag<%=flag %>"></jsp:forward>
	<%
}
else
{
	%>
	<jsp:forward page = "Request.jsp?flag<%=flag %>"></jsp:forward>
	<%
}
%>