package siga

class Post {
	String titulo
	String conteudo
	Date publicacao = new Date()
	static hasMany = [comentarios:Comentario]
	static belongsTo= [usuario:Usuario]
    static constraints = {
		titulo(inList:["Planejamento","Revisao","Diaria"])
    }
}
