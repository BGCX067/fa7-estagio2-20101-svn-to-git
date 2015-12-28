
<%@ page import="siga.Projeto" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'projeto.label', default: 'Projeto')}" />
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
                            <td valign="top" class="name"><g:message code="projeto.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: projetoInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="projeto.nome.label" default="Nome" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: projetoInstance, field: "nome")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="projeto.descricao.label" default="Descricao" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: projetoInstance, field: "descricao")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="projeto.previsaoDeDuracao.label" default="Previsao De Duracao" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: projetoInstance, field: "previsaoDeDuracao")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="projeto.valorOrcado.label" default="Valor Orcado" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: projetoInstance, field: "valorOrcado")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="projeto.tamanhoDaSprint.label" default="Tamanho Da Sprint" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: projetoInstance, field: "tamanhoDaSprint")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="projeto.prazoDeEntrega.label" default="Prazo De Entrega" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${projetoInstance?.prazoDeEntrega}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="projeto.permissao.label" default="Permissao" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${projetoInstance.permissao}" var="p">
                                    <li><g:link controller="permissao" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="projeto.atividade.label" default="Atividade" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${projetoInstance.atividade}" var="a">
                                    <li><g:link controller="atividade" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${projetoInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
