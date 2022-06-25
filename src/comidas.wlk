/* 
La mejor opción para manejar el peso en las comidas era la siguiente
. método abstracto peso en Plato
. const property peso en Provoleta
. en esAbundante() usar self.peso()
*/

/* valoración() debía ser un método abstracto, (no era un atributo) */

class Plato {
	method peso()
	method valoracion()
	method aptoVegetariano()
	method esAbundante() = self.peso() > 250
}

//PROVOLETA
class Provoleta inherits Plato {
	var property peso
	const especias = true
	
	
		
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
