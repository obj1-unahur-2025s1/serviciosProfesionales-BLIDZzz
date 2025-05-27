import profesiones.*
import empresa.*

class Persona {
  const property provincia
  
  method puedeSatisfacer(
    unProfesional
  ) = unProfesional.provinciasLaborales().contains(provincia)
}

class Institucion {
  const property universidadesReconocidas
  
  method puedeSatisfacer(unProfesional) = universidadesReconocidas.contains(
    unProfesional.universidad()
  )
}

class Club {
  const property provincias
  
  method puedeSatisfacer(unProfesional) = provincias.any(
    { x => unProfesional.provinciasLaborales().contains(x) }
  )
}