import clientes.*
import empresa.*

class ProfesionalVinculado {
  var property ahorros = 0
  const property universidad
  
  method provinciasLaborales() = [universidad.provincia()]
  
  method honorariosPorHs() = universidad.honorarios()
  
  method cobrar(unMonto) {
    universidad.donar(unMonto / 2)
  }
  
  method recibirDinero(unMonto) {
    ahorros += unMonto
  }
}

class ProfesionalAsociadoLit {
  var property ahorros = 0
  const property universidad
  
  method provinciasLaborales() = ["Entre Rios", "Santa Fe", "Corrientes"]
  
  method honorariosPorHs() = 3000
  
  method cobrar(unMonto) {
    profesionalesLitoral.donar(unMonto)
  }
  
  method recibirDinero(unMonto) {
    ahorros += unMonto
  }
}

class ProfesionalLibre {
  var property ahorros = 0
  const property universidad
  const property provinciasLaborales
  const property honorariosPorHs
  
  method provinciasLaborales(unasProvincias) {
    provinciasLaborales.addAll(unasProvincias)
  }
  
  method cobrar(unMonto) {
    ahorros += unMonto
  }
  
  method pasarDinero(unaPersona, unMonto) {
    if (ahorros > unMonto) {
      unaPersona.recibirDinero(unMonto)
      ahorros -= unMonto
    }
  }
  
  method recibirDinero(unMonto) {
    ahorros += unMonto
  }
}

class Universidad {
  var property donaciones = 0
  const property provincia
  const property honorarios
  
  method donar(unMonto) {
    donaciones += unMonto
  }
}

object profesionalesLitoral {
  var property donaciones = 0
  
  method donar(unMonto) {
    donaciones += unMonto
  }
}