package siga

/**
 *  Classe para definicao de um Usuario
 **/
class Usuario {

	String nome
	String email
	String login
	String senha
	

	static hasMany = [tarefas : Tarefa, permissao : Permissao, impedimento : Impedimento]

    /** Descricao do Usuario (nome) **/
    String toString() {
        return nome
    }

    /** Restricaes do Usuario **/
    static constraints = {
		nome(size:3..100,blank:false)
		email(email:true,size:3..150,blank:true)
		login(unique:true,size:3..50,blank:false)
		senha(password:true,size:6..100,blank:false)
    }

}