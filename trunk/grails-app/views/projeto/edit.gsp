
<%@ page import="siga.Projeto" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'projeto.label', default: 'Projeto')}" />
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
            <g:hasErrors bean="${projetoInstance}">
            <div class="errors">
                <g:renderErrors bean="${projetoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${projetoInstance?.id}" />
                <g:hiddenField name="version" value="${projetoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nome"><g:message code="projeto.nome.label" default="Nome" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: projetoInstance, field: 'nome', 'errors')}">
                                    <g:textField name="nome" maxlength="20" value="${projetoInstance?.nome}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="descricao"><g:message code="projeto.descricao.label" default="Descricao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: projetoInstance, field: 'descricao', 'errors')}">
                                    <g:textArea name="descricao" cols="40" rows="5" value="${projetoInstance?.descricao}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="previsaoDeDuracao"><g:message code="projeto.previsaoDeDuracao.label" default="Previsao De Duracao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: projetoInstance, field: 'previsaoDeDuracao', 'errors')}">
                                    <g:textField name="previsaoDeDuracao" value="${fieldValue(bean: projetoInstance, field: 'previsaoDeDuracao')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="valorOrcado"><g:message code="projeto.valorOrcado.label" default="Valor Orcado" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: projetoInstance, field: 'valorOrcado', 'errors')}">
                                    <g:textField name="valorOrcado" value="${fieldValue(bean: projetoInstance, field: 'valorOrcado')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tamanhoDaSprint"><g:message code="projeto.tamanhoDaSprint.label" default="Tamanho Da Sprint" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: projetoInstance, field: 'tamanhoDaSprint', 'errors')}">
                                    <g:textField name="tamanhoDaSprint" value="${fieldValue(bean: projetoInstance, field: 'tamanhoDaSprint')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="prazoDeEntrega"><g:message code="projeto.prazoDeEntrega.label" default="Prazo De Entrega" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: projetoInstance, field: 'prazoDeEntrega', 'errors')}">
                                    <g:datePicker name="prazoDeEntrega" precision="day" value="${projetoInstance?.prazoDeEntrega}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="permissao"><g:message code="projeto.permissao.label" default="Permissao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: projetoInstance, field: 'permissao', 'errors')}">
                                    
<ul>
<g:each in="${projetoInstance?.permissao?}" var="p">
    <li><g:link controller="permissao" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="permissao" action="create" params="['projeto.id': projetoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'permissao.label', default: 'Permissao')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="atividade"><g:message code="projeto.atividade.label" default="Atividade" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: projetoInstance, field: 'atividade', 'errors')}">
                                    
<ul>
<g:each in="${projetoInstance?.atividade?}" var="a">
    <li><g:link controller="atividade" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="atividade" action="create" params="['projeto.id': projetoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'atividade.label', default: 'Atividade')])}</g:link>

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
