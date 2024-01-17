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
    		Tabela Canale:
    	</div>
    	
    	<form action="m1_Canal.jsp" method="post">
            <table border="1" align="center">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>IdChannel:</b></td>
                    <td><b>name:</b></td>
                    <td><b>type:</b></td>
                    <td><b>location:</b></td>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("tvchannels");
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("idChannel");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
                    <td><%= x%></td>
                    <td><%= rs.getString("name")%></td>
                    <td><%= rs.getString("type")%></td>
                    <td><%= rs.getString("locationChannel")%></td>
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
