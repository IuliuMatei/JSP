<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Canale</title>
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
            int aux = java.lang.Integer.parseInt(request.getParameter("idChannel"));
            String name = request.getParameter("name");
            String type = request.getParameter("type");
            String locationChannel = request.getParameter("locationChannel");

            String[] valori = {name, type, locationChannel};
            String[] campuri = {"name", "type", "locationChannel"};
            jb.modificaTabela("tvchannels", "idChannel", aux, campuri, valori);
            jb.disconnect();
        %>
        <div class="body">
        	<div class="modificari">
        		Modificarile au fost efectuate!
        	</div>
        </div>
    </body>
</html>

