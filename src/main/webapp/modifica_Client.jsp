<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Clienti</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <link rel ="stylesheet" href="modifica_Client.css">
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
    	
    	<div class="body">
    	
    	<div class="titlu">
    		Tabela Clienti:
    	</div>
    	
    	<form action="m1_Client.jsp" method="post">
            <table border="1" align="center">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>IdClient:</b></td>
                    <td><b>firstName:</b></td>
                    <td><b>lastName:</b></td>
                    <td><b>adress:</b></td>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("clients");
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("idClient");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
                    <td><%= x%></td>
                    <td><%= rs.getString("firstName")%></td>
                    <td><%= rs.getString("lastName")%></td>
                    <td><%= rs.getString("adress")%></td>
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
    	
    	</div>
        <%
    jb.disconnect();
    %>
        <br/>
    </body>
</html>
