<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
		<style type="text/css">
			#grailsLogo{
				background-color:#0E0E0E;
				width:100%;
			}
			#nav{
				float:left;
				background-color:#F6F6F6;
				margin-top:5px;
				border:1px solid #CDCCCC;
				padding-right:20px;
			}
			#nav ul{
				text-decoration:none;
				 list-style-type: none;
			}
			#nav ul li{
				margin:5px 0px;
			}
			#nav ul li a:hover{
				color:#00AAFF;
			}

			.sair:hover{
				text-decoration:underline;
			}
		</style>
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="Spinner" />
        </div>
        <div id="grailsLogo" class="logo"><a href="http://code.google.com/p/fa7-estagio2-20101/source/checkout"><img src="${resource(dir:'images',file:'siga_logo.png')}" alt="Grails" border="0" /></a></div>
		<div style="text-align:right;margin-right:15px;">
			<g:if test="${session.usuario}">
				Bem vindo, <b><em>${session.usuario.nome}</em></b>   <g:link controller="usuario" action="logoff" class="sair" style="color:red;margin-left:10px;">Sair</g:link>
			</g:if>	
		</div>
		  <g:if test="${session.usuario}">
                    <div id="nav">
                 
			<ul>
                             <g:each var="c" in="${grailsApplication.controllerClasses}">
                                  <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.logicalPropertyName.toUpperCase()}</g:link></li>
                             </g:each>
                        </ul>
                   </div>
                  </g:if>
        <g:layoutBody />
    </body>
</html>