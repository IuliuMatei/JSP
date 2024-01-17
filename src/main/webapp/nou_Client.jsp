<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga client</title>
        <link rel ="stylesheet" href="nou_Client.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <hr>
    <body>
    	<div class="header">
    		<div class="left-side">
    			<a href="index.html"><img src="icons8-home-50.png"></a>
    		</div>
    		<div class="right-side">
    			Welcome to MyBroadcastingService!
    		</div>
    	</div>
    	    <hr>
        <%
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String adress = request.getParameter("adress");
            if (firstName != null) {
                jb.connect();
                jb.adaugaClient(firstName, lastName, adress);
                jb.disconnect();
        %>
        <div class="after-signup">Succes!</div><%
        } else {
        %>
        <div class="form-container">
        	<form action="nou_Client.jsp" method="post">
            <table>
                <tr>
                    <td align="right"></td>
                    <td> <input type="text" name="firstName" size="40" placeholder="First Name"/></td>
                </tr>
                <tr>
                    <td align="right"></td>
                    <td> <input type="text" name="lastName" size="30" placeholder="Last Name" /></td>
                </tr>
                <tr>
                    <td align="right"></td>
                    <td> <input type="text" name="adress" size="30" placeholder="Adress"/></td>
                </tr>
            </table>
            <input type="submit" value="Sign up" />
        </form>
        </div>
        <%
            }
        %>
        <br/>
        <br/>
    </body>
</html>
