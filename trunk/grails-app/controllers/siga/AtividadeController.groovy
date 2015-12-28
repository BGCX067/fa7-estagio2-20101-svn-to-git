package siga

class AtividadeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [atividadeInstanceList: Atividade.list(params), atividadeInstanceTotal: Atividade.count()]
    }

    def create = {
        def atividadeInstance = new Atividade()
        atividadeInstance.properties = params
        return [atividadeInstance: atividadeInstance]
    }

    def save = {
        def atividadeInstance = new Atividade(params)
        if (atividadeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'atividade.label', default: 'Atividade'), atividadeInstance.id])}"
            redirect(action: "show", id: atividadeInstance.id)
        }
        else {
            render(view: "create", model: [atividadeInstance: atividadeInstance])
        }
    }

    def show = {
        def atividadeInstance = Atividade.get(params.id)
        if (!atividadeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'atividade.label', default: 'Atividade'), params.id])}"
            redirect(action: "list")
        }
        else {
            [atividadeInstance: atividadeInstance]
        }
    }

    def edit = {
        def atividadeInstance = Atividade.get(params.id)
        if (!atividadeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'atividade.label', default: 'Atividade'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [atividadeInstance: atividadeInstance]
        }
    }

    def update = {
        def atividadeInstance = Atividade.get(params.id)
        if (atividadeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (atividadeInstance.version > version) {
                    
                    atividadeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'atividade.label', default: 'Atividade')] as Object[], "Another user has updated this Atividade while you were editing")
                    render(view: "edit", model: [atividadeInstance: atividadeInstance])
                    return
                }
            }
            atividadeInstance.properties = params
            if (!atividadeInstance.hasErrors() && atividadeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'atividade.label', default: 'Atividade'), atividadeInstance.id])}"
                redirect(action: "show", id: atividadeInstance.id)
            }
            else {
                render(view: "edit", model: [atividadeInstance: atividadeInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'atividade.label', default: 'Atividade'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def atividadeInstance = Atividade.get(params.id)
        if (atividadeInstance) {
            try {
                atividadeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'atividade.label', default: 'Atividade'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'atividade.label', default: 'Atividade'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'atividade.label', default: 'Atividade'), params.id])}"
            redirect(action: "list")
        }
    }
}
