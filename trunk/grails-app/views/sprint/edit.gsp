
<%@ page import="siga.Sprint" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'sprint.label', default: 'Sprint')}" />
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
            <g:hasErrors bean="${sprintInstance}">
            <div class="errors">
                <g:renderErrors bean="${sprintInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${sprintInstance?.id}" />
                <g:hiddenField name="version" value="${sprintInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="estado"><g:message code="sprint.estado.label" default="Estado" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sprintInstance, field: 'estado', 'errors')}">
                                    <g:select name="estado" from="${siga.Estado?.values()}" value="${sprintInstance?.estado}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="deadline"><g:message code="sprint.deadline.label" default="Deadline" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sprintInstance, field: 'deadline', 'errors')}">
                                    <g:datePicker name="deadline" precision="day" value="${sprintInstance?.deadline}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="atividade"><g:message code="sprint.atividade.label" default="Atividade" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sprintInstance, field: 'atividade', 'errors')}">
                                    
<ul>
<g:each in="${sprintInstance?.atividade?}" var="a">
    <li><g:link controller="atividade" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="atividade" action="create" params="['sprint.id': sprintInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'atividade.label', default: 'Atividade')])}</g:link>

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
