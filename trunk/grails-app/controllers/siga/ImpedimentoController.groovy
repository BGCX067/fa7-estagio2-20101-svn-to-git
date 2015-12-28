package siga

class ImpedimentoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [impedimentoInstanceList: Impedimento.list(params), impedimentoInstanceTotal: Impedimento.count()]
    }

    def create = {
        def impedimentoInstance = new Impedimento()
        impedimentoInstance.properties = params
        return [impedimentoInstance: impedimentoInstance]
    }

    def save = {
        def impedimentoInstance = new Impedimento(params)
        if (impedimentoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'impedimento.label', default: 'Impedimento'), impedimentoInstance.id])}"
            redirect(action: "show", id: impedimentoInstance.id)
        }
        else {
            render(view: "create", model: [impedimentoInstance: impedimentoInstance])
        }
    }

    def show = {
        def impedimentoInstance = Impedimento.get(params.id)
        if (!impedimentoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'impedimento.label', default: 'Impedimento'), params.id])}"
            redirect(action: "list")
        }
        else {
            [impedimentoInstance: impedimentoInstance]
        }
    }

    def edit = {
        def impedimentoInstance = Impedimento.get(params.id)
        if (!impedimentoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'impedimento.label', default: 'Impedimento'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [impedimentoInstance: impedimentoInstance]
        }
    }

    def update = {
        def impedimentoInstance = Impedimento.get(params.id)
        if (impedimentoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (impedimentoInstance.version > version) {
                    
                    impedimentoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'impedimento.label', default: 'Impedimento')] as Object[], "Another user has updated this Impedimento while you were editing")
                    render(view: "edit", model: [impedimentoInstance: impedimentoInstance])
                    return
                }
            }
            impedimentoInstance.properties = params
            if (!impedimentoInstance.hasErrors() && impedimentoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'impedimento.label', default: 'Impedimento'), impedimentoInstance.id])}"
                redirect(action: "show", id: impedimentoInstance.id)
            }
            else {
                render(view: "edit", model: [impedimentoInstance: impedimentoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'impedimento.label', default: 'Impedimento'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def impedimentoInstance = Impedimento.get(params.id)
        if (impedimentoInstance) {
            try {
                impedimentoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'impedimento.label', default: 'Impedimento'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'impedimento.label', default: 'Impedimento'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'impedimento.label', default: 'Impedimento'), params.id])}"
            redirect(action: "list")
        }
    }
}
