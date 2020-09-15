<%-- 
    Document   : formulaire
    Created on : Sep 7, 2020, 1:55:15 AM
    Author     : miker
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${titre} - Framework</title>
    </head>
    <body>
        <h1>Création Film</h1>
        <fieldset>
            <form method="POST">
                <div>Nom: <input type="text" name="nom"></div>
                <div>Id Realisateur (ManyToOne): <input type="text" name="idRealisateur"></div>
                <div>Id Acteurs (ManyToMany): <input name="idActeurs" type="text" placholder="ex: 1;3;5;6"></div>
                <div><input type="submit" name="update" value="Ok"></div>
            </form>
        </fieldset>
    </body>
</html>
