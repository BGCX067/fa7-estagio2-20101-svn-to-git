
<%@ page import="siga.Tarefa" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'tarefa.label', default: 'Tarefa')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'tarefa.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="estimativa" title="${message(code: 'tarefa.estimativa.label', default: 'Estimativa')}" />
                        
                            <g:sortableColumn property="descricao" title="${message(code: 'tarefa.descricao.label', default: 'Descricao')}" />
                        
                            <th><g:message code="tarefa.atividade.label" default="Atividade" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${tarefaInstanceList}" status="i" var="tarefaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${tarefaInstance.id}">${fieldValue(bean: tarefaInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: tarefaInstance, field: "estimativa")}</td>
                        
                            <td>${fieldValue(bean: tarefaInstance, field: "descricao")}</td>
                        
                            <td>${fieldValue(bean: tarefaInstance, field: "atividade")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${tarefaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
