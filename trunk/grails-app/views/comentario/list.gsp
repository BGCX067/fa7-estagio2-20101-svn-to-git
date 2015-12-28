
<%@ page import="siga.Comentario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'comentario.label', default: 'Comentario')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'comentario.id.label', default: 'Id')}" />
                        
                            <th><g:message code="comentario.post.label" default="Post" /></th>
                   	    
                            <th><g:message code="comentario.usuario.label" default="Usuario" /></th>
                   	    
                            <g:sortableColumn property="comentario" title="${message(code: 'comentario.comentario.label', default: 'Comentario')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${comentarioInstanceList}" status="i" var="comentarioInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${comentarioInstance.id}">${fieldValue(bean: comentarioInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: comentarioInstance, field: "post")}</td>
                        
                            <td>${fieldValue(bean: comentarioInstance, field: "usuario")}</td>
                        
                            <td>${fieldValue(bean: comentarioInstance, field: "comentario")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${comentarioInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
