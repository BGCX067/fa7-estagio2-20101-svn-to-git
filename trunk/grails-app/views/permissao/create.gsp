
<%@ page import="siga.Permissao" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'permissao.label', default: 'Permissao')}" />
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
            <g:hasErrors bean="${permissaoInstance}">
            <div class="errors">
                <g:renderErrors bean="${permissaoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="projeto"><g:message code="permissao.projeto.label" default="Projeto" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: permissaoInstance, field: 'projeto', 'errors')}">
                                    <g:select name="projeto.id" from="${siga.Projeto.list()}" optionKey="id" value="${permissaoInstance?.projeto?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="usuario"><g:message code="permissao.usuario.label" default="Usuario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: permissaoInstance, field: 'usuario', 'errors')}">
                                    <g:select name="usuario.id" from="${siga.Usuario.list()}" optionKey="id" value="${permissaoInstance?.usuario?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="perfil"><g:message code="permissao.perfil.label" default="Perfil" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: permissaoInstance, field: 'perfil', 'errors')}">
                                    <g:select name="perfil" from="${siga.Perfil?.values()}" value="${permissaoInstance?.perfil}"  />
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
