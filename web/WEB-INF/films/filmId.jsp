<%-- 
    Document   : filmId
    Created on : Sep 7, 2020, 1:24:14 AM
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
        <h1>Film Par Id</h1>
        <fieldset>
            <form method="POST">
                <div>Id: <input type="text" name="id" value="${film.id}" readonly></div>
                <div>Nom: <input type="text" name="nom" value="${film.nom}"></div>
                <div>Realisateur (ManyToOne): <a href='<c:url value="/realisateurs/${film.realisateur.id}/mysql.action"/>'><c:out value="${film.realisateur.nom}"/></a> <input type="text" placeholder="Nouveau nom" name="realisateur.nom"></div>
                <div>Acteurs (ManyToMany):
                    <c:forEach items="${film.acteurs}" var="acteur">
                        <a href="<c:url value="/acteurs/${acteur.id}/mysql.action"/>"><c:out value="${acteur.nom}"/></a>, 
                    </c:forEach>
                </div>
                <input type="hidden" name="realisateur.id" value="${film.realisateur.id}">
                <button type="submit" name="update" value="Update">Update</button>
                <button type="submit" name="supprimer" value="Supprimer">Supprimer</button>
            </form>
        </fieldset>
        <div><c:out value="${message}"/></div>
    </body>
</html>