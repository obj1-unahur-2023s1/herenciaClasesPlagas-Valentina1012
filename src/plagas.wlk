import barrios.*

class Plaga{
	var property poblacion 
	
	method transmitirEnfermedad(){
		return poblacion>=10 && self.condicionAdicional()
		
	}
	method condicionAdicional()=true
	method recibirEfecto(){
		poblacion+=poblacion*0.1 
	}
	method atacarElemento(unElem){
		self.recibirEfecto()
		unElem.sufrirAtaque(self)
	}
}

class Cucaracha inherits Plaga{
	var property pesoPromedio
	
	method nivelDeDanio(){
		return poblacion/2
	}
	
	override method condicionAdicional(){
		return pesoPromedio >=10 
	}
	override method recibirEfecto(){
		poblacion+=poblacion*0.1 
		pesoPromedio+=2
	}
}

class Pulga inherits Plaga{
	method nivelDeDanio(){
		return poblacion*2
	}

}

class Garrapata inherits Plaga{
	method nivelDeDanio(){
		return poblacion*2
	}
	override method recibirEfecto(){
		poblacion+=poblacion*0.2
	}
}

class Mosquito inherits Plaga{
	method nivelDeDanio(){
		return poblacion
	}
	
	override method condicionAdicional(){
		return poblacion % 3 == 0 
	}
}