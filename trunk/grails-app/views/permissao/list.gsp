
<%@ page import="siga.Permissao" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'permissao.label', default: 'Permissao')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'permissao.id.label', default: 'Id')}" />
                        
                            <th><g:message code="permissao.projeto.label" default="Projeto" /></th>
                   	    
                            <th><g:message code="permissao.usuario.label" default="Usuario" /></th>
                   	    
                            <g:sortableColumn property="perfil" title="${message(code: 'permissao.perfil.label', default: 'Perfil')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${permissaoInstanceList}" status="i" var="permissaoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${permissaoInstance.id}">${fieldValue(bean: permissaoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: permissaoInstance, field: "projeto")}</td>
                        
                            <td>${fieldValue(bean: permissaoInstance, field: "usuario")}</td>
                        
                            <td>${fieldValue(bean: permissaoInstance, field: "perfil")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${permissaoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
