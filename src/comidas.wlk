import example.*
object vegetariano{
	method permiteComer(comida)= !comida.esCarne()
}
object dietetico{
	method permiteComer(comida) = comida.calorias()<oms.maxCaloriasRecomendadas()
}
object alternado{
	var estado = true 
    method estado() = estado
    method permiteComer(comida){
        estado = not self.estado()
        return estado}
}
class Combinacion{
	const property condiciones=[]
	method permiteComer(comida) = condiciones.all({condicion=>condicion.permiteComer(comida)})
}

class Comida{
	var property descripcion = ""
	var property esCarne = false
	var property calorias
	
	method esPesada() = calorias > 500
}

object oms{
	method maxCaloriasRecomendadas() = 500
}