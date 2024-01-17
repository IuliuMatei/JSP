<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel ="stylesheet" href="tabela_Clients.css">
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
    	
    	<div class="body">
    	
    		<div class="titlu">
    			Tabel abonamente
    		</div>
    		<br/>
    		
    		<form action="sterge_Abonament.jsp" method="post">
            <table border="1" align="center">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>IdAbonament:</b></td>
                    <td><b>Nume:</b></td>
                    <td><b>idClient:</b></td>
                    <td><b>idCanal</b></td>
                    <td><b>Pret</b></td>

                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("subscription");
                    long x;
                    while (rs.next()) {
                        x = rs.getInt("idSubscription");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td><td><%= x%></td>
                    <td><%= rs.getString("nameSubscription")%></td>
                    <td><%= rs.getInt("idClient")%></td>
                    <td><%= rs.getInt("idChannel")%></td>
                    <td><%= rs.getInt("price")%></td>
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
                <input type="submit" value="Sterge liniile marcate">
            </p>
        </form>
    	
    	</div>
        <%
            rs.close();
            jb.disconnect();
        %>
        <br/>
    </body>
</html>
