<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel ="stylesheet" href="nou_Client.css">
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
            String name = request.getParameter("name");
            String type = request.getParameter("type");
            String locationChannel = request.getParameter("locationChannel");
            if (name != null) {
                jb.connect();
                jb.adaugaTvChannel(name, type, locationChannel);
                jb.disconnect();
        %>
        <div class="after-signup">Succes!</div><%
        } else {
        %>
        <div class="form-container">
        	<form action="nou_Canal.jsp" method="post">
            <table>
                <tr>
                    <td> <input type="text" name="name" size="40" placeholder="Numa canal"/></td>
                </tr>
                <tr>
                    <td> <input type="text" name="type" size="30" placeholder="Tip canal"/></td>
                </tr>
                <tr>
                    <td> <input type="text" name="locationChannel" size="30" placeholder="Locatie Canal"/></td>
                </tr>
            </table>
            <input type="submit" value="Adauga canalul" />
        </form>
        </div>
        <%
            }
        %>
        <br/>
        <br/>
    </body>
</html>
