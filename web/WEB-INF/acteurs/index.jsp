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
        <h1>Liste de tous les acteurs</h1>
        <table>
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Nom</th>
                    <th>Mort</th>
                    <th>Naissance</th>
                    <th>Films Joués (ManyToMany)</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${acteurs}" var="acteur">
                <tr>
                    <td><c:out value="${acteur.id}" /></td>
                    <td>
                        <a href='<c:url value="/acteurs/${acteur.id}/mysql.action"/>'><c:out value="${acteur.nom}" /></a>
                    </td>
                    <td><c:out value="${acteur.dateMort}" default="Vivant" /></td>
                    <td><c:out value="${acteur.dateNaissance}" /></td>
                    <td>
                        <c:forEach items="${acteur.films}" var="film">
                            <a href='<c:url value="/films/${film.id}/mysql.action"/>'><c:out value="${film.nom}"/></a>, 
                        </c:forEach>
                    </td>
                </tr>    
                </c:forEach>
                
            </tbody>
            <div>indice: <c:out value="${sessionScope.indice}" /></div>
            <div><c:out value="${sessionScope.parite}" /></div>
        </table>
    </body>
</html>
