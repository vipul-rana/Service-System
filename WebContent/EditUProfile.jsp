<%@page import="pp.Worker"%>
<%@page import="java.util.List"%>
<jsp:useBean id="wd" class="pp.Wdao"></jsp:useBean>

<jsp:useBean id="ud" class="pp.UserDao"></jsp:useBean>
<jsp:useBean id="u" class="pp.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
String id=(String)session.getAttribute("uemail");
String name=request.getParameter("name");
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
        margin: 100px;
         
          
    }
</style>
</head>
<body>
<div class="container">
<center><h1>Edit Profile</h1></center>
</div>

<div class="bs-example">
    <form action="UpdateUName.jsp">
    
    	<div class="form-group row">
            <label for="inputEmail" class="col-sm-2 col-form-label">Email:</label>
            <div class="col-sm-10">
                <input type="email" class="form-control" id="id" name="id" value="<%=id %>" readonly/>
            </div>
        </div>
    	
    	<div class="form-group row">
            <label for="inputName" class="col-sm-2 col-form-label">Name:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="name"  name="name" value="<%=name %>" required>
            </div>
        </div>
    	
        <div class="form-group row">
            <div class="col-sm-10 offset-sm-2">
                    <center><button type="submit" class="btn btn-primary btn-lg">Update</button></center>
            </div>
        </div>
        
    </form>
</div>
</body>
</html>