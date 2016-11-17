<!DOCTYPE html5>
<html lang="en">
<HEAD>
<link rel="stylesheet" type="text/css" href="style.css">  
<script src="script.js"></script>
</HEAD>
<BODY>

	<TABLE id="dataTable" width="350px" border="1">
	
	<tr id = "newrow">
    <th>Sr.No</th>
    <th>Name</th>
  	</tr>
		<TR>
			<TD><span id="serialno" >1</span></TD>
			<TD><INPUT id="name" name="txt" PlaceHolder="Enter Your Name"/></TD>
		</TR>
	</TABLE>
	
	<INPUT type="button" value="Add Row" onclick="addRow('dataTable')" />&nbsp; &nbsp;
	<INPUT type="button" value="Add Column" onclick="myFunction('dataTable')" />
	<a href = "index.jsp">Home</a>
</BODY>
</HTML>