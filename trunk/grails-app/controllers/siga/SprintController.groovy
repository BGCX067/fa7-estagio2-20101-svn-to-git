package siga

class SprintController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [sprintInstanceList: Sprint.list(params), sprintInstanceTotal: Sprint.count()]
    }

    def create = {
        def sprintInstance = new Sprint()
        sprintInstance.properties = params
        return [sprintInstance: sprintInstance]
    }

    def save = {
        def sprintInstance = new Sprint(params)
        if (sprintInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'sprint.label', default: 'Sprint'), sprintInstance.id])}"
            redirect(action: "show", id: sprintInstance.id)
        }
        else {
            render(view: "create", model: [sprintInstance: sprintInstance])
        }
    }

    def show = {
        def sprintInstance = Sprint.get(params.id)
        if (!sprintInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sprint.label', default: 'Sprint'), params.id])}"
            redirect(action: "list")
        }
        else {
            [sprintInstance: sprintInstance]
        }
    }

    def edit = {
        def sprintInstance = Sprint.get(params.id)
        if (!sprintInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sprint.label', default: 'Sprint'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [sprintInstance: sprintInstance]
        }
    }

    def update = {
        def sprintInstance = Sprint.get(params.id)
        if (sprintInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (sprintInstance.version > version) {
                    
                    sprintInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'sprint.label', default: 'Sprint')] as Object[], "Another user has updated this Sprint while you were editing")
                    render(view: "edit", model: [sprintInstance: sprintInstance])
                    return
                }
            }
            sprintInstance.properties = params
            if (!sprintInstance.hasErrors() && sprintInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'sprint.label', default: 'Sprint'), sprintInstance.id])}"
                redirect(action: "show", id: sprintInstance.id)
            }
            else {
                render(view: "edit", model: [sprintInstance: sprintInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sprint.label', default: 'Sprint'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def sprintInstance = Sprint.get(params.id)
        if (sprintInstance) {
            try {
                sprintInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'sprint.label', default: 'Sprint'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'sprint.label', default: 'Sprint'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sprint.label', default: 'Sprint'), params.id])}"
            redirect(action: "list")
        }
    }
}
