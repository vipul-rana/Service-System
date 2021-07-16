<%@page import="pp.Appointment"%>
<%@page import="pp.Worker"%>
<%@page import="java.util.List"%>
<jsp:useBean id="wd" class="pp.Wdao"></jsp:useBean>
<jsp:useBean id="ad" class="pp.AppDao"></jsp:useBean>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">            
  <table align="center" border="2px" class="table table-hover">
    <thead>
      <tr>
      	
        <th><center>S. No.</center></th>
        <th><center>User ID</center></th>
        <th><center>Appointment Date</center></th>
        <th><center>Time Slot</center></th>
        <th><center>Address</center></th>
        <th><center>Work Description</center></th>
		<th><center>Response</center></th>
		<th><center>Work Status</center></th>
      </tr>
    </thead>
    <center><h1>Appointment Requests</h1></center>
<%

	String email=(String)session.getAttribute("uemail");
	
	int wid=wd.profile(email).get(0).getId();
	List<Appointment>al=ad.showRequests(wid);
	int x=1;
	if(al.isEmpty())
		out.println("");
	else
	{
		for(Appointment a:al)
		{
			%>
			<tr>
			<td><center><%=x %></center></td>
			<td><center><%=a.getUid() %></center></td>
			<td><center><%=a.getDate() %></center></td>
			<td><center><%=a.getTime() %></center></td>
			<td><center><%=a.getAddress() %></center></td>
			<td><center><%=a.getWork() %></center></td>
			<%
			if(a.getStatus().equals("Pending..."))
			{
				%>
					<td>
						<center>
						<a href="Accept.jsp?flag=Accepted&appno=<%=a.getAppno()%>"><button type="button" class="btn btn-info btn-xs">Accept</button></a>
						<a href="Accept.jsp?flag=Declined&appno=<%=a.getAppno()%>"><button type="button" class="btn btn-default btn-xs">Decline</button></a>
						</center>
					</td>
					<td><center><%=a.getWorkstatus() %></center></td>
				<%
			}
			else
			{
				%>
					<td><center><%=a.getStatus() %></center></td>
				<%
				if(a.getStatus().equals("Accepted") && a.getWorkstatus().equals("Pending..."))
				{
					%>
					<td>
						<center>
						<a href="Done.jsp?flag=Done&appno=<%=a.getAppno()%>"><button type="button" class="btn btn-info btn-xs">Done?</button></a>
						<a href="Done.jsp?flag=Booking Cancelled&appno=<%=a.getAppno()%>"><button type="button" class="btn btn-default btn-xs">Cancel Booking</button></a>
						</center>
					</td>
					<%
				}
				else
				{
					%>
					<td><center><%=a.getWorkstatus() %></center></td>
					<%
				}
			}
			%>
				</tr>
			<%
			x++;
		}
	}
%>
</table>