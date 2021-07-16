<jsp:useBean id="wd" class="pp.Wdao"></jsp:useBean>
<jsp:useBean id="w" class="pp.Worker"></jsp:useBean>
<jsp:setProperty property="*" name="w"/>
<%
	String wiid=request.getParameter("wid");
	int wid=Integer.parseInt(wiid);
	w.setId(wid);

	int i=wd.updateWorker(w);
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