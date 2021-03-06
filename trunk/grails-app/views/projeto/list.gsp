
<%@ page import="siga.Projeto" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'projeto.label', default: 'Projeto')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'projeto.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="nome" title="${message(code: 'projeto.nome.label', default: 'Nome')}" />
                        
                            <g:sortableColumn property="descricao" title="${message(code: 'projeto.descricao.label', default: 'Descricao')}" />
                        
                            <g:sortableColumn property="previsaoDeDuracao" title="${message(code: 'projeto.previsaoDeDuracao.label', default: 'Previsao De Duracao')}" />
                        
                            <g:sortableColumn property="valorOrcado" title="${message(code: 'projeto.valorOrcado.label', default: 'Valor Orcado')}" />
                        
                            <g:sortableColumn property="tamanhoDaSprint" title="${message(code: 'projeto.tamanhoDaSprint.label', default: 'Tamanho Da Sprint')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${projetoInstanceList}" status="i" var="projetoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${projetoInstance.id}">${fieldValue(bean: projetoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: projetoInstance, field: "nome")}</td>
                        
                            <td>${fieldValue(bean: projetoInstance, field: "descricao")}</td>
                        
                            <td>${fieldValue(bean: projetoInstance, field: "previsaoDeDuracao")}</td>
                        
                            <td>${fieldValue(bean: projetoInstance, field: "valorOrcado")}</td>
                        
                            <td>${fieldValue(bean: projetoInstance, field: "tamanhoDaSprint")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${projetoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
