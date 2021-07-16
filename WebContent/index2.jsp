<%@page import="java.util.List"%>
<%@page import="pp.Worker"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="w" class="pp.Worker"></jsp:useBean>
<jsp:useBean id="wd" class="pp.Wdao"></jsp:useBean>
<%//String email=request.getParameter("email");
//session.setAttribute("uemail", email);
String flag=null;
String email=(String)session.getAttribute("uemail");
if(email==null)
	out.println("<script>window.location.href='index.html';</script>");
%>
<html>
<head>
    <script>
        var request;
        function sendInfo() {
            var v = document.getElementById('t1').value;
            var url = "searchInd2.jsp?category=" + v + "&location=" + v;

            if (window.XMLHttpRequest) {
                request = new XMLHttpRequest();
            }
            else if (window.ActiveXObject) {
                request = new ActiveXObject("Microsoft.XMLHTTP");
            }

            try {
                request.onreadystatechange = getInfo;
                request.open("GET", url, true);
                request.send();
            }
            catch (e) {
                alert("Unable to connect to server");
            }
        }

        function getInfo() {
            if (request.readyState == 4) {
                var val = request.responseText;
                document.getElementById('amit').innerHTML = val;
            }
        }

    </script>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body {
            font-family: Arial;
        }

        * {
            box-sizing: border-box;
        }

        form.example input[type=text] {
            padding: 10px;
            font-size: 17px;
            border: 1px solid grey;
            float: left;
            width: 100%;
            background: #f1f1f1;
        }
    </style>


    <title>Index Page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>

<body>
    <!-- search not in navbar collapse -->
    <nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <div class="d-flex flex-grow-1">
            <a href="#" class="navbar-brand">Home</a>

            <body onload="sendInfo()">
                <form class="mr-2 my-auto w-100 d-inline-block order-1" class="example"
                    style="margin:auto;max-width:1000px">
                    <div class="input-group">
                        <input class="form-control border border-right-0" type="text" name="t1" id="t1"
                            placeholder="Find Mechanics, Plumbers, Electricians and more..." onkeyup="sendInfo()" />
                        <span class="input-group-append"></span>
                    </div>
                </form><br>
            </body>
        </div>

        <div class="navbar-collapse collapse flex-shrink-1 flex-grow-0 order-last" id="navbar7">
            <ul class="nav navbar-nav navbar-right" class="navbar-nav">
            	
                <li class="nav-item">
            		<a href="Bookings.jsp"><i class="fa fa-bell"></i>Your Bookings</a>
                </li>
                <%
                List<Worker> al=wd.profile(email);
                if(al.size()>0)
                {
	                %>
	            	<li class="nav-item">
	            		<a href="Request.jsp"><i class="fa fa-bell"></i>Bookings Requests</a>
	                </li>
	                <%
                }
                else
                {
                	%>
	            	<li class="nav-item">
	            		<a href="RegWorker.html"><i class="fa fa-bell"></i>Work With Us!</a>
	                </li>
	                <%
                }
                %>
                <li class="nav-item">
                    <a href="Profile.jsp?email=<%=email %>"><span class="glyphicon glyphicon-user"></span> Profile</a>
                </li>
                <li class="nav-item">
                    <a href="Logout.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a>
                </li>
            </ul>
        </div>
    </nav>
    <nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">All Categories</a>
        </div>
        
        <a class="navbar-brand" class="navbar-header" href="Mechanic.jsp">Mechanics</a>
        <a class="navbar-brand" href="Electrician.jsp">Electricians</a>
        <a class="navbar-brand" href="Plumber.jsp">Plumbers</a>
        <a class="navbar-brand" href="Labourer.jsp">Labourers</a>
        <a class="navbar-brand" href="Transport.jsp">Transport</a>
    </div>
</nav><br>
    <div id="amit"> </div>
</body>
</html>