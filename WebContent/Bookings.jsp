<%@page import="java.util.Map"%>
<%@page import="pp.Appointment"%>
<%@page import="pp.Worker"%>
<%@page import="java.util.List"%>
<jsp:useBean id="wd" class="pp.Wdao"></jsp:useBean>
<jsp:useBean id="ad" class="pp.AppDao"></jsp:useBean>
<jsp:useBean id="ud" class="pp.UserDao"></jsp:useBean>

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
        <th><center>Worker ID</center></th>
        <th><center>Worker Name</center></th>
        <th><center>Contact</center></th>
        <th><center>Appointment Date</center></th>
        <th><center>Time Slot</center></th>
        <th><center>Charges</center></th>
        <th><center>Request</center></th>
		<th><center>Work Status</center></th>
      </tr>
    </thead>
    <center><h1>Your Bookings</h1></center>
<%

	String email=(String)session.getAttribute("uemail");
	
	//int wid=wd.profile(email).get(0).getId();
	//List<Appointment>al=ad.showRequests(wid);
	int x=1;
	Map<Worker, Appointment> hm=ud.showBookings(email);
	for(Map.Entry<Worker, Appointment> al: hm.entrySet())
	{
		Worker w=al.getKey();
		Appointment a=al.getValue();
			%>
			<tr>
			<td><center><%=x %></center></td>
			<td><center><%=a.getWid() %></center></td>
			<td><center><%=w.getName() %></center></td>
			<td><center><%=w.getContact() %></center></td>
			<td><center><%=a.getDate() %></center></td>
			<td><center><%=a.getTime() %></center></td>
			<td><center><%=w.getCharges() %></center></td>
			<%
			if(a.getStatus().equals("Pending..."))
			{
				%>
					<td>
						<center>
						<a href="Accept.jsp?flag=Request Cancelled&appno=<%=a.getAppno()%>"><button type="button" class="btn btn-info btn-xs">Cancel Request</button></a>
						</center>
					</td>
				<%
			}
			else
			{
				%>
				<td><center><%=a.getStatus() %></center></td>
				<%
			}
			%>
			<td><center><%=a.getWorkstatus()%></center></td>
			</tr>
			<%
			x++;
	}
%>
</table>