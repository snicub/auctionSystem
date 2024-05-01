<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Filters</title>
</head>
<body>

	<h1>Please select the type of clothing you want to search!</h1>
	<br>
	<form action="SearchAuctionClothingType.jsp">
	  	<select name="ClothingType">
	    	<option value="Pant">Pant</option>
	    	<option value="Shirt">Shirt</option>
	   	    <option value="Shoe">Shoe</option>
	  	</select>
	  		<table>
				<tr>    
					<td>Minimum Price</td><td><input type="text"  min = "0" value = "0" step= "0.01" name="minPrice"></td>
				</tr>
				<tr>
					<td>Maximum Price</td><td><input type="text" min = "0" value = "0" step= "0.01" name="maxPrice"></td>
				</tr>
			</table>
	 	 <input type="submit" value="Submit"> 
	</form>
	<br>
		<a href="http://localhost:8080/B_Bay/Home.jsp">
			<button>Go To Home</button>
		</a>
	
	
</body>
</html>