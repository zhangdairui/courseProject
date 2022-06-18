<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import ="java.sql.*, beans.*, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>NJIT Register System</title>
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
<style>
/*================STYLE START====================
=================================================*/

body {
    background-color: #AFE1E2;
    text-align: center;
}
p{
color:red;
font-family: Verdana;
font-weight:bold;
}

/*====================================style for header*/
h1 {
  padding: 1rem 3rem;
  color: #fff;
  border-radius: 100vh;
  background-image: -webkit-gradient(linear, right top, left top, from(#054E87), to(#5498AD));
  background-image: -webkit-linear-gradient(right, #054E87 0%, #5498AD 100%);
  background-image: linear-gradient(to left, #054E87 0%, #5498AD 100%);
}
h3{
  color:#276873;
  font-family: Verdana;
}
.line {
  position: relative;
  height: 1px;
  border-width: 0;
  background-image: -webkit-linear-gradient(left,
  transparent 0%,#283593 50%,transparent 100%);
  background-image:         linear-gradient(90deg,
  transparent 0%,#283593 50%,transparent 100%);
}
/*====================================style for menu*/

.radio-menu{
  width: 90%;
  padding-top: 30px;
  padding-bottom: 30px;
  margin: 2em auto;

}
.radio-menu input[type='radio'] {
  position: absolute;
  z-index: -1;
  opacity: 0;
}
.radio-menu label {
  color:#054E87;
  font-size: 18px;
  font-family: Verdana;
  font-weight:bold;
  position: relative;
  display: inline-block;
  margin-right: 30px;
  padding-right: 10px;
  padding-left: 35px;
  cursor: pointer;
}
.radio-menu label::before {
  position: absolute;
  z-index: -1;
  top: 0;
  left: 0;
  display: block;
  width: 22px;
  height: 22px;
  content: ' ';
  border: 2px solid #054E87;
  border-radius: 4px;
}
.radio-menu input[type='radio'] + label::before {
  border-radius: 18px;
}
.radio-menu input[type='radio']:checked + label {
/*  padding-left: 10px;*/
  color: #ffffff;
}
.radio-menu input[type='radio']:checked + label::before {
  top: 0;
  width: 109%;
  height: 100%;
  background: #054E87;

}
/* Transition */
.radio-menu label, .radio-menu label::before {
  -webkit-transition: 0.25s all ease;
          transition: 0.25s all ease;
}

/*====================================style for search service*/
.ipselect {
  overflow: hidden;
  width: 90%;
  margin: 2em auto;
  text-align: center;
}
.ipselect select {
  font-size: 15px;
  width: 100%;
  padding-right: 1em;
  cursor: pointer;
  text-indent: 0.01px;
  text-overflow: ellipsis;
  border: none;
  outline: none;
  background: transparent;
  background-image: none;
  box-shadow: none;
  -webkit-appearance: none;
  appearance: none;
}
.ipselect select::-ms-expand {
    display: none;
}
.ipselect.sl04 {
  position: relative;
  border-radius: 2px;
  border: 2px solid #599bb3;
  border-radius: 50px;
  background: #ffffff;
}
.ipselect.sl04::before {
  position: absolute;
  top: 0.8em;
  right: 0.8em;
  width: 0;
  height: 0;
  padding: 0;
  content: '';
  border-left: 6px solid transparent;
  border-right: 6px solid transparent;
  border-top: 6px solid #599bb3;
  pointer-events: none;
}
.ipselect.sl04 select {
  padding: 8px 38px 8px 8px;
  color: #599bb3;
}
.search-result{
  margin-top: 30px;
}

table {
  font-family: Verdana;
  border-collapse: collapse;
  margin: 0 auto;
  padding: 0;
  width: 600px;
  margin-left: auto;
  margin-right: auto;
  box-shadow: 0 0 15px -6px #00000073;
}

table tr {
  background-color: #fff;
}

table th,
table td {
  padding: 20px 0;
  border-bottom: 1px solid #eee;
}

table  th {
  width: 20%;
  padding: 10px 0;
  font-size: 14px;
  padding: 15px;
  background-color: #5498AD;
  color:#fff;
}

table tr{
  text-align: center;
  width: 20%;
  padding: 20px 0;
  background-color: #fff;
  color:#3a3a3a;
}

table tr:hover{
  background-color: #d4faff;
}



/*====================================style for register service*/

.textbox{
    width: 70%; 
    padding: 10px 15px; 
    font-size: 16px;
    border-radius: 100vh;
    border: 2px solid #ddd; 
    box-sizing: border-box; 
}
.txtlable{
    font-family: Verdana;
    font-weight:bold;
    color:#054E87;
}

.button{
  border:none;
  box-shadow: 0px 10px 14px -7px #276873;
  background:linear-gradient(to bottom, #599bb3 5%, #408c99 100%);
  background-color:#599bb3;
  border-radius:100vh;
  display:inline-block;
  cursor:pointer;
  color:#ffffff;
  font-family: Verdana;
  font-size:20px;
  font-weight:bold;
  padding:13px 50px;
  text-decoration:none;
  text-shadow:0px 1px 0px #3d768a;}
  .button:hover {
    background:linear-gradient(to bottom, #408c99 5%, #599bb3 100%);
    background-color:#408c99;
}
  .button:active {
    position:relative;
    top:1px;
}

.success-message{
  color:green;
  font-weight:bold;
}
.fail-message{
  color: red;
  font-weight:bold;
}
/*================STYLE END====================
===============================================*/
</style>

</head>

<body>

    <header>
        <h1>NJIT Register System</h1>
        <h3>Welcome to course registration site of NJIT</h3>
        <hr class="line" />
    </header>

    <div class="radio-menu">
        <form>
            <input class = "radio" type="radio" name="menu" value="search" id="search">
             <label for="search" class="radio-label"> Course Search</label>
           
            <input class = "radio" type="radio" name="menu" value="registration" id="registration">
            <label for="registration" class="radio-label"> Course Registration</label>

        </form>
    </div>
    <div class="container">
        <!-- search page -->
        <div class="search-content" style="display:none">
          
          
            <form action="http://localhost:8080/CS602mid/Search">

                <div class="ipselect sl04">
                <select name="semester-select">
                    <option value="default" hidden>select semester</option>
                    <option value="fall2021">Fall2021</option>
                    <option value="spring2022">Spring2022</option>
                </select>
                </div>
                <br><br>
                
                <input type="submit" value="Submit" class="button">
            </form>
          
          <div class="search-result">
            <h3>Search Result:</h3>
            <table class="result　col4t">
             <thead>
                <tr>
                  <th>CourseID</th>
                  <th>Semester</th>
                  <th>Course name</th>
                </tr>
                <tbody></tbody>
              </thead>
				<% List<Course> list= (List<Course>)request.getAttribute("list_course"); 
				if(list==null || list.size()<1){
			    	  out.print("<p>Please Select Semester!</p>");
			      }else {
					for(Course b:list){ %>
                <tr>        
                  <td><%=b.getID() %></td>
                  <td><%=b.getSemester() %></td>
                  <td><%=b.getName() %></td>
                </tr>
		<%
  		}}
	  %>
			
            </table>
            
          </div>

            
        </div>

        <!-- registration page -->
        <div class="registration-content">
            <form action="http://localhost:8080/CS602mid/Main">
                <p class="txtlable">Course ID:</p>
                <input class="textbox" type="text" name="id">
                <br><br>
                <p class="txtlable">Semester:</p>
            
                <input  class="textbox" type="text" name="semester">
                <br><br>
                <input type="submit" value="Register" class="button">
            </form>
            
            <div class="success-message">
            <% String a = (String)request.getAttribute( "result-massage");
           	 String message;
            if(a == null){message = " ";}else{message = a;}%>
            <%=message %>
            </div>
        </div>
    </div>
    
    
</body>
<script type="text/javascript">
$(document).ready(function() {
    <%String menuCheck = "1";
    String d = (String)request.getAttribute("menu-check");
    System.out.println(d);
    if(d == null){
    	menuCheck = "1"; %>
    	$("#search").attr("checked","checked");
        $(".search-content").show('slow');
        $(".registration-content").hide('slow');
        <%}else{
        	
    	menuCheck = d;%>
    	$("#registration").attr("checked","checked");
    	$(".search-content").hide('slow');
        $(".registration-content").show('slow');
    	
        <%}
    %>


    $('input[type="radio"]').click(function() {
        if ($(this).attr("value") == "search") {
            $(".registration-content").hide('slow');
            $(".search-content").show('slow');
        }

        if ($(this).attr("value") == "registration") {
            $(".search-content").hide('slow');
            $(".registration-content").show('slow');
        }
    });


});
</script>

</html>