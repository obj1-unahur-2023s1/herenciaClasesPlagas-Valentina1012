import plagas.*

class Barrio{
	const elementos=[]
	
	method agregarElemento(elemento){
		elementos.add(elemento)
	}
	method quitarElemento(elemento){
		elementos.remove(elemento)
	}
	method esCopado(){
		const elemBuenos=elementos.count({elemento=>elemento.esBueno()})
		const elemMalos=elementos.count({elemento=>!elemento.esBueno()})
		return elemBuenos>elemMalos
	}
	method recibirAtaque(plaga){
		elementos.forEach({elem=>elem.sufrirAtaque(plaga)})
	}
}

class Hogar{
	var property nivelDeMugre=0
	var property confort=0
	
	method esBueno(){
		return confort/2>=nivelDeMugre
	}
	
	method sufrirAtaque(plaga){
		nivelDeMugre+=plaga.nivelDeDanio()
	}
}

class Huerta{
	var property capacidadDeProduccion=0
	var property referenciaProduccion=0
	
	method esBueno(){
		return capacidadDeProduccion>referenciaProduccion
	}
	
	method sufrirAtaque(plaga){
		capacidadDeProduccion= (capacidadDeProduccion - plaga.nivelDeDanio()*0.1).max(0)
		if (plaga.transmitirEnfermedad()){
			capacidadDeProduccion-=10
		}
	}
}


class Mascota{
	var property nivelDeSalud=0
	
	method esBueno(){
		return nivelDeSalud>250
	}
	
	method sufrirAtaque(plaga){
		if(plaga.transmitirEnfermedad()){
			nivelDeSalud= (nivelDeSalud - plaga.nivelDeDanio()).max(0)
		}
	}
}
