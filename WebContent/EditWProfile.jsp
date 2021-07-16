<%@page import="pp.Worker"%>
<%@page import="java.util.List"%>
<jsp:useBean id="wd" class="pp.Wdao"></jsp:useBean>

<jsp:useBean id="ud" class="pp.UserDao"></jsp:useBean>
<jsp:useBean id="u" class="pp.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
String email=(String)session.getAttribute("uemail");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
    .bs-example{
        margin: 50px;
         
          
    }
</style>
</head>
<body>
<div class="container">
<center><h1>Edit Profile</h1></center>
</div>
    <%
	List<Worker> al2=wd.profile(email);
	if(al2.size()>0)
	{
		for(Worker w:al2)
		{
			%>
<div class="bs-example">
    <form action="UpdateWProfile.jsp">
			<div class="form-group row">
            <label for="inputEmail" class="col-sm-2 col-form-label">Worker ID:</label>
            <div class="col-sm-10">
                <input type="email" class="form-control" id="wid" name="wid" value="<%=w.getId() %>" readonly/>
            </div>
        </div>
    
    	<div class="form-group row">
            <label for="inputEmail" class="col-sm-2 col-form-label">Name:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="name" name="name" value="<%=w.getName() %>" required>
            </div>
        </div>        
        
        <div class="form-group row">
            <label for="inputEmail" class="col-sm-2 col-form-label">Phone:</label>
            <div class="col-sm-10">
                <input type="number" class="form-control" id="contact" name="contact" value="<%=w.getContact() %>" required>
            </div>
        </div>
        
        <input type="hidden" id="email" name="email" value="<%=w.getEmail()%>">
        
        <div class="form-group row">
            <label for="inputEmail" class="col-sm-2 col-form-label">Category:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="name" name="category" value="<%=w.getCategory() %>" required>
            </div>
        </div>
    
        <div class="form-group row">
            <label for="inputEmail" class="col-sm-2 col-form-label">Location:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="location" name="location" value="<%=w.getLocation() %>" required>
            </div>
        </div>
        
        <div class="form-group row">
            <label for="inputEmail" class="col-sm-2 col-form-label">Address:</label>
            <div class="col-sm-10">
            	<textarea class="form-control" rows="3" cols="25" id="address" name="address" required><%=w.getAddress() %></textarea>
            </div>
        </div>
        
        <div class="form-group row">
            <label for="inputEmail" class="col-sm-2 col-form-label">Services:</label>
            <div class="col-sm-10">
            	<textarea class="form-control" rows="3" cols="25" id="services" name="services" required><%=w.getServices() %></textarea>
            </div>
        </div>
        
        <div class="form-group row">
            <label for="inputEmail" class="col-sm-2 col-form-label">Charges:</label>
            <div class="col-sm-10">
                <input type="number" class="form-control" id="charges" name="charges" value="<%=w.getCharges() %>" required>
            </div>
        </div>
        
        <div class="form-group row">
            <div class="col-sm-10 offset-sm-2">
                    <center><button type="submit" class="btn btn-primary btn-lg">Update</button></center>
            </div>
        </div>
	</form>
</div>
			<%
		}
	}		
	else
		out.println("No data found");
	%>
</body>
</html>