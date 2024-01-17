<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel ="stylesheet" href="nou_Client.css">
        <title>Adauga abonament</title>
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
        <%
            int idClient, idChannel;
            String id1, id2, firstName, PrenumeClient, Adresa, NumeCanal, Tip, Locatie, nameSubscription, price;
            id1 = request.getParameter("idClient");
            id2 = request.getParameter("idChannel");
            nameSubscription = request.getParameter("nameSubscription");
            price = request.getParameter("price");
            if (id1 != null) {
                jb.connect();
                jb.adaugaAbonament(java.lang.Integer.parseInt(id1), java.lang.Integer.parseInt(id2), nameSubscription, price);
                jb.disconnect();
        %>
        <div class="after-signup">Succes!</div><%
        } else {
        jb.connect();
        ResultSet rs1 = jb.vedeTabela("clients");
        ResultSet rs2 = jb.vedeTabela("tvchannels");
        %>
        <div class="form-container">
        	<form action="nou_Abonament.jsp" method="post">
            <table>
                <tr>

                    <td> 
                        Selectati clientul:
			<SELECT NAME="idClient">
                                <%
                                    while(rs1.next()){
                                        idClient = rs1.getInt("idClient");
                                        firstName = rs1.getString("firstName");
                                        PrenumeClient = rs1.getString("lastName");
                                        Adresa = rs1.getString("adress");
                                %>
                                    <OPTION VALUE="<%= idClient%>"><%= idClient%>,<%= firstName%>,<%= PrenumeClient%>,<%= Adresa%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                    
                    </td>
                </tr>
                <tr>
                    <td allign="center"> 
                        Selectati canalul:
			<SELECT NAME="idChannel">
				<!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION -->
                                <%
                                    while(rs2.next()){
                                        idChannel = rs2.getInt("idChannel");
                                        NumeCanal = rs2.getString("name");
                                        Tip = rs2.getString("type");
                                        Locatie = rs2.getString("locationChannel");
                                %>
                                    <OPTION VALUE="<%= idChannel%>"><%= idChannel%>,<%= NumeCanal%>,<%= Tip%>,<%= Locatie%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                     </td>
                </tr>
                <tr>
                    <td> <input type="text" name="nameSubscription" size="50" placeholder="Nume abonament"/></td>
                </tr>
                <tr>
                    <td> <input type="text" name="price" size="50" placeholder = "Pret"/></td>
                </tr>
            </table>
            <input type="submit" value="Adauga abonamentul" />
        </form>
        </div>
        <%
            }
        %>
    </body>
</html>
