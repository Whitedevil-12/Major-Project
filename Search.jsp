<%-- 
    Document   : AddBook
    Created on : Mar 23, 2015, 4:10:17 PM
    Author     : HCL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>MyFreeCssTemplates.com free CSS template</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="styles.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="nivo-slider.css" type="text/css" media="screen" />
</head>
<body>

<div id="bg">
<div id="bg_top_bg">
<div id="bg_top">
<div id="bg_bot">


<div id="main">
<!-- header begins -->
<div id="header">
	<div id="buttons">
      <a href="gallery.html" class="but but_t"  title="">Home</a>
      <a href="Logout.jsp" class="but" title="">Logout</a>
      <a href="index.jsp"  class="but" title="">About us</a>
      <a href="contact_us.html" class="but" title="">Contact us</a>
    </div>
	<div id="logo">
    	<a href="#"><h2>Bookworld.com</h2><br>Online Shopping Cart </a>
        <hr><hr><h2><a href="#"><h2>We Belive In Knowledge Sharing.</h2></a></h2>
    </div>
	
</div>
<!-- header ends -->
<div class="top">

			<div id="slider-wrapper">        
            <div id="slider" class="nivoSlider">
                <img src="images/topa1.jpg" alt="" />
                <img src="images/topa2.png" alt=""/>
                <img src="images/topa3.jpg" alt="" />
                <img src="images/topa4.png" alt="" />
				<img src="images/topa5.png" alt="" />
				<img src="images/topa6.png" alt="" />
				<img src="images/topa7.png" alt="" />
				<img src="images/topa8.jpg" alt="" />
            </div>
			        
        </div>

<script type="text/javascript" src="lib/jquery-1.4.3.min.js"></script>
    <script type="text/javascript" src="lib/jquery.nivo.slider.pack.js"></script>
    <script type="text/javascript">
    $(window).load(function() {
        $('#slider').nivoSlider();
    });
    </script>

</div>

<div style="height: 47px"></div>
        <!-- content begins -->
        		<div></div>
       			<div>
                	<div>
                        	<div >
                                     <!-- content .................................................................begins -->
                                 <CENTER>

<font size="5" >Search Results</font>
</CENTER>
<a href="Logout.jsp" ><font size="4"  >Click here to Logout</font></a>
<%@page language="java"  import="java.sql.*"  %>


