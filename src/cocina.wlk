import comidas.*
import comensales.*

object cocina {
	
	var property comidas=[]
	
	method comidasVegetarianas() = comidas.filter {x => x.aptoVegetariano() }
	
	method comidasNoVegetarianas() = comidas.filter {x => !x.aptoVegetariano() }
	
	method platosVegetarianos() = (self.comidasVegetarianas().size() - self.comidasNoVegetarianas().size()).abs() <= 2
	
	method platoFuerteCarnivoro() = self.comidasNoVegetarianas().max { x => x.valoracion() }
	
	method leGustan(comensal) = comidas.filter { c => comensal.leGusta(c) }
	
	method seleccionarPlato(comensal) {
		if (self.leGustan(comensal).isEmpty()) 
			self.error("Ninguna comida le gusta")
		const comidaAzar = self.leGustan(comensal).anyOne()
		comensal.comer(comidaAzar)
		comidas.remove(comidaAzar)
	}
}