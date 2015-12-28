
<%@ page import="siga.Tarefa" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Blog</title>
    </head>
    <body>
		<div class="nav">
			<span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
			<span class="menuButton"><g:link class="create" controller="post" action="create"><g:message code="default.blog.addPost" /></g:link></span>
			<span class="menuButton"><g:link class="create" controller="comentario" action="create"><g:message code="default.blog.addComment" /></g:link></span>
		</div>
		<div style="margin-left:150px;">
			<g:each in="${postList}" status="i" var="post"> 
				<div style="border:1px solid #999;width:500px;margin-left:10px;margin-top:5px">
				 <div id="${ (i % 2) == 0 ? 'left' : 'right'}"> 
						<div style="border:1px solid #999;margin-left:10px;margin-top:10px;margin-right:10px;background-color:#CCC;">
						 <h2>${post.titulo}</h2> 
						<p align="justify">Criado por ${post.usuario} em ${post.publicacao}</p>
						 <p align="justify"> ${post.conteudo}</p> 
						</div>
				 </div> 
				 <br />
				 <g:each in="${post.comentarios}" status="j" var="comentario"> 
					<div style="margin:10px;">
						<b>${comentario.usuario}</b> diz:<br />
						${comentario.comentario}<br />
					</div>
				</g:each> 
				</div>
			</g:each> 
	   </div>
	</body>
</html>