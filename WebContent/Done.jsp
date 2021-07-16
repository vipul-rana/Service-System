<%@page import="pp.Appointment"%>
<%@page import="pp.Worker"%>
<%@page import="java.util.List"%>
<jsp:useBean id="wd" class="pp.Wdao"></jsp:useBean>
<jsp:useBean id="ad" class="pp.AppDao"></jsp:useBean>
<%
String flag=request.getParameter("flag");
String app=request.getParameter("appno");
int appno=Integer.parseInt(app);
int i=ad.updateWork(flag, appno);
%>
<jsp:forward page = "Request.jsp?flag<%=flag %>"></jsp:forward>