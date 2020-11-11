import example.*
// Punto 2
class Criterio{
	method pasarElemento(emisor,elementoPedido,receptor){
		self.enviar(emisor,self.elementoAEnviar(emisor, elementoPedido), receptor)
	}
	method enviar(emisor,elemento, receptor){
		receptor.recibirElemento(elemento)
		emisor.entregarElemento(elemento)
	}
	method elementoAEnviar(emisor, elementoPedido) = elementoPedido
	
}
object sordo inherits Criterio{
	override method elementoAEnviar(emisor, elementoPedido) = emisor.elementosCercanos().first()
}
object todosLosElementos inherits Criterio {
	override method elementoAEnviar(emisor, elementoPedido) = emisor.elementosCercanos()
		override method enviar(emisor, elementos, receptor){
			receptor.recibirVariosElementos(elementos)
			emisor.entregarVariosElementos(elementos)
		}	
}
object cambiarPosicion inherits Criterio{
	
	override method pasarElemento(emisor,elementoPedido,receptor){
		emisor.intercambiarPosicion(receptor)
	}
}

object benditoElemento inherits Criterio{}
