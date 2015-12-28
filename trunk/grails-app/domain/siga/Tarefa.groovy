package siga

/**
 *  Classe para definicao da Tarefa
 **/

 class Tarefa {
 
    /** Relação de pertinência **/
    static belongsTo = [atividade : Atividade, usuario : Usuario]
    static hasMany = [impedimento : Impedimento]
   
	
    /** Descrição da tarefa **/
    String descricao
	
   /** Estimativa de duração da tarefa (horas) **/
    int estimativa

   /** Formatação da apresentação (Atividade e Descrição) **/
    String toString() {
        return descricao+" : "+atividade
    }
	
    /** Restrições da Tarefa **/
    static constraints = {

    }

}

