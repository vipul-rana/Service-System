<%@page import="pp.Worker"%>
<%@page import="java.util.List"%>
<%@page import="pp.User"%>
<jsp:useBean id="ud" class="pp.UserDao"></jsp:useBean>
<jsp:useBean id="wd" class="pp.Wdao"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		#container 
		{
		  display: flex;
		  justify-content: center;
		  align-items: center;
		}
		.btn:hover, .btn:active, .btn:visited 
		{
		    background-color: #606d7d !important;
		}
		#d1
		{
			display: block;
		}
		#d2
		{
			display: none;
		}
	</style>
	<title></title>
	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
	
	<% 
		String email=request.getParameter("email");
		List<Worker> al2=wd.profile(email);
		if(al2.size()>0)
		{
	%>
			<div class="col-xs-12 col-md-6 c1">
				<button class="btn btn-large btn-block btn-info" type="button" name="ch" id="t1" onclick="show('user')">
					<center><h1><p style="text-align:center">User Profile</p></h1></center>
				</button>
		    </div>
		
			<div class="col-xs-12 col-md-6 c1">
				<button class="btn btn-large btn-block btn-basic" type="button" name="ch" id="t1" onclick="show('worker')">
					<center><h1><p style="text-align:center">Worker Profile</p></h1></center>
				</button>
			</div>
		<%} %>
<div id="d1">
	<container>.</container>
	<container><center><h2>User Profile</h2></center></container>
	<container>.</container>
	<div class="container-fluid" class="spacer margin-top: 400px;">
	<div class="m-4 pb-5 bg-info">
	<table align="center" border="2px" class="table table-hover">
	<%
	
	String name="";
	List<User> al=wd.uprofile(email);
	if(al.size()>0)
	{
		
		for(User u:al)
		{
			%>
			<tbody>	
			<tr><th>User Id:</th><td><%=u.getId() %></td></tr>
			<tr><th>Name:</th><td><%=u.getName() %></td></tr>
			</tbody>
			<%
			name=u.getName();
		}
	}		
	else
		out.println("No data found");
	%>
	</table>
	</div>
	</div>
	<center>
		<a href="EditUProfile.jsp?name=<%=name%>"><button type="button" class="btn btn-default">Edit Profile</button></a>
		<a href="UpdatePassword.jsp"><button type="button" class="btn btn-primary">Change Password</button></a>
	</center>
</div>
<div id="d2">
	<container>.</container>
	<container><center><h2>Worker Profile</h2></center></container>
	<container>.</container>
	<div class="container-fluid" class="spacer margin-top: 400px;">
	<div class="m-4 pb-5 bg-success">
	<table align="center" border="2px" class="table table-hover">
	<%
	if(al2.size()>0)
	{
		for(Worker w:al2)
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
	else
		out.println("No data found");
	%>
	</table>
	</div>
	</div>
	<center>
		<a href="EditWProfile.jsp"><button type="button" class="btn btn-primary">Edit Profile</button></a>
	</center>
</div>
<script>
	function show(ch) 
	{
		if(ch==="user")
		{
			document.getElementById('d1').style.display="block";
			document.getElementById('d2').style.display="none";
		}
		else if(ch==="worker")
		{
			document.getElementById('d2').style.display="block";
			document.getElementById('d1').style.display="none";	
		}
	}
</script>
</body>
</html>