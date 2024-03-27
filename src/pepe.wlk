object pepe {

	var categoria = cadete
	var tipoDeBono = porcentaje
	var ausencias = 1
	var bonoPorPresentismo = normal

	method sueldoNeto() {
		return categoria.sueldo()
	}

	method sueldo() {
		return self.sueldoNeto() + self.tipoDeBono() + self.bonoPorPresentismo()
	}
	
	method categoria(_categoria){
		categoria = _categoria
	}

	method ausencias() {
		return ausencias
	}
	
	method ausencias(_ausencias){
		ausencias = _ausencias
	}
	
	method tipoDeBono(_tipoDeBono){
		tipoDeBono = _tipoDeBono
	}
	
	method tipoDeBono(){
		return tipoDeBono.valor(self)
	}
	
	method bonoPorPresentismo(){
		return bonoPorPresentismo.valor(self)
	}
	
	method bonoPorPresentismo(_bonoPorPresentismo){
		bonoPorPresentismo = _bonoPorPresentismo
	}
}

object sofia{
	var categoria = cadete
	var tipoDeBono = porcentaje
	
	method sueldo(){
		return self.sueldoNeto() + self.tipoDeBono()
	}
	
	method sueldoNeto(){
		return categoria.sueldo() * 1.3
	}
	
	method tipoDeBono(){
		return tipoDeBono.valor(self)
	}
	
	method tipoDeBono(_tipoDeBono){
		tipoDeBono = _tipoDeBono
	}
	
	method categoria(_categoria){
		categoria = _categoria
	}
	
}

object roque{
	const sueldoNeto = 28000
	var tipoDeBono = porcentaje
	
	method sueldo(){
		return sueldoNeto + self.tipoDeBono() + 9000
	}
	
	method tipoDeBono(){
		return tipoDeBono.valor(self)
	}
	
	method tipoDeBono(_tipoDeBono){
		tipoDeBono = _tipoDeBono
	}
}

object ernesto{
	var companhero = pepe
	var bonoPorPresentismo = normal
	const ausencias = 0
	
	method ausencias(){
		return ausencias
	}
	
	method companhero(){
		return companhero
	}
	
	method companhero(_companhero){
		companhero = _companhero
	}
	
	method sueldoNeto(){
		return companhero.sueldoNeto()
	}
	
	method sueldo(){
		return self.sueldoNeto() + self.bonoPorPresentismo()
	}
	
	method bonoPorPresentismo(){
		return bonoPorPresentismo.valor(self)
	}
	
	method bonoPorPresentismo(_bonoPorPresentismo){
		bonoPorPresentismo = _bonoPorPresentismo
	}
}

object gerente {

	const sueldo = 15000

	method sueldo() {
		return sueldo
	}

}

object cadete {

	const sueldo = 20000

	method sueldo() {
		return sueldo
	}
}

object vendedor{
	const sueldo = 16000
	var aumentoPorVentas = false
	
	method sueldo(){
		return if (aumentoPorVentas) {sueldo * 1.25} else {sueldo}
	}
	
	method activarAumentoPorVentas(){
		aumentoPorVentas = true
	}
	
	method desactivarAumentoPorVentas(){
		aumentoPorVentas = false
	}
}

object medioTiempo{
	var categoriaBase = cadete

	method sueldo(){
		return categoriaBase.sueldo() / 2
	}
	
	method categoriaBase(_categoriaBase){
		categoriaBase = _categoriaBase
	}
}

object porcentaje {
	const porcentaje = 0.10

	method valor(empleado) {
		return empleado.sueldoNeto() * porcentaje
	}

}

object montoFijo {

	const valor = 800

	method valor(empleado) {
		return valor
	}

}

object resultadoNulo {

	const valor = 0

	method valor(empleado) {
		return valor
	}
}

object presentismoNulo {

	const valor = 0

	method valor(empleado) {
		return valor
	}
}

object normal {

	method valor(empleado) {
		return if (empleado.ausencias() == 0) {
			2000
		} else if (empleado.ausencias() == 1) {
			1000
		} else {
			0
		}
	}

}

object ajuste {
	
	method valor(empleado){
		return if (empleado.ausencias() == 0) {100} else {0}
	}
}


object demagogico {
	
	method valor(empleado){
		return if (empleado.sueldoNeto() < 18000){
			500
		} else {
			300
		}
	}

}
