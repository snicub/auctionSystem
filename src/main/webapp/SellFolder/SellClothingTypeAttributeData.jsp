<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@page import="com.cs336.pkg.ApplicationDB"%>
<jsp:useBean id="a" class="com.cs336.pkg.Auction"></jsp:useBean>
<jsp:setProperty property="*" name="a"/>
<jsp:useBean id="i" class="com.cs336.pkg.Items"></jsp:useBean>
<jsp:setProperty property="*" name="i"/>
<jsp:useBean id="pants" class="com.cs336.pkg.Pants"></jsp:useBean>
<jsp:setProperty property="*" name="pants"/>
<jsp:useBean id="shirts" class="com.cs336.pkg.Shirts"></jsp:useBean>
<jsp:setProperty property="*" name="shirts"/>
<jsp:useBean id="shoes" class="com.cs336.pkg.Shoes"></jsp:useBean>
<jsp:setProperty property="*" name="shoes"/>
<jsp:useBean id="has" class="com.cs336.pkg.Has"></jsp:useBean>
<jsp:setProperty property="*" name="has"/>
<jsp:useBean id="c" class="com.cs336.pkg.Contains"></jsp:useBean>
<jsp:setProperty property="*" name="c"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SellClothingTypeDataAttributes</title>
</head>
<body>
<% 
try{
	
	
	String clothingType = (String)session.getAttribute("cloth");
	HttpSession sess = request.getSession();
	String var = String.valueOf(sess.getAttribute("userID"));
	int userID = Integer.parseInt(var);
	String startDate = request.getParameter("startDate");
	String endDate = request.getParameter("endDate");
	double initialBidPrice = Double.valueOf(request.getParameter("initialBidPrice"));
	double incrementBidPrice = Double.valueOf(request.getParameter("incrementBidPrice"));
	double minBid = Double.valueOf(request.getParameter("minBid"));
	double currentBidPrice = initialBidPrice;
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	%>
	<br>
	<a href="http://localhost:8080/B_Bay/Home.jsp">
		<button>Go To Home</button>
	</a>
	<br>
	<%
	
	
	//for each clothing type you must add into Auction, Items, pant/shirt/shoe, Contains, HAS
	if(clothingType.equals("Pant")){
		int pantWaist = Integer.parseInt(request.getParameter("pant_waist"));
		String pantType = request.getParameter("pant_type");
		String pantGender = request.getParameter("pant_gender");
		String pantColor = request.getParameter("color");
		String itemDescription = pantType + "," + pantGender + "," + pantColor;
				
		a.setCurrentBidPrice(initialBidPrice); 
		int statusForAuction = db.createAuction(a);
		if(statusForAuction > 0){
			%>
		    <script type="text/javascript">
		    	alert('Successfully created a new auction!');
		 	 </script>
		    <% 
		    i.setDescription(itemDescription);
		    int statusForItems = db.createItems(i);
		   
			if(statusForItems >0){
				%>
			    <script type="text/javascript">
			    	alert('Successfully created a new item!');
			 	 </script>
			    <% 
				has.setUserID(userID);
				int statusForHAS = db.createHasRelationship(has);
				if(statusForHAS>0){
					%>
				    <script type="text/javascript">
				    	alert('Successfully created a new Has relationship!');
				 	 </script>
				    <% 

				 
				    PreparedStatement stmt=con.prepareStatement("select max(itemID) as itemID from items ");  		  
					ResultSet rs=stmt.executeQuery();
					int mostRecentItemID = -1;
					while(rs.next()){
						mostRecentItemID = rs.getInt("itemID");
					}
					PreparedStatement stmt1=con.prepareStatement("select max(auctionID) as auctionID from auction");
				   
					ResultSet rs1=stmt1.executeQuery();
				    int mostRecentAuctionID = -1;
				    while(rs1.next()){
						mostRecentAuctionID = rs1.getInt("auctionID");
					}
				  	//prob might not work cuz contains ~ items/auction may have diff # cuz items/auctions works runs before contains
					c.setItemID(mostRecentItemID);
				    c.setAuctionID(mostRecentAuctionID);
					int statusForContains = db.createContainsRelationship(c);
					if(statusForContains>0){
						%>
					    <script type="text/javascript">
					    	alert('Successfully created a new Contains relationship!');
					 	 </script>
					    <% 

						
						//Basically i wanted to get the most recent ID inserted based on previous insert but it didnt work
						//so i just got the max ID since that would technically be the most recent id
						
						//FOREIGN KEY RESTRICTIONS
						
						pants.setItemID(mostRecentItemID);
						pants.setPantWaist(pantWaist);
						pants.setPantType(pantType);
						pants.setPantGender(pantGender);
						pants.setColor(pantColor);
						pants.setBidPrice(initialBidPrice);
						//error
						int statusForPants = db.createItemsPants(pants);
						if(statusForPants>0 ){
							%>
						    <script type="text/javascript">
						    	alert('Successfully created a new pants!');
						 	 </script>
						    <% 
						}else{
							
							%>
						    <script type="text/javascript">
						    	alert('Pants went wrong:(');
						 	 </script>
						    <% 
						}
						
					
					}else{
						
						%>
					    <script type="text/javascript">
					    	alert('Contains went wrong:(');
					 	 </script>
					    <% 
					}

				
				}else{
					
					%>
				    <script type="text/javascript">
				    	alert('Has went wrong:(');
				 	 </script>
				    <% 
				}
			
			}else{
			
				%>
			    <script type="text/javascript">
			    	alert('Item went wrong:(');
			 	 </script>
			    <% 
			}
		
		}else{
			
			%>
		    <script type="text/javascript">
		    	alert('Auction went wrong:(');
		 	 </script>
		    <% 
		}
		
		
		
		
		con.close();
		
		 %>
         <script type="text/javascript">
         window.location= "http://localhost:8080/B_Bay/Home.jsp";
	     </script>
	     <% 
		
		
	}else if(clothingType.equals("Shirt")){
		String shirtSize = request.getParameter("shirt_size");
		String shirtGender = request.getParameter("shirt_gender");
		String shirtBrand = request.getParameter("shirt_brand");
		String shirtColor =request.getParameter("color");
		
		String itemDescription = shirtSize + "," + shirtGender + "," + shirtBrand + "," + shirtColor;
		
		a.setCurrentBidPrice(initialBidPrice); 
		int statusForAuction = db.createAuction(a);
		if(statusForAuction > 0){
			%>
		    <script type="text/javascript">
		    	alert('Successfully created a new auction!');
		 	 </script>
		    <% 
		    i.setDescription(itemDescription);
		    int statusForItems = db.createItems(i);
		    
			if(statusForItems >0){
				%>
			    <script type="text/javascript">
			    	alert('Successfully created a new item!');
			 	 </script>
			    <% 
				has.setUserID(userID);
				int statusForHAS = db.createHasRelationship(has);
				if(statusForHAS>0){
					%>
				    <script type="text/javascript">
				    	alert('Successfully created a new Has relationship!');
				 	 </script>
				    <% 

				 
				    PreparedStatement stmt=con.prepareStatement("select max(itemID) as itemID from items ");  		  
					ResultSet rs=stmt.executeQuery();
					int mostRecentItemID = -1;
					while(rs.next()){
						mostRecentItemID = rs.getInt("itemID");
					}
					PreparedStatement stmt1=con.prepareStatement("select max(auctionID) as auctionID from auction");
				   
					ResultSet rs1=stmt1.executeQuery();
				    int mostRecentAuctionID = -1;
				    while(rs1.next()){
						mostRecentAuctionID = rs1.getInt("auctionID");
					}
				  	//prob might not work cuz contains ~ items/auction may have diff # cuz items/auctions works runs before contains
					c.setItemID(mostRecentItemID);
				    c.setAuctionID(mostRecentAuctionID);
					int statusForContains = db.createContainsRelationship(c);
					if(statusForContains>0){
						%>
					    <script type="text/javascript">
					    	alert('Successfully created a new Contains relationship!');
					 	 </script>
					    <% 

						
						//Basically i wanted to get the most recent ID inserted based on previous insert but it didnt work
						//so i just got the max ID since that would technically be the most recent id
						
						//FOREIGN KEY RESTRICTIONS
						shirts.setItemID(mostRecentItemID);
					    shirts.setShirtSize(shirtSize);
					    shirts.setShirtGender(shirtGender);
					    shirts.setShirtBrand(shirtBrand);
					    shirts.setColor(shirtColor);
					    shirts.setBidPrice(initialBidPrice);
					
						//error
						int statusForShirt = db.createItemsShirts(shirts);
						if(statusForShirt>0 ){
							%>
						    <script type="text/javascript">
						    	alert('Successfully created a new shirts!');
						 	 </script>
						    <% 
						}else{
							
							%>
						    <script type="text/javascript">
						    	alert('Pants went wrong:(');
						 	 </script>
						    <% 
						}
						
					
					}else{
						con.close();
						%>
					    <script type="text/javascript">
					    	alert('Contains went wrong:(');
					 	 </script>
					    <% 
					}

				
				}else{
					
					%>
				    <script type="text/javascript">
				    	alert('Has went wrong:(');
				 	 </script>
				    <% 
				}
			
			}else{
			
				%>
			    <script type="text/javascript">
			    	alert('Item went wrong:(');
			 	 </script>
			    <% 
			}
		
		}else{
			
			%>
		    <script type="text/javascript">
		    	alert('Auction went wrong:(');
		 	 </script>
		    <% 
		}
		
		
		con.close();
		 %>
         <script type="text/javascript">
         window.location= "http://localhost:8080/B_Bay/Home.jsp";
	     </script>
	     <% 
		
	}else{
		double shoeSize = Double.valueOf(request.getParameter("shoe_size"));
		String shoeGender =request.getParameter("shoe_gender");
		String shoeBrand = request.getParameter("shoe_brand");
		String shoeColor = request.getParameter("color");
		String itemDescription = shoeSize + "," + shoeGender + "," + shoeBrand+ "," + shoeColor;
		a.setCurrentBidPrice(initialBidPrice); 
		int statusForAuction = db.createAuction(a);
		if(statusForAuction > 0){
			%>
		    <script type="text/javascript">
		    	alert('Successfully created a new auction!');
		 	 </script>
		    <% 
		    i.setDescription(itemDescription);
		    int statusForItems = db.createItems(i);
			if(statusForItems >0){
				%>
			    <script type="text/javascript">
			    	alert('Successfully created a new item!');
			 	 </script>
			    <% 
				has.setUserID(userID);
				int statusForHAS = db.createHasRelationship(has);
				if(statusForHAS>0){
					%>
				    <script type="text/javascript">
				    	alert('Successfully created a new Has relationship!');
				 	 </script>
				    <% 

				 
				    PreparedStatement stmt=con.prepareStatement("select max(itemID) as itemID from items ");  		  
					ResultSet rs=stmt.executeQuery();
					int mostRecentItemID = -1;
					while(rs.next()){
						mostRecentItemID = rs.getInt("itemID");
					}
					PreparedStatement stmt1=con.prepareStatement("select max(auctionID) as auctionID from auction");
				   
					ResultSet rs1=stmt1.executeQuery();
				    int mostRecentAuctionID = -1;
				    while(rs1.next()){
						mostRecentAuctionID = rs1.getInt("auctionID");
					}
				  	//prob might not work cuz contains ~ items/auction may have diff # cuz items/auctions works runs before contains
					c.setItemID(mostRecentItemID);
				    c.setAuctionID(mostRecentAuctionID);
					int statusForContains = db.createContainsRelationship(c);
					if(statusForContains>0){
						%>
					    <script type="text/javascript">
					    	alert('Successfully created a new Contains relationship!');
					 	 </script>
					    <% 

						
						//Basically i wanted to get the most recent ID inserted based on previous insert but it didnt work
						//so i just got the max ID since that would technically be the most recent id
						
						//FOREIGN KEY RESTRICTIONS
						
						shoes.setItemID(mostRecentItemID);
					    shoes.setShoeSize(shoeSize);
					    shoes.setShoeGender(shoeGender);
					    shoes.setShoeBrand(shoeBrand);
					    shoes.setColor(shoeColor);
					    shoes.setBidPrice(initialBidPrice);
					    
					
						//error
						int statusForShoes = db.createItemsShoes(shoes);
						if(statusForShoes>0 ){
							%>
						    <script type="text/javascript">
						    	alert('Successfully created a new shoes!');
						 	 </script>
						    <% 
						}else{
							
							%>
						    <script type="text/javascript">
						    	alert('Pants went wrong:(');
						 	 </script>
						    <% 
						}
						
					
					}else{
						
						%>
					    <script type="text/javascript">
					    	alert('Contains went wrong:(');
					 	 </script>
					    <% 
					}

				
				}else{
					
					%>
				    <script type="text/javascript">
				    	alert('Has went wrong:(');
				 	 </script>
				    <% 
				}
			
			}else{
			
				%>
			    <script type="text/javascript">
			    	alert('Item went wrong:(');
			 	 </script>
			    <% 
			}
		
		}else{
			
			%>
		    <script type="text/javascript">
		    	alert('Auction went wrong:(');
		 	 </script>
		    <% 
		}
		
		
	}
	
	
	con.close();
	 %>
     <script type="text/javascript">
     window.location= "http://localhost:8080/B_Bay/Home.jsp";
     </script>
     <% 
}catch(Exception e){
	
	
}
%>
</body>
</html>