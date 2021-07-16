<%@page import="pp.Worker"%>
<%@page import="java.util.List"%>
<jsp:useBean id="wd" class="pp.Wdao"></jsp:useBean>
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
    

<center><h1>Worker Details</h1></center>

<%
	String ids=request.getParameter("id");
	int id=Integer.parseInt(ids);
	List<Worker> al=wd.search1(id);
	if(al.isEmpty())
		out.println("No data found");
	else
	{
		for(Worker w:al)
		{
			%>
			<tbody>	
			<tr><th>Worker Id:</th><td><%=w.getId() %></td></tr>
			<tr><th>Name:</th><td><%=w.getName() %></td></tr>
			<tr><th>Contact:</th><td><%=w.getContact() %></td></tr>
			<tr><th>Email:</th><td><%=w.getEmail() %></td></tr>
			<tr><th>Category:</th><td><%=w.getCategory() %></td></tr>
			<tr><th>Location:</th><td><%=w.getLocation() %></td></tr>
			<tr><th>Address:</th><td><%=w.getAddress() %></td></tr>
			<tr><th>Services:</th><td><%=w.getServices() %></td></tr>
			<tr><th>Charges:</th><td><%=w.getCharges() %></td></tr>
			</tbody>
			<%
		}
	}
%>
</table>
<center><a href="Ulogin.html"><button type="button" class="btn btn-primary btn-lg">Book Now</button></a></center>