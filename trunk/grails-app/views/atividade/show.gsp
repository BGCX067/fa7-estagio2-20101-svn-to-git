
<%@ page import="siga.Atividade" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'atividade.label', default: 'Atividade')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="atividade.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: atividadeInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="atividade.descricao.label" default="Descricao" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: atividadeInstance, field: "descricao")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="atividade.prioridade.label" default="Prioridade" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: atividadeInstance, field: "prioridade")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="atividade.defineObjeto.label" default="Define Objeto" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${atividadeInstance?.defineObjeto}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="atividade.projeto.label" default="Projeto" /></td>
                            
                            <td valign="top" class="value"><g:link controller="projeto" action="show" id="${atividadeInstance?.projeto?.id}">${atividadeInstance?.projeto?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="atividade.estimativa.label" default="Estimativa" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: atividadeInstance, field: "estimativa")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="atividade.sprint.label" default="Sprint" /></td>
                            
                            <td valign="top" class="value"><g:link controller="sprint" action="show" id="${atividadeInstance?.sprint?.id}">${atividadeInstance?.sprint?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="atividade.tarefas.label" default="Tarefas" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${atividadeInstance.tarefas}" var="t">
                                    <li><g:link controller="tarefa" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${atividadeInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
