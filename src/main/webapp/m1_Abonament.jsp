<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Abonament</title>
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
        <br/>
        <%
            jb.connect();
            String firstName, lastName, adress, name, type, location, nameSubscription, price;

            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceAbonamentId(aux);
            rs.first();
            int id1 = rs.getInt("idClient");
            int id2 = rs.getInt("idChannel");

            firstName = rs.getString("firstName");
            lastName = rs.getString("lastName");
            adress = rs.getString("adress");
            name = rs.getString("name");
            type = rs.getString("type");
            location = rs.getString("locationChannel");
            nameSubscription = rs.getString("nameSubscription");
            price = rs.getString("price");

            ResultSet rs1 = jb.vedeTabela("clients");
            ResultSet rs2 = jb.vedeTabela("tvchannels");
            int idClient, idChannel;


        %>
        <div class="form-container">
        	<form action="m2_Abonament.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdAbonament:</td>
                    <td> <input type="text" name="idSubscription" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">idClient:</td>
                    <td> 
                        <SELECT NAME="idClient">
                            <%
                                while (rs1.next()) {
                                    idClient = rs1.getInt("idClient");
                                    firstName = rs1.getString("firstName");
                                    lastName = rs1.getString("lastName");
                                    adress = rs1.getString("adress");
                                    if (idClient != id1) {
                            %>
                            <OPTION VALUE="<%= idClient%>"><%= idClient%>, <%= firstName%>, <%= lastName%>, <%= adress%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idClient%>"><%= idClient%>, <%= firstName%>, <%= lastName%>, <%= adress%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">idChannel:</td>
                    <td> 
                        <SELECT NAME="idChannel">
                            <%
                                while (rs2.next()) {
                                    idChannel = rs2.getInt("idChannel");
                                    name = rs2.getString("name");
                                    location = rs2.getString("locationChannel");
                                    type = rs2.getString("type");
                            if (idChannel != id2) {
                            %>
                            <OPTION VALUE="<%= idChannel%>"><%= idChannel%>, <%= name%>, <%= location%>, <%= type%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idChannel%>"><%= idChannel%>, <%= name%>, <%= location%>, <%= type%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">Nume abonament:</td>
                    <td> <input type="text" name="nameSubscription" size="30" value="<%= name%>"/></td>
                </tr>
                <tr>
                    <td align="right">Price:</td>
                    <td> <input type="text" name="price" size="30" value="<%= price%>"/></td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        </div>
            <br/>
    </body>
    <%
        rs.close();
        rs1.close();
        rs2.close();
        jb.disconnect();
    %>
</html>
