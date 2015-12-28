class SecurityFilters {

    def filters = {

        Logado(controller:'*', action:'*') {
            before = {

                // Se o usuário não estiver logado no sistema exibe um mensagem de Erro
                println(params)
                if(!session.usuario && !actionName.equals("login")) {
                    flash['error']="Você não está logado no sistema";
                    redirect(uri:"")
                    return false
                }

            }
        }
         Permissoes(controller:'permissao', action:'*') {
            before = {

                def permissao = siga.Permissao.findByUsuarioAndPerfil(session.usuario, siga.Perfil.GERENTE)
                println(permissao)
                    if(!permissao){
                        flash['error']="Você não tem permissão para acessar esse recurso";
                        redirect(uri:"")
                        return false
                    }
                }

           }
            PostCreate(controller:'post', action:'create') {
            before = {

                def permissao = siga.Permissao.findByUsuarioAndPerfil(session.usuario, siga.Perfil.SCRUM_MASTER)
                println(permissao)
                    if(!permissao){
                        flash['error']="Você não tem permissão para acessar esse recurso";
                        redirect(uri:"")
                        return false
                    }
                }

           }
           PostEdit(controller:'post', action:'edit') {
            before = {

                def permissao = siga.Permissao.findByUsuarioAndPerfil(session.usuario, siga.Perfil.SCRUM_MASTER)
                println(permissao)
                    if(!permissao){
                        flash['error']="Você não tem permissão para acessar esse recurso";
                        redirect(uri:"")
                        return false
                    }
                }

           }
           PostDelete(controller:'post', action:'delete') {
            before = {
                def permissao = siga.Permissao.findByUsuarioAndPerfil(session.usuario, siga.Perfil.SCRUM_MASTER)
                println(permissao)
                    if(!permissao){
                        flash['error']="Você não tem permissão para acessar esse recurso";
                        redirect(uri:"")
                        return false
                    }
                }

           }
           Sprint(controller:'sprint', action:'*') {
            before = {

                def permissao = siga.Permissao.findByUsuarioAndPerfil(session.usuario, siga.Perfil.SCRUM_MASTER)
                println(permissao)
                    if(!permissao){
                        flash['error']="Você não tem permissão para acessar esse recurso";
                        redirect(uri:"")
                        return false
                    }
                }

           }
            Atividade(controller:'atividade', action:'*') {
            before = {

                def permissao = siga.Permissao.findByUsuarioAndPerfil(session.usuario, siga.Perfil.SCRUM_MASTER)
                println(permissao)
                    if(!permissao){
                        flash['error']="Você não tem permissão para acessar esse recurso";
                        redirect(uri:"")
                        return false
                    }
                }

           }
            Comentario(controller:'comentario', action:'*') {
            before = {

                def permissao = siga.Permissao.findByUsuarioAndPerfil(session.usuario, siga.Perfil.TEAM_MEMBER)
                println(permissao)
                    if(!permissao){
                        flash['error']="Você não tem permissão para acessar esse recurso";
                        redirect(uri:"")
                        return false
                    }
                }

           }
           Tarefa(controller:'tarefa', action:'*') {
            before = {

                def permissao = siga.Permissao.findByUsuarioAndPerfil(session.usuario, siga.Perfil.TEAM_MEMBER)
                println(permissao)
                    if(!permissao){
                        flash['error']="Você não tem permissão para acessar esse recurso";
                        redirect(uri:"")
                        return false
                    }
                }

           }
           
           Usuario(controller:'usuario', action:'*') {
            before = {
                def permissao = siga.Permissao.findByUsuarioAndPerfil(session.usuario, siga.Perfil.GERENTE)
                if(!permissao && !(actionName.equals("login") || actionName.equals("logoff")) ) {
                    println(permissao)
                        if(!permissao){
                            flash['error']="Você não tem permissão para acessar esse recurso";
                            redirect(uri:"")
                            return false
                        }
                    }
            }

           }
           
           Projeto(controller:'projeto', action:'*') {
            before = {
                def permissao = siga.Permissao.findByUsuarioAndPerfil(session.usuario, siga.Perfil.GERENTE)
                println(permissao)
                    if(!permissao){
                        flash['error']="Você não tem permissão para acessar esse recurso";
                        redirect(uri:"")
                        return false
                    }
                }

           }
            Impedimento(controller:'impedimento', action:'*') {
            before = {

                def permissao = siga.Permissao.findByUsuarioAndPerfil(session.usuario, siga.Perfil.TEAM_MEMBER)
                println(permissao)
                    if(!permissao){
                        flash['error']="Você não tem permissão para acessar esse recurso";
                        redirect(uri:"")
                        return false
                    }
                }

           }

    }
}
