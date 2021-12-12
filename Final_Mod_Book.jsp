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
	
	<H2>Book Details Modified</H2>
	</CENTER>
	<BR>
	<HR>
	<BR>
	<BR>
	<%@ page errorPage="errorpage.jsp" import="java.net.*" %>
	<%@ page import="java.io.*" %>
	<%@ page import="java.sql.*" %>
	<%
		Connection con = null;
		//Statement stat = null;
		PreparedStatement stat = null;
		//Statement stat1 = null;
		PreparedStatement stat1 = null;
		ResultSet rs = null;

		Class.forName("oracle.jdbc.driver.OracleDriver");
 con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system"); 
		
		
		int rs_int;
		int int_BOOKID,int_CATEGORYID,int_PRICE,int_QUANTITY;
		
		String query=null;
		String str_TITLE,str_AUTHOR,str_PUBLISHER,str_EDITION,str_DESCRIPTION;

 		int_BOOKID=Integer.parseInt(request.getParameter("bookid"));
 		int_CATEGORYID=Integer.parseInt(request.getParameter("categoryid"));
 		str_TITLE=request.getParameter("btitle");
 		str_AUTHOR=request.getParameter("bauthor");
 		str_PUBLISHER=request.getParameter("bpub");
 		str_EDITION=request.getParameter("bedition");
 		int_PRICE=Integer.parseInt(request.getParameter("bprice"));
 		int_QUANTITY=Integer.parseInt(request.getParameter("bqty"));
 		str_DESCRIPTION=request.getParameter("bdesc");
 
 		
		query="update book_details set categoryid=?,title=?,author=?,publisher=?,edition=?,price=?,quantity=?,description=? where bookid=?";
		stat = con.prepareStatement(query);
		stat.setInt(1,int_CATEGORYID);
		stat.setString(2,str_TITLE);
		stat.setString(3,str_AUTHOR);
		stat.setString(4,str_PUBLISHER);
		stat.setString(5,str_EDITION);
		stat.setInt(6,int_PRICE);
		stat.setInt(7,int_QUANTITY);
		stat.setString(8,str_DESCRIPTION);
		stat.setInt(9,int_BOOKID);
		
                rs_int=stat.executeUpdate();

		if (rs_int==1)
		{
			out.println("Book details for Book Id "+int_BOOKID+"  successfully modified.");	
		}
		else
		{
			out.println("Sorry Transaction not Completed");
		}
 	%>
 	<BR><BR>
	<a href="Logout.jsp">Click here to logout</a>
	<BR><BR>
	<a href="Admin.html">Click here to go to administrator page</a>
	<BR><BR>
	<a href="Modify.jsp"> Click here to modify more books</a> 
                                    
	         <!-- content .................................................................end -->                     
                                    
                          		
                        	</div>                        
                      		
               	  	</div>
                    <div style="height:20px"></div>
                    <div class="box_more">
                    	<div class="box_more_l">Books are a man's best friend. They make you rich in knowledge, make you wise, and stay with you through thick and thin. In fact, they are better than a friend because they don’t complain, don’t argue, don’t stress you out, and always keep you happy with interesting stuff.
                          <br> When you are looking to buy books online, shop at Bookstore for delivery of books at the most reasonable rate.</div>
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

