package siga

class Comentario {

    String comentario

    static belongsTo = [post:Post,usuario:Usuario]
    static constraints = {
    }
	String toString() {
        return "Usuario:"+nome+"   Comentario:"+comentario
    }
}
