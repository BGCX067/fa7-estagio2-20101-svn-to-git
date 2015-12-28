
<%@ page import="siga.Impedimento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'impedimento.label', default: 'Impedimento')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'impedimento.id.label', default: 'Id')}" />
                        
                            <th><g:message code="impedimento.usuario.label" default="Usuario" /></th>
                   	    
                            <th><g:message code="impedimento.tarefa.label" default="Tarefa" /></th>
                   	    
                            <g:sortableColumn property="descricao" title="${message(code: 'impedimento.descricao.label', default: 'Descricao')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${impedimentoInstanceList}" status="i" var="impedimentoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${impedimentoInstance.id}">${fieldValue(bean: impedimentoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: impedimentoInstance, field: "usuario")}</td>
                        
                            <td>${fieldValue(bean: impedimentoInstance, field: "tarefa")}</td>
                        
                            <td>${fieldValue(bean: impedimentoInstance, field: "descricao")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${impedimentoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