<%
 	String query=null;
	Connection conn;
	Connection conn1;
	Connection conn2;
	Connection conn3;
	conn=null;
	conn1=null;
	conn2=null;
	conn3=null;
	ResultSet rs;
	rs=null;
	String str_searchvar=null;
	int chk_ctr=0;
	String str_colvar=null;
	String tab_var="";
	String user_src=(String)session.getValue("user");
	if (user_src!=null)
   	{
		if(request.getParameter("R1").equals("Title"))
		{
			str_searchvar=request.getParameter("BookTitle");
			str_colvar="Title";
		}
		if(request.getParameter("R1").equals("Category"))	
		{
			chk_ctr=1;
			str_searchvar=request.getParameter("BookCategory");
			str_colvar="Categoryname";
		}
		if(request.getParameter("R1").equals("Publisher"))	
		{
			str_searchvar=request.getParameter("BookPublisher");
			str_colvar="Publisher";
		}
		if(request.getParameter("R1").equals("Author"))
		{
			str_searchvar=request.getParameter("BookAuthor");
			str_colvar="Author";
		}		
		if (request.getParameter("R2")==null)
		{
			tab_var="BOOK_DETAILS";		
		}
		else
		{  
			if (request.getParameter("R2").equals("A"))
			{
				tab_var="TEMP_DETAIL";
			}
			else
			{
				tab_var="BOOK_DETAILS";
			}
		}
		//-------- whether search is by category or other criteria-----------
		if (chk_ctr==0)
		{
			query="SELECT a.*,b.categoryname FROM "+tab_var+" a,CATEGORY_DETAILS b where a."+str_colvar+"= ? and a.categoryid=b.categoryid";
		}
		else
		{
			query="SELECT a.*,b.categoryname FROM "+tab_var+" a,CATEGORY_DETAILS b where b."+str_colvar+"= ? and a.categoryid=b.categoryid";
		} 
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
 conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system"); 
		conn1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system"); 
                conn2=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system"); 
                conn3=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system"); 
		
		PreparedStatement stm = conn.prepareStatement(query);
		stm.setString(1,str_searchvar);
		rs = stm.executeQuery();
		int ctr=0; 
%>
		
	<form name="cart" action="Inter_Cart.jsp" method="POST">
	<table border=1>
	<tr>
	<td>S.No</td>
	<td>Select</td>
	<td>Book Name</td>
	<td>Author Name</td>
	<td>Publisher</td>
	<td>Edition</td>
	<td>Price (in Rs.)</td>
	<td>Quantity Available(Nos.)</td>
	<td>Description</td>
	<td>Category</td>
	</tr>
	<%  
		ResultSet rs1=null;
		String delete_query="truncate  table TEMP_DETAIL";
		String ins_query=null;
		int int_BOOKID,int_CATEGORYID,int_PRICE,int_QUANTITY;
		String str_TITLE,str_AUTHOR,str_PUBLISHER,str_EDITION,str_DESCRIPTION;
		Statement stat_del=conn1.createStatement();
		int rs_del=stat_del.executeUpdate(delete_query);
		while(rs.next())
		{
			ctr=ctr+1;
			out.println("<tr><td>"+ctr);
			int_BOOKID=0;
			int_BOOKID=rs.getInt(1);
			out.println("<td><input type=checkbox name=chk"+ctr+" value="+int_BOOKID+">");
					
			int_CATEGORYID=rs.getInt(2);
						
			str_TITLE=rs.getString(3);
			out.println("<td>");
			out.println(str_TITLE);
			
			str_AUTHOR=rs.getString(4);
			out.println("<td>");
			out.println(str_AUTHOR);
			
			str_PUBLISHER=rs.getString(5);
			out.println("<td>");
			out.println(str_PUBLISHER);
			
			str_EDITION=rs.getString(6);
			out.println("<td>");
			out.println(str_EDITION);
			
			int_PRICE=rs.getInt(7);
			out.println("<td>");
			out.println(int_PRICE);
			
			int_QUANTITY=rs.getInt(8);
			out.println("<td>");
			out.println(int_QUANTITY);

			str_DESCRIPTION=rs.getString(9);
			out.println("<td>");
			out.println(str_DESCRIPTION);

			out.println("<td>");
			out.println(rs.getString(10));
			
			out.println("</tr>");
			ins_query="INSERT INTO TEMP_DETAIL VALUES("+int_BOOKID+","+int_CATEGORYID+",'"+str_TITLE+"','"+str_AUTHOR+"','"+str_PUBLISHER+"','"+str_EDITION+"',"+int_PRICE+","+int_QUANTITY+",'"+str_DESCRIPTION+"')";
			Statement stat_ins=conn2.createStatement(); 
			int rs_ins=stat_ins.executeUpdate(ins_query);
		}
		String str_ctr=String.valueOf(ctr);
		session.putValue("ctr_val",str_ctr);
		Statement stat_combo = conn3.createStatement();
		ResultSet rscombo=null;
		String query1="select * from category_details";
		rscombo=stat_combo.executeQuery(query1);   
	%>
		</table>
		<br>
		<input type="submit" value="Add to Cart" name="Add">
		</form>
                <br>
                    <br>
		<HR>
		<p ><font size="5">Search More</font></p>
		<form name="newsrc" action="NewSearch.jsp" method="POST">
		<table border=1 >
		<tr>	
		<td><input type="radio" value="Category" checked name="R1"></td>
		<td>Search based on Category</td>
		<td>
	  	<select size="1" name="BookCategory">
      		<option selected value="Select">Select Category</option>
		<% 
			while(rscombo.next())
			{
				String category=rscombo.getString(2);
		%>
    		<option value="<%//= category%>"><%//= category%></option>
  		<% 
   			}

		%>
    		</select>
		</td>	
		</tr>
		<tr>
		<td>
		<tr>
      			<td><input type="radio" name="R1" value="Title"></td>
     	 		<td>Search by Book Title</td>
      			<td><input type="text" name="BookTitle" size="25"></td>
    		</tr>
    		<tr>
        		<td><input type="radio" name="R1" value="Author"></td>
      			<td>Search by Book Author</td>
      			<td><input type="text" name="BookAuthor" size="25"></td>
    		</tr>
    		<tr>
      			<td><input type="radio" name="R1" value="Publisher"></td>
     			<td>Search by Book Publisher</td>
      			<td><input type="text" name="BookPublisher" size="25"></td>
    		</tr>
    	
    		<tr>
    			<td><input type="radio" name="R2" value="A">Advanced Search</td>
    			<td><input type="radio" name="R2" value="N" checked>New Search</td>
    			<td><input type=submit value="Search"></td>
    		</tr>    

		</table>
	
		</form>			
		<%  
	}
 	catch(Exception E)
	{
		out.println("Error  "+E);
	}
	finally
	{
		rs.close();
		conn.close();
	}
}
else
{
		response.sendRedirect("Unauthorised.html");
}
   %>  
                                    
	         <!-- content .................................................................end -->                     
                                    
                          		
                        	</div>                        
                      		
               	  	</div>
                    <div style="height:20px"></div>
                    <div class="box_more">
                    	<div class="box_more_l">Books are a man's best friend. They make you rich in knowledge, make you wise, and stay with you through thick and thin. In fact, they are better than a friend because they don’t complain, don’t argue, don’t stress you out, and always keep you happy with interesting stuff.
                          <br> When you are looking to buy books online, shop at Bookstore for delivery of books at the most reasonable rate. </div>
                        <div class="box_more_r">
                        	<a href="#" class="but_more">MORE INFO</a>
                        </div>
                        <div style="clear: both"></div>
                    </div>
                      
                	
        		</div>
    <!-- content ends --> 
    <div style="height:40px"></div>
    <!-- bottom begin -->
    <br>
        <br>
        <div id="bottom_bot">
        <div id="bottom">
        <div id="b_col1">
              <h1>Account & Orders </h1>
                <div style="height:10px"></div>
                    <ul class="spis_bot">
                        <li><a href="#">About Us </a></li>
                        <li><a href="#">Why Shop at Bookworld.com</a></li>
                        <li><a href="#">Highlights</a></li>
                        <li><a href="#">Payment, Shipping & Cancellation Details </a></li>
                        <li><a href="#">Policies & Terms </a></li>
                        <li><a href="#">My Order History</a></li>
                    </ul>
                </div>
                <div id="b_col2">
                    <h1>Contact Us</h1>
                    <div style="height:20px"></div>
                    <div style="padding-left:10px">
                        <div  class="box_us">
                              <div  class="box_us_l">
                                <img src="images/fish_us1.png" alt="" />
                              </div>
                              <div  class="box_us_r">
                                    <b class="lh"> Sec-5,near SBI bank,Rourkela,Odisha,India</b>
                              </div>
                              <div style="clear: both; height:10px;"></div>
                        </div>
                        <div  class="box_us">
                              <div  class="box_us_l">
                                <img src="images/fish_us2.png" alt="" />
                              </div>
                              <div  class="box_us_r">
                                    <b class="lh">Phone:  0661-2404096<br />
                                        Fax: 0661-2404096
                                    </b>
                              </div>
                              <div style="clear: both; height:10px;"></div>
                        </div>
                        <div  class="box_us">
                              <div  class="box_us_l">
                                <img src="images/fish_us3.png" alt="" />
                              </div>
                              <div  class="box_us_r">
                                    <b class="lh">E-mail: bookworld@gmail.com</b>
                              </div>
                              <div style="clear: both; height:10px;"></div>
                        </div>
                    </div>
            </div>
    
            <div id="b_col3">
            	<h1>Share with Others</h1>
              	<div style="height:15px"></div>
                    <ul>
                        <li><img src="images/fu_i1.png" class=" fu_i" alt="" /><a href="#">Subscribe to Blog</a></li>
                        <li><img src="images/fu_i2.png" class=" fu_i" alt="" /><a href="#">Be a fan on Facebook</a></li>
                        <li><img src="images/fu_i3.png" class=" fu_i" alt="" /><a href="#">Search on Google</a></li>
                       <li><img src="images/fu_i4.png" class=" fu_i" alt="" /><a href="#">Follow us on Twitter</a></li>
                    </ul>  
                        
                </div>
          	<div style="clear: both; height:20px;"></div>
        </div>
    </div>
<!-- bottom end --> 
<!-- footer begins -->
            <div id="footer">
          		Bookworld.com 2015 fasterOnline  | <!-- Do not remove --><a href="#" title="Free CSS Templates">Private Limited </a><!-- end --><br />
                <a href="#">Privacy Policy</a> | <a href="#">Terms of Use</a>
             </div>
        <!-- footer ends -->
</div>



</div>
</div>
</div>
</div>

</body>
</html>

