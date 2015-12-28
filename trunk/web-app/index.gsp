<html>
    <head>
        <g:if test="${!session.usuario}">
            <title>Vai dar certo !</title>
        </g:if>        
        <meta name="layout" content="main" />
		<style type="text/css">
			input{
				display:block;
				margin:5px;
				margin-bottom:10px;
				border:1px solid #000;
			}
			.body_Conteudo{
				margin-left:160px;
				text-align:left;
				border:1px solid #000;
				padding:10px;
				background-color:#CCC;
			}
		</style>
    </head>
    <body>
		<center>
        <div class="body_Conteudo">
			<center>
            <g:if test="${!session.usuario}">
                
            </g:if>
            <g:else>
                <h1>Logou</h1>
                <p>
                    Siga
                </p>
            </g:else>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <g:if test="${flash.error}">
                <div class="errors">
                    <ul>
                        <li>${flash.error}</li>
                </ul>
                </div>
            </g:if>
            <g:if test="${!session.usuario}">
                <g:form controller="usuario" action="login" method="post">
                    <div>
                        <p>
                            <label for="login">Login</label>
                            <input type="text" id="login" name="login" value="${usuario?.login}" />
                        </p>
                        <p>
                            <label for="password">Senha</label>
                            <input type="password" id="password" name="password" value="" />
                        </p>
                    </div>
                    <input class="login" type="submit" value="Entrar" style="margin-top:20px;cursor:pointer;"/>                   
                </g:form>
            </g:if>            
			</center>
        </div>
		</center>
    </body>
</html>
