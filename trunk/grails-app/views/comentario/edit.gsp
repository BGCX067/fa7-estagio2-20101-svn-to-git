
<%@ page import="siga.Comentario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'comentario.label', default: 'Comentario')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${comentarioInstance}">
            <div class="errors">
                <g:renderErrors bean="${comentarioInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${comentarioInstance?.id}" />
                <g:hiddenField name="version" value="${comentarioInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="post"><g:message code="comentario.post.label" default="Post" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comentarioInstance, field: 'post', 'errors')}">
                                    <g:select name="post.id" from="${siga.Post.list()}" optionKey="id" value="${comentarioInstance?.post?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="usuario"><g:message code="comentario.usuario.label" default="Usuario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comentarioInstance, field: 'usuario', 'errors')}">
                                    <g:select name="usuario.id" from="${siga.Usuario.list()}" optionKey="id" value="${comentarioInstance?.usuario?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="comentario"><g:message code="comentario.comentario.label" default="Comentario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comentarioInstance, field: 'comentario', 'errors')}">
                                    <g:textField name="comentario" value="${comentarioInstance?.comentario}" />
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
