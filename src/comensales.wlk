/* 
 * Quizás en esta estaSatisfecho() de comenzal convenia delegar en un método auxiliar el cálculo del peso de lo que comió
*/
import comidas.*

//COMENSAL
class Comensal {
	var property peso
	var property comio = []
	
	method leGusta (comida)
	
	method comioPesoTotal () = comio.sum { x => x.peso() }
	
	method satisfecho() = self.comioPesoTotal() >= self.peso() * 0.01
	
	method comer(comida) { comio.add(comida) }
}

//COMENSAL VEGETARIANO
class Vegetariano inherits Comensal {
	
	override method leGusta (comida) = comida.aptoVegetariano() && comida.valoracion() > 85
	
	override method satisfecho() = super() && comio.all {c => !c.esAbundante()}
	
}

//COMENSAL HAMBRE POPU
class HambrePopular inherits Comensal {
	
	override method leGusta (comida) = comida.esAbundante()
}

//COMENSAL PALADAR FINO
class PaladarFino inherits Comensal {
	
	override method leGusta (comida) = comida.peso().between(150,300) && comida.valoracion() > 100

	override method satisfecho() = super() && comio.size().even()
}