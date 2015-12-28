package siga

class UsuarioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
		String textoPesquisa = params.pesquisa
		if(!textoPesquisa){
			[usuarioInstanceList: Usuario.list(params), usuarioInstanceTotal: Usuario.count()]
		}else{
			[usuarioInstanceList: Usuario.findAllByNomeIlike("%"+params.pesquisa+"%"), usuarioInstanceTotal: Usuario.count()]
		}
    }

    def create = {
        def usuarioInstance = new Usuario()
        usuarioInstance.properties = params
        return [usuarioInstance: usuarioInstance]
    }

    def save = {
        def usuarioInstance = new Usuario(params)
        if (usuarioInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.login])}"
            redirect(action: "show", id: usuarioInstance.id)
        }
        else {
            render(view: "create", model: [usuarioInstance: usuarioInstance])
        }
    }

    def show = {
        def usuarioInstance = Usuario.get(params.id)
        if (!usuarioInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
            redirect(action: "list")
        }
        else {
            [usuarioInstance: usuarioInstance]
        }
    }

    def edit = {
        def usuarioInstance = Usuario.get(params.id)
        if (!usuarioInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [usuarioInstance: usuarioInstance]
        }
    }

    def update = {
        def usuarioInstance = Usuario.get(params.id)
        if (usuarioInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (usuarioInstance.version > version) {
                    
                    usuarioInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'usuario.label', default: 'Usuario')] as Object[], "Another user has updated this Usuario while you were editing")
                    render(view: "edit", model: [usuarioInstance: usuarioInstance])
                    return
                }
            }
            usuarioInstance.properties = params
            if (!usuarioInstance.hasErrors() && usuarioInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.login])}"
                redirect(action: "show", id: usuarioInstance.id)
            }
            else {
                render(view: "edit", model: [usuarioInstance: usuarioInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def usuarioInstance = Usuario.get(params.id)
        if (usuarioInstance) {
            try {
                usuarioInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.login])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
            redirect(action: "list")
        }
    }
    def login = {
            print(params)
            def usuario = Usuario.findByLoginAndSenha(params.login,params.password)
            if(usuario){
		flash.message = "Login efetuado com sucesso"
                session.usuario = usuario
                if (Permissao.findByUsuarioAndPerfil(session.usuario, siga.Perfil.GERENTE)){
                    println("logou como GERENTE")
                    redirect(uri:"/permissao/list")
                }
                else if (Permissao.findByUsuarioAndPerfil(session.usuario, siga.Perfil.SCRUM_MASTER)){
                     println("logou como SM")
                    redirect(uri:"/atividade/list")
                }
                else{
                     println("logou como TM")
                    redirect(uri:"/tarefa/list")
                }
                
            }
            else{
                flash.message = "Login incorreto";
                redirect(uri:'')
            }
    }
	def logoff = {
           session.usuario = null
           flash.message = "Voce deslogou do sistema"
           redirect(uri:"/index.gsp")
    }

	def pesquisar = {
		redirect(action: "list", params: params)
	}
}
