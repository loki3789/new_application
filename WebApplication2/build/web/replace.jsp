<%-- 
    Document   : delete
    Created on : Oct 24, 2018, 7:54:41 PM
    Author     : lokesh
--%>

<%@page import="java.util.Base64"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.database.Database_Controller" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="newcss1.css">


    </head>
    <body>
   
        <h2 style="align-content:center;background-color:black;color:white"> Replace image</h2>
        </br>
        </br>
        <form action="replace_at_database1">
        <%      Database_Controller db = new Database_Controller();
                ResultSet rs = db.get();
                while (rs.next()) {
                    Blob image = rs.getBlob("image");
                    byte[] image_array = image.getBytes(1, (int) image.length());
                    byte[] x64_image = Base64.getEncoder().encode(image_array);
                    String xstring = new String(x64_image, "UTF-8");
        %>
                
                
<div class="row">
    <div class="column">
                <figure>
                    <img src="data: image/png;base64,<%=xstring%>" style="width:100%;height: 100%"  class="hover-shadow cursor">
                    <figcaption style="margin-left:0%">
                        <%=rs.getString(3)%>
                        <input style="width: 50%" type="text" id="myFile" size="50"placeholder="enter path" name="<%=rs.getString(3)%>">
                        <input type="checkbox" check="checked"  name="imageschecked" value="<%=rs.getString(3)%>">
                        
                    </figcaption>
                </figure>
            </div>
            <% } %>

        </div>
            <input  type="submit" value="update selected images" style="margin-left:200px;"/>
            </form>
    </body>
</html>