<%
session.invalidate();
out.println("<script>window.alert('Logged Out Successfully');</script>");	
out.println("<script>window.location.href='index.html';</script>");
%>