
<%@ page import="siga.Atividade" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'atividade.label', default: 'Atividade')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'atividade.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="descricao" title="${message(code: 'atividade.descricao.label', default: 'Descricao')}" />
                        
                            <g:sortableColumn property="prioridade" title="${message(code: 'atividade.prioridade.label', default: 'Prioridade')}" />
                        
                            <g:sortableColumn property="defineObjeto" title="${message(code: 'atividade.defineObjeto.label', default: 'Define Objeto')}" />
                        
                            <th><g:message code="atividade.projeto.label" default="Projeto" /></th>
                   	    
                            <g:sortableColumn property="estimativa" title="${message(code: 'atividade.estimativa.label', default: 'Estimativa')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${atividadeInstanceList}" status="i" var="atividadeInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${atividadeInstance.id}">${fieldValue(bean: atividadeInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: atividadeInstance, field: "descricao")}</td>
                        
                            <td>${fieldValue(bean: atividadeInstance, field: "prioridade")}</td>
                        
                            <td><g:formatBoolean boolean="${atividadeInstance.defineObjeto}" /></td>
                        
                            <td>${fieldValue(bean: atividadeInstance, field: "projeto")}</td>
                        
                            <td>${fieldValue(bean: atividadeInstance, field: "estimativa")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${atividadeInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
