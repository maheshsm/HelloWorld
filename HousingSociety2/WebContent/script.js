var colName;
		
		function addRow(tableID) {

			var table = document.getElementById(tableID);

			rowCount = table.rows.length;
			if(rowCount > 0)
			{
			var row = table.insertRow(rowCount); 
			
			var colCount = table.rows[0].cells.length;

			for(var i=0; i <= colCount; i++) 
			{
				var newcell	= row.insertCell(i);

				newcell.innerHTML = table.rows[1].cells[i].innerHTML;
			
				switch(newcell.childNodes[i].id) 
				{
					case "name":
							newcell.childNodes[i].innerHTML = "";
							break;
					case "serialno":
							newcell.childNodes[i].innerHTML = rowCount;
							rowCount ++;
							break;
				}
			}
			}
			else
				alert('Table Format Invalid');
		}
		
	function columnName()
	{
		colName = prompt("Enter Column Name "," ");
	}	
	
	function myFunction(tableID) 
	{		
		columnName();
		
		var table = document.getElementById(tableID);
		
		var row = document.getElementById("newrow");
		
		
		
		var colCount = table.rows[0].cells.length;
		
		rowCount = table.rows.length;
		
		alert(rowCount-1);
		
		if(colName != null)
		{
			var newcell = row.insertCell(colCount);
			newcell.innerHTML = colName;

			colCount = colCount + 1;
			for(var i=2; i < rowCount ;i++)
			{
				var ncell = col.insertCell(i);
				ncell.innerHTML = "";
			}
		
		}
	}
