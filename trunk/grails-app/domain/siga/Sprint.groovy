package siga

/**
 *  Classe para definicao do Sprint
 **/
class Sprint {

    /** Lista de impedimentos **/
    static hasMany = [atividade : Atividade]
	
    /** Estado atual do Sprint **/
    Estado estado
	
    /** Previsão para encerramento do Sprint **/
    Date deadline
	
    /** Restrições do Sprint **/
    static constraints = {

    }
    String toString(){
        return "${id} - ${deadline}"
    }
}
