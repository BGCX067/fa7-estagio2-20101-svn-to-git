package siga

class Projeto {

        String nome
        int tamanhoDaSprint
        int previsaoDeDuracao
        Date prazoDeEntrega
        String descricao 
        double valorOrcado
      

        static hasMany = [permissao : Permissao, atividade : Atividade]
    	
        static constraints = {
            	nome(nullable:false,blank:false,maxSize:20,unique:true)
            	descricao(nullable:false,blank:false,maxSize:255)
        }
        String toString(){
            return nome
        }
}
