<html>
<head>
<title>File Uploading Form</title>
<style type="css/text">
 dd { 
    /*position: relative; /* IE is dumb */
    display: block;                 
    float: left;     
    width: 500px; 
    height: 16px; 
    margin: 0 0 2px; 
    background: url("white3.gif"); 
 }

 dd div.blue { 
    /*position: relative; */
    background: url("blue.gif"); 
    height: 16px; 
    width: 75%; 
    text-align:right; 
    display:block;
 }
</style>
</head>
<body>
				       
Select a file to upload: <br />
<form action="Upload.jsp" method="post"
                        enctype="multipart/form-data">

<table>
<tr><td>
<h3>select access right</h3></td>
<td><select name="access">
<option value="public">public</option>
<option value="private">private</option>
</select></td>
</table>
<input type="file" name="file" size="50"/><br>
<input type="submit" value="Upload File" />
<br/>

</form>

<p>Display a gauge:</p>
<meter value="8" min="0" max="10">6 out of 10</meter><br>
<meter value="0.9">100%</meter>

<p><strong>Note:</strong> The meter tag is not supported in Internet Explorer.</p>


</html>

</body>
</html>