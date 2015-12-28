
<%@ page import="siga.Atividade" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'atividade.label', default: 'Atividade')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${atividadeInstance}">
            <div class="errors">
                <g:renderErrors bean="${atividadeInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="descricao"><g:message code="atividade.descricao.label" default="Descricao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: atividadeInstance, field: 'descricao', 'errors')}">
                                    <g:textField name="descricao" value="${atividadeInstance?.descricao}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="prioridade"><g:message code="atividade.prioridade.label" default="Prioridade" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: atividadeInstance, field: 'prioridade', 'errors')}">
                                    <g:select name="prioridade" from="${0..9}" value="${fieldValue(bean: atividadeInstance, field: 'prioridade')}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="defineObjeto"><g:message code="atividade.defineObjeto.label" default="Define Objeto" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: atividadeInstance, field: 'defineObjeto', 'errors')}">
                                    <g:checkBox name="defineObjeto" value="${atividadeInstance?.defineObjeto}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="projeto"><g:message code="atividade.projeto.label" default="Projeto" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: atividadeInstance, field: 'projeto', 'errors')}">
                                    <g:select name="projeto.id" from="${siga.Projeto.list()}" optionKey="id" value="${atividadeInstance?.projeto?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="estimativa"><g:message code="atividade.estimativa.label" default="Estimativa" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: atividadeInstance, field: 'estimativa', 'errors')}">
                                    <g:textField name="estimativa" value="${fieldValue(bean: atividadeInstance, field: 'estimativa')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sprint"><g:message code="atividade.sprint.label" default="Sprint" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: atividadeInstance, field: 'sprint', 'errors')}">
                                    <g:select name="sprint.id" from="${siga.Sprint.list()}" optionKey="id" value="${atividadeInstance?.sprint?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
