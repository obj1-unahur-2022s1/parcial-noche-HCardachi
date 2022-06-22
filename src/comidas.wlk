class Plato {
	var property peso = 0
	var property valoracion = 0
	
	method aptoVegetariano()
	method esAbundante() = peso > 250
}

//PROVOLETA
class Provoleta inherits Plato {
	const pesoP
	const especias = true
	
	override method peso() = pesoP
		
	override method aptoVegetariano() = !especias
	
	override method valoracion() = if (self.esEspecial()) 120 else 80
	
	method esEspecial() = (self.esAbundante() || especias )
}

//HAMBURGUESA DE CARNE
class HamburguesaC inherits Plato {
	const pan
	
	override method peso() = 250
	
	override method aptoVegetariano() = false
		
	override method valoracion() = (60 + pan.valoracion())
	
}

//HAMBURGUESA VEGETARIANA
class HamburguesaV inherits HamburguesaC {
	const property hechaDe
	
	override method aptoVegetariano() = true
		
	override method valoracion() = super() + 17.min(self.hechaDe().size() * 2)
	
}

//PARRILLADA
class Parrillada inherits Plato {
	var property cortes = []
	
	override method peso() = cortes.sum { c => c.pesoCorte() }
	
	override method aptoVegetariano() = false
	
	method mejorCorte() = cortes.max { c => c.calidad() }
	
	override method valoracion() {
		return 0.max(15 * self.mejorCorte().calidad() - cortes.size())
	}
	
	
}

//CORTES DE CARNE
class CortesC {
	const nombre
	const property calidad
	var property pesoCorte
}


//PANES
object panIndust {
	const property valoracion = 0
}

object panCasero {
	const property valoracion = 20
}

object panMMadre {
	const property valoracion = 45
}
