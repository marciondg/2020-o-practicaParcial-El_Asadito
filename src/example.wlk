import criterios.*
import comidas.*
class Persona {
	var property posicion
	const property elementosCercanos = []
	var property criterio
	const property comidas = []
	var property criterioComida
	
	method pedirAOtro(elementoPedido, otraPersona){
		otraPersona.responderPedido(elementoPedido,self)
	}
	
	method responderPedido(elementoPedido,receptor){
		if(!self.tieneElemento(elementoPedido))
			self.error("No tiene el elemento. No se puede realizar la operación")
		else
			criterio.pasarElemento(self, elementoPedido,receptor)
	}
	
	method tieneElemento(elemento) = elementosCercanos.contains(elemento)

	method recibirElemento(elemento){
		elementosCercanos.add(elemento)	
	}
	method recibirVariosElementos(elementos){
		elementosCercanos.addAll(elementos)
	}
	method entregarElemento(elemento){
		elementosCercanos.remove(elemento)
	}
	method entregarTodosElementos(elementos){
		elementosCercanos.clear()
	}
	method intercambiarPosicion(otraPersona){
		const posicionAux = self.posicion()
		self.posicion(otraPersona.posicion())
		otraPersona.posicion(posicionAux)
	}
	method puedeComer(comida){
		if(criterioComida.permiteComer(comida))
			self.comer(comida)
		else
			self.error("No puede comer esa comida")
	}
	method comer(comida){
		comidas.add(comida)
	}
	method estaPipon(){
		comidas.any({comida=>comida.esPesada()})
	}
	method laEstaPasandoBien()= self.comioAlgo() and self.cumpleCondiciones()
	
	method comioAlgo() = !comidas.isEmpty()
	method cumpleCondiciones()
}

object osky inherits Persona{
	override method cumpleCondiciones() = true
}
object moni inherits Persona{
	override method cumpleCondiciones() = posicion == 1
}
object facu inherits Persona{
	override method cumpleCondiciones() = comidas.any({comida=>comida.esCarne()})
}
object vero inherits Persona{
	override method cumpleCondiciones() = elementosCercanos.size()<=3
}

