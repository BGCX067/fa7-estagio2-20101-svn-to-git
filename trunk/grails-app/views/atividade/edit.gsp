
<%@ page import="siga.Atividade" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'atividade.label', default: 'Atividade')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${atividadeInstance}">
            <div class="errors">
                <g:renderErrors bean="${atividadeInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${atividadeInstance?.id}" />
                <g:hiddenField name="version" value="${atividadeInstance?.version}" />
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
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tarefas"><g:message code="atividade.tarefas.label" default="Tarefas" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: atividadeInstance, field: 'tarefas', 'errors')}">
                                    
<ul>
<g:each in="${atividadeInstance?.tarefas?}" var="t">
    <li><g:link controller="tarefa" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="tarefa" action="create" params="['atividade.id': atividadeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'tarefa.label', default: 'Tarefa')])}</g:link>

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
