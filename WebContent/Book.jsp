<%@page import="pp.Worker"%>
<%@page import="java.util.List"%>
<jsp:useBean id="wd" class="pp.Wdao"></jsp:useBean>

<jsp:useBean id="ud" class="pp.UserDao"></jsp:useBean>
<jsp:useBean id="u" class="pp.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
String uid=(String)session.getAttribute("uemail");
String id=request.getParameter("id");
int wid=Integer.parseInt(id);
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
<center><h1>Book Your Worker</h1></center>
</div>

<div class="bs-example">
    <form action="SendRequest.jsp">
    
    	<input type="hidden" id="uid" name="uid" value="<%=uid%>">
    	<input type="hidden" id="wid" name="wid" value="<%=wid%>">
    
        <div class="form-group row">
            <label for="inputEmail" class="col-sm-2 col-form-label">Booking date</label>
            <div class="col-sm-10">
                <input type="date" class="form-control" id="date" placeholder="Booking Date" name="date" required>
            </div>
        </div>
        
        <div class="form-group row">
            <label for="inputPassword" class="col-sm-2 col-form-label">Time Slot</label>
            <div class="col-sm-10">
                <input type="time" class="form-control" id="time" placeholder="Select Time slot" name="time" required>
            </div>
        </div>
        
        <div class="form-group row">
            <label for="inputEmail" class="col-sm-2 col-form-label">Address</label>
            <div class="col-sm-10">
            	<textarea class="form-control" rows="3" cols="25" id="address" placeholder="Enter your Full Address" name="address" required></textarea>
            </div>
        </div>
        
        <div class="form-group row">
            <label for="inputEmail" class="col-sm-2 col-form-label">Work Description</label>
            <div class="col-sm-10">
            	<textarea class="form-control" rows="3" cols="25" id="work" placeholder="Enter Work Description" name="work" required></textarea>
            </div>
        </div>
        
        <input type="hidden" id="status" name="status" value="Pending...">
        <input type="hidden" id="workstatus" name="workstatus" value="---">
        
        <div class="form-group row">
            <div class="col-sm-10 offset-sm-2">
                    <center><button type="submit" class="btn btn-primary btn-lg">Send Request</button></center>
            </div>
        </div>
        
    </form>
</div>
</body>
</html>