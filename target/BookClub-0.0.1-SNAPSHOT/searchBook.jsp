<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="style.css">
<link rel="stylesheet" type="text/css" href="style2.css">
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.database.Dbconnect" %>
<style type="text/css">
	#title {
		color:#078898;
		font-size:19px;
	}
	table{
		margin-left:50px;
	}
	tr.spaceUnder>td {
		padding-bottom: 1em;
	}
	.bt{
		height:40px;	
		width:100px;
		background-color:#078898;
		border:0;
		color:white;
	}
	.btn:hover,.bt:hover{
		background-color:silver;
		color:#078898;
	}
	hr.split {
       display: block;
       padding: 0;
       margin: 8px auto;
       height: 0;
       width: 100%;
       max-height: 0;
       font-size: 1px;
       line-height: 0;
       clear: both;
       border: none;
       border-top: 1px solid #aaaaaa;
       border-bottom: 1px solid #ffffff;
    }
    td{
    	text-align:left;
    }
    #main{
    	background-color:#EBEBEB;
    }
</style>
<title>Book Details</title>
</head>
<div id="navbar">	
	</div>
		<div class="container">		
			<ul class="navigationBar">
				<div id="logoArea">
					<li class="logo"><a href="index.jsp" style="font-family:logo;font-size:33px;">4Cknowledge</a></li>
				</div>
				<div id="navArea">
					<li class="nav"><a class="active" href="index.jsp">Home</a></li>
						<%response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
						String firstName = (String)session.getAttribute("firstName");
						String userRole = (String)session.getAttribute("role");
						String email= (String)session.getAttribute("email");
						if(firstName==null||firstName==""){
							%><li class="nav"><a href="register.jsp">Login/Register</a></li><%
						}else if(userRole.equals("Admin")){
							%><li class="nav"><a href="adminPanel.jsp"><%=firstName%></a></li><%
						}else {
							%><li class="nav"><a href="searchMember?to=userProfile&email=<%= email%>"><%=firstName%></a></li><%
						}%>
					<li class="nav"><a href="viewBooks.jsp">Books</a></li>
					<li class="nav"><a href="aboutUs.jsp">About Us</a></li>
					<li class="nav"><a href="contactUs.jsp">Contact Us</a></li>	
				</div>
			</ul>
		
			
			<br><br><br>
			<img class="header" src="header/header.jpg" alt="Norway" width="1000" height="300">
			<br>
			<div id="sidebar">
				<h3 style="color:white;margin:5px;text-align:center;">Find the book You looking for.</h3>
				
				<%String msg = (String)request.getAttribute("msg"); 
			  	if(msg != null && !msg.isEmpty()){
		  			if(msg.equals("noBookFound"))
						out.println("<p style=\"color:orange;margin:5px;text-align:center;\"><b>Sorry unable to find the book You looking for.</b></p>");
		 		}%>
				
				<form name="form5" method="post" action="findBook">
				<table style="margin-left:0px">
					<tr>
						<td><select class="search" name="category"><option>Science</option>
                                        <option>Education</option>
                                        <option>IT</option>
                                        <option>Science fiction</option>
                                       	<option>Drama</option>
                                       	<option>Romance</option>
                                       	<option>Mystery</option>
                                       	<option>Horror</option>          	
                            </select></td>
					</tr>
					<tr>
						<td><select class="search" name="language">
								<option value="English">English</option>
  								<option value="Albanian">Albanian</option>
  								<option value="Arabic">Arabic</option>
  								<option value="Armenian">Armenian</option>
 								<option value="Bengali">Bengali</option>
  								<option value="Bulgarian">Bulgarian</option>
								<option value="Catalan">Catalan</option>
  								<option value="Cambodian">Cambodian</option>
 								<option value="Chinese (Mandarin)">Chinese (Mandarin)</option>
  								<option value="Croation">Croation</option>
 								<option value="Czech">Czech</option>
  								<option value="Danish">Danish</option>
  								<option value="Dutch">Dutch</option>
  								<option value="English">English</option>
 								<option value="Estonian">Estonian</option>
  								<option value="Fiji">Fiji</option>
  								<option value="Finnish">Finnish</option>
 								<option value="Georgian">Georgian</option>
  								<option value="German">German</option>
  								<option value="Greek">Greek</option>
 								<option value="Gujarati">Gujarati</option>
 								<option value="Hindi">Hindi</option>
  								<option value="Hungarian">Hungarian</option>
 								<option value="Icelandic">Icelandic</option>
  								<option value="Indonesian">Indonesian</option>
  								<option value="Irish">Irish</option>
  								<option value="Italian">Italian</option>
 								<option value="Japanese">Japanese</option>
 								<option value="Korean">Korean</option>
  								<option value="Latin">Latin</option>
 								<option value="Latvian">Latvian</option>
 								<option value="Lithuanian">Lithuanian</option>
  								<option value="Malay">Malay</option>
  								<option value="Malayalam">Malayalam</option>
  								<option value="Mongolian">Mongolian</option>
 								<option value="Nepali">Nepali</option>
  								<option value="Norwegian">Norwegian</option>
 								<option value="Persian">Persian</option>
  								<option value="Polish">Polish</option>
  								<option value="Portuguese">Portuguese</option>
  								<option value="Punjabi">Punjabi</option>
 								<option value="Romanian">Romanian</option>
  								<option value="Russian">Russian</option>
 								<option value="Samoan">Samoan</option>
  								<option value="Serbian">Serbian</option>
  								<option value="Sinhala">Sinhala</option>
  								<option value="Slovenian">Slovenian</option>
 								<option value="Spanish">Spanish</option>
  								<option value="Swahili">Swahili</option>
 								<option value="Swedish ">Swedish </option>
  								<option value="Tamil">Tamil</option>
  								<option value="Telugu">Telugu</option>
  								<option value="Thai">Thai</option>
  								<option value="Tibetan">Tibetan</option>
  								<option value="Turkish">Turkish</option>
  								<option value="Ukranian">Ukranian</option>
  								<option value="Urdu">Urdu</option>
  								<option value="Uzbek">Uzbek</option>
  								<option value="Vietnamese">Vietnamese</option>
							</select></td>
						</tr>
						<tr>
							<td><select class="search" name="country">
								<option value="United States">United States</option> 
								<option value="United Kingdom">United Kingdom</option> 
								<option value="Antarctica">Antarctica</option> 
								<option value="Argentina">Argentina</option> 
								<option value="Armenia">Armenia</option> 
								<option value="Australia">Australia</option> 
								<option value="Austria">Austria</option> 
								<option value="Bangladesh">Bangladesh</option> 
								<option value="Belgium">Belgium</option> 
								<option value="Bhutan">Bhutan</option> 
								<option value="Brazil">Brazil</option> 
								<option value="Canada">Canada</option> 
								<option value="Central African Republic">Central African Republic</option> 
								<option value="Chile">Chile</option> 
								<option value="China">China</option> 
								<option value="Colombia">Colombia</option> 
								<option value="Costa Rica">Costa Rica</option> 
								<option value="Croatia">Croatia</option> 
								<option value="Cuba">Cuba</option> 
								<option value="Cyprus">Cyprus</option> 
								<option value="Czech Republic">Czech Republic</option> 
								<option value="Denmark">Denmark</option> 
								<option value="Egypt">Egypt</option> 
								<option value="El Salvador">El Salvador</option> 
								<option value="Fiji">Fiji</option> 
								<option value="Finland">Finland</option> 
								<option value="France">France</option> 
								<option value="Georgia">Georgia</option> 
								<option value="Germany">Germany</option> 
								<option value="Ghana">Ghana</option> 
								<option value="Greece">Greece</option> 
								<option value="Greenland">Greenland</option> 
								<option value="Guinea">Guinea</option> 
								<option value="Haiti">Haiti</option> 
								<option value="Hong Kong">Hong Kong</option> 
								<option value="India">India</option> 
								<option value="Indonesia">Indonesia</option> 
								<option value="Iraq">Iraq</option> 
								<option value="Ireland">Ireland</option> 
								<option value="Italy">Italy</option> 
								<option value="Jamaica">Jamaica</option> 
								<option value="Japan">Japan</option> 
								<option value="Jordan">Jordan</option> 
								<option value="Kazakhstan">Kazakhstan</option> 
								<option value="Kenya">Kenya</option> 
								<option value="Kuwait">Kuwait</option> 
								<option value="Malaysia">Malaysia</option> 
								<option value="Maldives">Maldives</option> 
								<option value="Mali">Mali</option> 
								<option value="Malta">Malta</option> 
								<option value="Mexico">Mexico</option> 
								<option value="Monaco">Monaco</option> 
								<option value="Mongolia">Mongolia</option> 
								<option value="Myanmar">Myanmar</option> 
								<option value="Nepal">Nepal</option> 
								<option value="Netherlands">Netherlands</option> 
								<option value="New Zealand">New Zealand</option> 
								<option value="Nigeria">Nigeria</option> 
								<option value="Norway">Norway</option> 
								<option value="Oman">Oman</option> 
								<option value="Pakistan">Pakistan</option> 
								<option value="Papua New Guinea">Papua New Guinea</option> 
								<option value="Paraguay">Paraguay</option> 
								<option value="Peru">Peru</option> 
								<option value="Philippines">Philippines</option> 
								<option value="Poland">Poland</option> 
								<option value="Portugal">Portugal</option> 
								<option value="Qatar">Qatar</option> 
								<option value="Russian Federation">Russian Federation</option> 
								<option value="Sierra Leone">Sierra Leone</option> 
								<option value="Singapore">Singapore</option> 
								<option value="South Africa">South Africa</option> 	<option value="Spain">Spain</option> 
								<option value="Sri Lanka">Sri Lanka</option> 
								<option value="Swaziland">Swaziland</option> 
								<option value="Sweden">Sweden</option> 
								<option value="Switzerland">Switzerland</option> 
								<option value="Thailand">Thailand</option> 
								<option value="Timor-leste">Timor-leste</option> 
								<option value="Ukraine">Ukraine</option> 
								<option value="United Arab Emirates">United Arab Emirates</option> 
								<option value="United Kingdom">United Kingdom</option> 
								<option value="United States">United States</option> 
								<option value="Viet Nam">Viet Nam</option> 
								<option value="Zimbabwe">Zimbabwe</option>
						</select></td>
						</tr>
						<tr>
							<td>
								<select class="search" name="year" id="year"></select>
							</td>
						</tr>
						<script type="text/javascript">
							var start = 1900;
							var end = new Date().getFullYear();
							var options = "";
							for(var year = end ; year >=start; year--){
								  options += "<option>"+ year +"</option>";
							}
							document.getElementById("year").innerHTML = options;
						</script>
					<tr>
						<td>
							<input style="margin-left:120px" type="submit" id="findbtn" value="Find Book">
						</td>
					</tr>
				</table>
				</form>
				<img src="gif/gif1.gif" width="360px" style="text-align:center;">
			</div>
			<div id="main">
			<br>
			<h3>Book Details.</h3>
			<hr>
			<br>
	<%
	String sql=null;
	String bkId =request.getParameter("bookId");
	if(bkId != null && !bkId.isEmpty()){
		sql = "select * from books where bookId='"+bkId+"'";
	}else{
		String category = (String)request.getAttribute("category");
		String language = (String)request.getAttribute("language");
		String country = (String)request.getAttribute("country");
		String year = (String)request.getAttribute("year");
		sql = "select * from books where category='"+category+"' and language='"+language+"' and country='"+country+"' and YEAR(publishDate)='"+year+"'";
	}
	Connection con = Dbconnect.connect();
	PreparedStatement st = null;
	ResultSet rs = null;
	
	if(con==null){%>
		<h4 style="color:red;">Sorry. Unable to connect to the database. Try again later. </h4>
	<%}

	try {
		st = con.prepareStatement(sql);
		rs=st.executeQuery();
		System.out.println("Sql executed succesfully!");
		
		if(!rs.next()){
			%><h3>Book not found, <a href = "index.jsp">Go back.</a></h3><%
		}else{
			do{ 
				String bookId=rs.getString("bookId");%>
					<table>
						<tr>
							<td><p id="title"><b><%=rs.getString("title") %></b></p></td>
						</tr>
					</table>
					<table>
						<tr>
							<td>Book ID :</td>
							<td><b><%=bookId%></b></td>
						</tr>
						<tr >
							<td >Category :</td>
							<td ><b><%=rs.getString("category") %></b></td>
							<td>Author :</td>
							<td><b><%=rs.getString("author") %></b></td>
						</tr>
						<tr >
							<td>language :</td>
							<td style="text-align:left;"><b><%=rs.getString("language") %></b></td>
							<td>Country :</td>
							<td><b><%=rs.getString("country")%></b></td>
						</tr>
						<tr >
						</tr>
						<tr >
							<td>Publisher :</td>
							<td style="text-align:left;"><b><%=rs.getString("Publisher") %></b></td>
							<td>Published Date :</td>
							<td><b><%=rs.getString("publishDate")%></b></td>
						</tr>
					</table>
					<table>
						<tr>
							<td>Keywords :</td>
							<td style="text-align:left;"><b><%=rs.getString("keywords") %></b></td>
						</tr>
						<tr>
						<%if(userRole.equals("Admin")){
							%><td><a href = "editbookdetails?id=<%=bookId%>"><input type="button" class="bt" value="Edit Book"></td><%
							%><td><a href = "removeBook?id=<%=bookId%>"><input type="button" class="bt" value="Delete Book"></td><%
						}
						%></tr>
					</table>  
					<hr class="split"><%
				}while(rs.next());
			}%>
		<%}catch(Exception e){
    		e.printStackTrace();
    	}%>
		</div>
	</div>
</body>
</html>

