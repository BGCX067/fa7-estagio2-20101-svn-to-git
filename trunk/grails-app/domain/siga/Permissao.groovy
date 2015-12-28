package siga

class Permissao {

    Usuario usuario
    Projeto projeto
    Perfil perfil

    static belongsTo = [usuario : Usuario , projeto : Projeto]
    String toString() {
        return "${usuario.nome} - ${perfil}"
    }


    def constraints = {
        usuario(nullable:false)
        projeto(nullable:false)
        perfil(nullable:false)
    }
    
}