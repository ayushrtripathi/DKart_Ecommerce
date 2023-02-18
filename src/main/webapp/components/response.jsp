<%
String success= (String) session.getAttribute("success");
String warning= (String) session.getAttribute("warning"); //session is an implicit object therefore was easily called here.

if(success!=null){
	
%>


<!-- display the message with need styling -->
<div class="alert alert-success alert-dismissible fade show" role="alert">
  <strong><%=success%></strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>

<%
session.removeAttribute("success");
}
else if(warning!=null){
	

%>
<!-- display the message with needed styling -->

<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong><%=warning%></strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>


<%
session.removeAttribute("warning");
}
%>