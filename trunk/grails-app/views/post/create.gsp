
<%@ page import="siga.Post" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
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
            <g:hasErrors bean="${postInstance}">
            <div class="errors">
                <g:renderErrors bean="${postInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="titulo"><g:message code="post.titulo.label" default="Titulo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: postInstance, field: 'titulo', 'errors')}">
                                    <g:select name="titulo" from="${postInstance.constraints.titulo.inList}" value="${postInstance?.titulo}" valueMessagePrefix="post.titulo"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="usuario"><g:message code="post.usuario.label" default="Usuario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: postInstance, field: 'usuario', 'errors')}">
                                    <g:select name="usuario.id" from="${siga.Usuario.list()}" optionKey="id" value="${postInstance?.usuario?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="conteudo"><g:message code="post.conteudo.label" default="Conteudo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: postInstance, field: 'conteudo', 'errors')}">
                                    <g:textField name="conteudo" value="${postInstance?.conteudo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="publicacao"><g:message code="post.publicacao.label" default="Publicacao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: postInstance, field: 'publicacao', 'errors')}">
                                    <g:datePicker name="publicacao" precision="day" value="${postInstance?.publicacao}"  />
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
