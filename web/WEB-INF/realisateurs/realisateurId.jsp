<%-- 
    Document   : realisateurId
    Created on : Sep 7, 2020, 1:48:24 AM
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
        <h1>Realisateur Par Id</h1>
        <div>Id: <strong><c:out value="${realisateur.id}" /></strong></div>
        <div>Nom: <strong><c:out value="${realisateur.nom}" /></strong></div>
        <div>Films Réalisés (OneToMany):
            <c:forEach items="${realisateur.films}" var="film">
                <a href="<c:url value="/films/${film.id}/mysql.action"/>"><c:out value="${film.nom}"/></a>, 
            </c:forEach>
        </div>
    </body>
</html>

