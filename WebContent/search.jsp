<%@page import="pp.Worker"%>
<%@page import="java.util.List"%>
<<jsp:useBean id="wd" class="pp.Wdao"></jsp:useBean>

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
  <table align="center" border="1px" class="table table-hover">
    <thead>
      <tr>
        <th>Name</th>
		<th>Category</th>
		<th>Location</th>
		<th>Charges</th>
      </tr>
    </thead>
<%
	int z=0;
	String category=request.getParameter("category");
	String location=request.getParameter("location");
	List<Worker> al=wd.search(category, location);
	if(al.isEmpty())
		out.println("No data found");
	else
	{
		for(Worker w:al)
		{
			%>
			<tbody>			
			<tr>
			<td><a href="search1.jsp?id=<%=w.getId() %>"><%=w.getName() %></a></td>
			<td><%=w.getCategory() %></td>
			<td><%=w.getLocation() %></td>
			<td><%=w.getCharges() %></td>
			</tr>			
			</tbody>
			<%
		}
	}
%>
 </table>
</div>

</body>
</html>