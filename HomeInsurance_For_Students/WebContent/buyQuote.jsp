<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Esign</title>
<script type="text/javascript">
window.history.forward();     
function noBack() 
{ 
	window.history.forward();
}
function enableEsign()
{
	document.esign.esignature.disabled=false;
}
function toggleSubmit()
{
	if(document.esign.submit.disabled==false){
		document.esign.submit.disabled=true;
	}else{
		document.esign.submit.disabled=false;
	}
}
// function validate(){
// 	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//     String todaysDate = sdf.format(Calendar.getInstance().getTime());
// 	String pEDate = document.getElementById("policyEffDate");
// 	Calendar cal = Calendar.getInstance();
// 	Date pDate = sdf.parse(pEDate);
// 	Date tDate = sdf.format(todaysDate);
// 	cal.setTime(sdf.parse(todaysDate));
// 	cal.add(Calendar.DATE, 60);
// 	Date fDate = sdf.format(todaysDate);
// 	if(fDate.compareTo(pDate) < 0 || tDate.compareTo(pDate) > 0){
// 		return false;
// 	}
// 	return true;
// }
</script>
</head>
<body onload="noBack();" onunload="">
	<%@include file="policyHeader.jsp"%>
	<hr/>
	<div style="width:800px; margin:0 auto;">
	<h1 align="center">Buy Policy</h1>
	<div align="right"><a href="logout.jsp">Logout</a></div>
	<p>Quote to Buy : <%=request.getParameter("quoteIdSelected")%></p>
	<a href="terms.html" onclick="enableEsign()" target="_blank">Read terms and conditions before buying policy</a><br/><br/>
	<form name="esign" action="policy" method="post" onsubmit="return(validate());">
	<%
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    String todaysDate = sdf.format(Calendar.getInstance().getTime());
	%>
	Enter Policy Start Date: <input type="text" id="policyEffDate" name="policyEffDate" value ="<%=todaysDate%>"/>(yyyy-MM-dd)
	<br/>
	<h6>Policy start date cannot be more than 60 days from today's date</h6>
	<br/>
	<input type="checkbox" name="esignature" id="esignature" value="Esign" onclick="toggleSubmit()" disabled="disabled"/>This is to acknowledge that I have read the terms and conditions of the policy.
	<br/><input type="submit" name="submit" id="submit" disabled="disabled" value="Submit"/>
	</form>
	</div>
	<hr/>
	<script type="text/javascript">
		document.getElementById("esignImg").src="images/tick.jpg";
		document.getElementById("esign").className = "header1";
	</script>
</body>
</html>