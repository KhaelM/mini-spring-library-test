<%-- 
    Document   : recherche
    Created on : Sep 6, 2020, 11:10:57 PM
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
        <fieldset>
            <form method="GET">
                <input type="text" name="nom" placeholder="Nom" value="${param.nom}">
                <span>Naissance entre</span>
                <input type="text" name="dateDebut" placeholder="Debut (YYYY-MM-DD)" value="${param.dateDebut}">
                <input type="text" name="dateFin" placeholder="Fin (YYYY-MM-DD)" value="${param.dateFin}">
                <input type="submit" value="OK">
            </form>
        </fieldset>
        <h1>Résultats de Recherche</h1>
        <table>
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Nom</th>
                    <th>Mort</th>
                    <th>Naissance</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${acteurs}" var="acteur">
                <tr>
                    <td><c:out value="${acteur.id}" /></td>
                    <td><c:out value="${acteur.nom}" /></td>
                    <td><c:out value="${acteur.dateMort}" default="Vivant" /></td>
                    <td><c:out value="${acteur.dateNaissance}" /></td>
                </tr>    
            </c:forEach>

        </tbody>
    </table>
</body>
</html>
