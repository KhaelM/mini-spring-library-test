<%-- 
    Document   : home
    Created on : Mar 15, 2020, 1:19:51 PM
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
        <h1>Liste de tous les films</h1>
        <table>
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Nom</th>
                    <th>Realisateur (ManyToOne)</th>
                    <th>Acteurs (ManyToMany)</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${films}" var="film">
                <tr>
                    <td><c:out value="${film.id}" /></td>
                    <td>
                        <a href='<c:url value="/films/${film.id}/mysql.action"/>'><c:out value="${film.nom}" /></a>
                    </td>
                    <td>
                        <a href='<c:url value="/realisateurs/${film.realisateur.id}/mysql.action"/>'><c:out value="${film.realisateur.nom}"/></a>
                    </td>
                    <td>
                        <c:forEach items="${film.acteurs}" var="acteur">
                            <a href='<c:url value="/acteurs/${acteur.id}/mysql.action"/>'><c:out value="${acteur.nom}"/></a>,   
                        </c:forEach>
                    </td>
                </tr>    
                </c:forEach>
                
            </tbody>
        </table>
        <div><c:out value="${message}"/></div>
    </body>
</html>

