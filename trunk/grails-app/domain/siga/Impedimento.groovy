package siga

/**
 *  Colasse para definicao de Impedimento
 **/
class Impedimento {

    /** Pertinência em relação ao Sprint **/
    static belongsTo = [tarefa : Tarefa , usuario : Usuario]
    
    /** Descrição do impedimento **/
    String descricao
	

    /** Restrições da atividade **/
    static constraints = {
    }
}
