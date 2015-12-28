
<%@ page import="siga.Tarefa" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'tarefa.label', default: 'Tarefa')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${tarefaInstance}">
            <div class="errors">
                <g:renderErrors bean="${tarefaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="estimativa"><g:message code="tarefa.estimativa.label" default="Estimativa" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tarefaInstance, field: 'estimativa', 'errors')}">
                                    <g:textField name="estimativa" value="${fieldValue(bean: tarefaInstance, field: 'estimativa')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="descricao"><g:message code="tarefa.descricao.label" default="Descricao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tarefaInstance, field: 'descricao', 'errors')}">
                                    <g:textField name="descricao" value="${tarefaInstance?.descricao}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="atividade"><g:message code="tarefa.atividade.label" default="Atividade" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tarefaInstance, field: 'atividade', 'errors')}">
                                    <g:select name="atividade.id" from="${siga.Atividade.list()}" optionKey="id" value="${tarefaInstance?.atividade?.id}"  />
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
