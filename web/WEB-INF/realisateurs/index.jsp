<%-- 
    Document   : index
    Created on : Sep 7, 2020, 1:41:58 AM
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
        <h1>Liste de tous les realisateurs</h1>
        <table>
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Nom</th>
                    <th>Films Réalisés (OneToMany)</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${realisateurs}" var="realisateur">
                    <tr style="text-align: left">
                        <td><c:out value="${realisateur.id}" /></td>
                        <td>
                            <a href='<c:url value="/realisateurs/${realisateur.id}/mysql.action"/>'><c:out value="${realisateur.nom}" /></a>
                        </td>
                        <td>
                            <c:forEach items="${realisateur.films}" var="film">
                                <a href='<c:url value="/films/${film.id}/mysql.action"/>'><c:out value="${film.nom}"/></a>,     
                            </c:forEach>
                        </td>
                    </tr>    
                </c:forEach>

            </tbody>
        </table>
    </body>
</html>

