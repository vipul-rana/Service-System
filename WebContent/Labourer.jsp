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
    <thead>
      <tr>
        <th>Name</th>
		<th>Category</th>
		<th>Location</th>
		<th>Charges</th>
      </tr>
    </thead>
    <center><h1>Labourers</h1></center>
<%
	String category="Labourer";
	String location="!";
	List<Worker> al=wd.search(category,location);
	if(al.isEmpty())
		out.println("No data found");
	else
	{
		for(Worker w:al)
		{
			%>
			<tr>
			<td><%=w.getName() %></td>
			<td><%=w.getCategory() %></td>
			<td><%=w.getLocation() %></td>
			<td><%=w.getCharges() %></td>
			</tr>
			<%
		}
	}
%>
</table>