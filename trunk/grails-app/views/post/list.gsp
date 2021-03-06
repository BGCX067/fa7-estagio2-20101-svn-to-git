
<%@ page import="siga.Post" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'post.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="titulo" title="${message(code: 'post.titulo.label', default: 'Titulo')}" />
                        
                            <th><g:message code="post.usuario.label" default="Usuario" /></th>
                   	    
                            <g:sortableColumn property="conteudo" title="${message(code: 'post.conteudo.label', default: 'Conteudo')}" />
                        
                            <g:sortableColumn property="publicacao" title="${message(code: 'post.publicacao.label', default: 'Publicacao')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${postInstanceList}" status="i" var="postInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${postInstance.id}">${fieldValue(bean: postInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: postInstance, field: "titulo")}</td>
                        
                            <td>${fieldValue(bean: postInstance, field: "usuario")}</td>
                        
                            <td>${fieldValue(bean: postInstance, field: "conteudo")}</td>
                        
                            <td><g:formatDate date="${postInstance.publicacao}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${postInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
