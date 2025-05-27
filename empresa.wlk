import profesiones.*
import clientes.*

class EmpresaServicios {
  const property honorarioReferencia
  const property profesionales = #{}
  const property clientes = #{}
  
  method contratar(unProfesional) {
    profesionales.add(unProfesional)
  }
  
  method cantEstudiantes(unaUniversidad) = profesionales.count(
    { x => x.universidad() == unaUniversidad }
  )
  
  method profesionalesCaros() = profesionales.filter(
    { x => x.honorariosPorHs() > honorarioReferencia }
  )
  
  method universidadesFormadoras() = profesionales.map(
    { x => x.universidad() }
  ).asSet()
  
  method profesionalMasBarato() = profesionales.min(
    { x => x.honorariosPorHs() }
  )
  
  method esDeGenteAcotada() = profesionales.all(
    { x => x.provinciasLaborales().size() <= 3 }
  )
  
  method puedeSatisfacer(unCliente) = profesionales.any(
    { x => self.puedeSerAtendido(unCliente, x) }
  )
  
  method puedeSerAtendido(unCliente, unProfesional) = unCliente.puedeSatisfacer(
    unProfesional
  )
  
  method paga(unProfesional, unMonto) {
    unProfesional.cobrar(unMonto)
  }
  
  method darServicio(unCliente) {
    if (self.puedeSatisfacer(unCliente)) {
      self.paga(
        self.posiblesProfesionales(unCliente).anyOne(),
        self.posiblesProfesionales(unCliente).anyOne().honorariosPorHs()
      )
      clientes.add(unCliente)
    }
  }
  
  method cantClientes() = clientes.size()
  
  method esCliente(unCliente) = clientes.contains(unCliente)
  
  method posiblesProfesionales(unCliente) = profesionales.filter(
    { x => self.puedeSerAtendido(unCliente, x) }
  )
  
  method esPocoAtractivo(
    unProfesional
  ) = unProfesional.provinciasLaborales().all(
    { x => self.profesionalMasBaratoEn(
        x
      ).honorariosPorHs() < unProfesional.honorariosPorHs() }
  )
  
  method profesionalesAtiendenEn(unaProvincia) = profesionales.filter(
    { x => x.provinciasLaborales().contains(unaProvincia) }
  )
  
  method profesionalMasBaratoEn(unaProvincia) = self.profesionalesAtiendenEn(
    unaProvincia
  ).min({ x => x.honorariosPorHs() })
}