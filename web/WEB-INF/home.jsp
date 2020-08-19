<%-- 
    Document   : home
    Created on : Mar 15, 2020, 1:19:51 PM
    Author     : miker
--%>

<%@page import="model.Person"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Home</h1>
        <form action="json.action" method="POST">
            <input type="text" name="nom" placeholder="nom"/>
            <input type="text" name="dateNaissance" placeholder="date de naissance"/>
            <input type="text" name="age" placeholder="age"/>
            <input type="submit" value="Ok"/>
        </form>
        <% Person michael =  (Person) request.getAttribute("personne"); %>
        <div>Nom: <%= michael.getNom() %></div>
        <div>Age: <%= michael.getAge() %></div>
        <div>Date de Naissance: <%= michael.getDateNaissance() %></div
        <div>Foo: ${sessionScope.Foo}</div>
    </body>
</html>
