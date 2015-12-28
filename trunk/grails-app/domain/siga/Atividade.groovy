package siga

/**
 *  Classe para definicao do Atividades
 **/
 
class Atividade {
    
    /** Composição de tarefas **/
	static hasMany = [tarefas : Tarefa]
        static belongsTo = [projeto : Projeto, sprint : Sprint]

    /** Objeto da atividade **/
	boolean defineObjeto

    /** Estimativa de complexidade (User Points) **/
    int estimativa
	
    /** Responsável pela atividade (e tarefas inclusas) **/
	
    /** Prioridade da atividade **/
    int prioridade
	
    /** Descrição da atividade **/
    String descricao
	
	/** Relação de pertin�ncia **/
	
    /** Método para apresentação da atividade (campo descrição) **/
    String toString() {
        return descricao
    }
	
    /** Restrições da atividade **/
	static constraints = {
        descricao(nullable:false)
        prioridade(range:0..9)
    }
}
