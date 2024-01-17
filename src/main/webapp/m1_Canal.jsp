<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Canal</title>
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
            ResultSet rs = jb.intoarceLinieDupaId("tvchannels", "idChannel", aux);
            rs.first();
            String name = rs.getString("name");
            String type = rs.getString("type");
            String locationChannel = rs.getString("locationChannel");
            rs.close();
            jb.disconnect();
        %>
        <div class="body">
        	<div class="titlu">
    		Tabela Canale:
    		</div>
        	<form action="m2_Canal.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">idChannel:</td>
                    <td> <input type="text" name="idChannel" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Denumire:</td>
                    <td> <input type="text" name="name" size="30" value="<%= name%>"/></td>
                </tr>
                <tr>
                    <td align="right">Tip:</td>
                    <td> <input type="text" name="type" size="30" value="<%= type%>"/></td>
                </tr>
                <tr>
                    <td align="right">Locatie:</td>
                    <td> <input type="text" name="locationChannel" size="30" value="<%= locationChannel%>"/></td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        </div>
    </body>
</html>
