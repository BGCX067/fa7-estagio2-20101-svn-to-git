class BootStrap {

     def init = { servletContext ->


        //cadastra alguns usuarios padrao
          new siga.Usuario(nome:'gerente',email:'gerente@fa7.edu.br',login:'gerente',senha:'gerente').save()
          new siga.Usuario(nome:'scrumMaster',email:'sm@fa7.edu.br',login:'scrumMaster',senha:'scrumMaster').save()
          new siga.Usuario(nome:'productowner',email:'productowner@fa7.edu.br',login:'productowner',senha:'productowner').save()
          new siga.Usuario(nome:'teamMember',email:'teamMember@fa7.edu.br',login:'teamMember',senha:'teamMember').save()

        //um projeto pelo menos
         def data = new Date()
         new siga.Projeto(nome:'projeto SIGA',descricao:'SIGA = Sistema Iterativo em Gerencia Autonoma',previsaoDeDuracao:4 ,valorOrcado: 10.00 ,tamanhoDaSprint: 30 ,prazoDeEntrega: data).save()


         //permissoes para os usuarios default
         def projeto = siga.Projeto.findByNome("projeto SIGA")
         def gerente = siga.Usuario.findByLoginAndSenha("gerente", "gerente")
         def scrumMaster = siga.Usuario.findByLoginAndSenha("scrumMaster","scrumMaster")
         def productOwner = siga.Usuario.findByLoginAndSenha("productowner", "productowner")
         def teamMember = siga.Usuario.findByLoginAndSenha("teamMember", "teamMember")

         //remoção das permissões anteriores
          def permissoes = siga.Permissao.findAll()
            for(int i = 0 ; i < permissoes.size - 1; i++){
                if ((permissoes.get(i).usuario == gerente) || (permissoes.get(i).usuario == teamMember) ||
                    (permissoes.get(i).usuario == productOwner) || (permissoes.get(i).usuario == scrumMaster)){

                    permissoes.get(i).delete()
            }
         }
         //novas permissoes
         new siga.Permissao(projeto: projeto, usuario: teamMember, perfil: siga.Perfil.TEAM_MEMBER).save()
         new siga.Permissao(projeto: projeto, usuario: gerente, perfil: siga.Perfil.GERENTE).save()
         new siga.Permissao(projeto: projeto, usuario: productOwner, perfil: siga.Perfil.PRODUCT_OWNER).save()
         new siga.Permissao(projeto: projeto, usuario: scrumMaster, perfil: siga.Perfil.SCRUM_MASTER).save()
     }
     def destroy = {
     }
} 
