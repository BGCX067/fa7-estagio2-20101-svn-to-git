package siga

class PermissaoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [permissaoInstanceList: Permissao.list(params), permissaoInstanceTotal: Permissao.count()]
    }

    def create = {
        def permissaoInstance = new Permissao()
        permissaoInstance.properties = params
        return [permissaoInstance: permissaoInstance]
    }

    def save = {
        def permissaoInstance = new Permissao(params)
        if (permissaoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'permissao.label', default: 'Permissao'), permissaoInstance.id])}"
            redirect(action: "show", id: permissaoInstance.id)
        }
        else {
            render(view: "create", model: [permissaoInstance: permissaoInstance])
        }
    }

    def show = {
        def permissaoInstance = Permissao.get(params.id)
        if (!permissaoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'permissao.label', default: 'Permissao'), params.id])}"
            redirect(action: "list")
        }
        else {
            [permissaoInstance: permissaoInstance]
        }
    }

    def edit = {
        def permissaoInstance = Permissao.get(params.id)
        if (!permissaoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'permissao.label', default: 'Permissao'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [permissaoInstance: permissaoInstance]
        }
    }

    def update = {
        def permissaoInstance = Permissao.get(params.id)
        if (permissaoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (permissaoInstance.version > version) {
                    
                    permissaoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'permissao.label', default: 'Permissao')] as Object[], "Another user has updated this Permissao while you were editing")
                    render(view: "edit", model: [permissaoInstance: permissaoInstance])
                    return
                }
            }
            permissaoInstance.properties = params
            if (!permissaoInstance.hasErrors() && permissaoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'permissao.label', default: 'Permissao'), permissaoInstance.id])}"
                redirect(action: "show", id: permissaoInstance.id)
            }
            else {
                render(view: "edit", model: [permissaoInstance: permissaoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'permissao.label', default: 'Permissao'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def permissaoInstance = Permissao.get(params.id)
        if (permissaoInstance) {
            try {
                permissaoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'permissao.label', default: 'Permissao'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'permissao.label', default: 'Permissao'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'permissao.label', default: 'Permissao'), params.id])}"
            redirect(action: "list")
        }
    }
}
