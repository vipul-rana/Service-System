<jsp:useBean id="ud" class="pp.UserDao"></jsp:useBean>
<jsp:useBean id="u" class="pp.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<jsp:useBean id="wd" class="pp.Wdao"></jsp:useBean>
<jsp:useBean id="w" class="pp.Worker"></jsp:useBean>
<jsp:setProperty property="*" name="w"/>
<%
	String id=request.getParameter("email");
	int x=ud.search1(id);
	if(x>0)
	{
		int i=wd.addWorker(w);
		out.println("<script>window.alert('Registered Successfully');</script>");
		%>
			<!DOCTYPE html>
			<html lang="en">
			<head>
			<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<title>Bootstrap 4 Horizontal Form Layout</title>
			<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
			<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
			<header>
			  
			
			  <!-- Background image -->
			  <div
			    class="p-5 text-center bg-image"
			    style="
			      background-image: url('C:\Users\dell\Downloads\bgg.jpg');
			      height: 400px;
			    "
			  >
			    <div class="mask" style="background-color: rgba(0, 0, 0, 0.6);">
			      <div class="d-flex justify-content-center align-items-center h-100">
			        <div class="text-white">
			          <h1 class="mb-3">Registered Successfully!!!</h1>
			          <h4 class="mb-3">Go to Home</h4>
			          <a class="btn btn-outline-light btn-lg" href="index.html" role="button">Home</a><br>
			          <span>    </span>
			        </div>
			      </div>
			    </div>
			
			  <!-- Background image -->
			</header>
			</head>
			</html>		
		
		<%
	}
	else
	{
		out.println("<script>window.alert('This Email ID is not registered with us!!! Check your Email ID again or Create an account first.');</script>");
		%>
			<html lang="en">
			<head>
			<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<title>Bootstrap 4 Horizontal Form Layout</title>
			<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
			<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
			<header>
			  
			
			  <!-- Background image -->
			  <div
			    class="p-5 text-center bg-image"
			    style="
			      background-image: url('C:\Users\dell\Downloads\bgg.jpg');
			      height: 400px;
			    "
			  >
			    <div class="mask" style="background-color: rgba(0, 0, 0, 0.6);">
			      <div class="d-flex justify-content-center align-items-center h-100">
			        <div class="text-white">
			          <h1 class="mb-3">Create an Account... <a class="btn btn-outline-light btn-lg" href="Register.html" role="button">Sign Up</a></h1>
			          <h1 class="mb-3">Already have an account? <a class="btn btn-outline-light btn-lg" href="Ulogin.html" role="button">Login</a></h1>
			          <h1 class="mb-3">Go to Home <a class="btn btn-outline-light btn-lg" href="index.html" role="button">Home</a></h1>
			        </div>
			      </div>
			    </div>
			
			  <!-- Background image -->
			</header>
			</head>
			</html>		
		
		<%
	}
%>