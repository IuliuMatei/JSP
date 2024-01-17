<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Client</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
        <link rel ="stylesheet" href="m1_Client.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
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
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("clients", "idClient", aux);
            rs.first();
            String firstName = rs.getString("firstName");
            String lastName = rs.getString("lastName");
            String adress = rs.getString("adress");
            rs.close();
            jb.disconnect();
        %>
        <div class="body">
        	<div class="titlu">
    		Tabela Clienti:
    		</div>
        	<form action="m2_Client.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">idClient:</td>
                    <td> <input type="text" name="idClient" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">First Name:</td>
                    <td> <input type="text" name="firstName" size="30" value="<%= firstName%>"/></td>
                </tr>
                <tr>
                    <td align="right">Last Name:</td>
                    <td> <input type="text" name="lastName" size="30" value="<%= lastName%>"/></td>
                </tr>
                <tr>
                    <td align="right">Adress:</td>
                    <td> <input type="text" name="adress" size="30" value="<%= adress%>"/></td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        </div>
    </body>
</html>
