<%-- 
    Document   : acteurId
    Created on : Sep 6, 2020, 9:46:46 PM
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
        <h1>Acteur Par Id</h1>
        <div>Id: <strong><c:out value="${acteur.id}" /></strong></div>
        <div>Nom: <strong><c:out value="${acteur.nom}" /></strong></div>
        <div>Mort: <strong><c:out value="${acteur.dateMort}" /></strong></div>
        <div>Naissance: <strong><c:out value="${acteur.dateNaissance}" default="Toujours Vivant" /></strong></div>
        <div>Films Jouées (ManyToMany):
            <c:forEach items="${acteur.films}" var="film">
                <a href="<c:url value="/films/${film.id}/mysql.action"/>"><c:out value="${film.nom}"/></a>, 
            </c:forEach>
        </div>
    </body>
</html>
