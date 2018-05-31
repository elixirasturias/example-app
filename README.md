# ExampleApp

Aplicación de ejemplo para usar como base para las diferentes charlas y talleres
que necesiten hacer prototipos rápidos y sencillos.

## Setup del entorno de desarrollo con Docker

Una vez tengas [Docker instalado en tu sistema](https://docs.docker.com/install/), para comenzar a trabajar con el proyecto:

* Genera el container de `web` con `docker-compose build web`.
* Instala las dependencias con `docker-compose run web mix deps.get`.
* Crea la base de datos con `docker-compose run web mix ecto.create`.
* Ejecuta las migraciones con `docker-compose run web mix ecto.migrate`.
* Instala las dependencias de Node.js con `docker-compose run web bash -c "cd assets; npm install"`.
* Inicia la aplicación con `docker-compose up`.

## Setup del entorno de test con Docker

Estos pasos asumen que previamente has seguido las instrucciones del entorno de desarrollo.

* Crea la base de datos de test con `docker-compose run web env MIX_ENV=test mix ecto.create`.
* Ejecuta las migraciones en test con `docker-compose run web env MIX_ENV=test mix ecto.migrate`.
* Ejecuta la suite de tests con `docker-compose run web env MIX_ENV=test mix test`.

----------------------------

Este proyecto forma parte de la organización [elixirasturias](https://github.com/elixirasturias).
Esto significa que cumple con los [core values](https://github.com/elixirasturias/base/blob/master/files/VALUES.md), el [código de conducta](https://github.com/elixirasturias/base/blob/master/files/CODE_OF_CONDUCT.md), y usa una [licencia](https://github.com/elixirasturias/base/blob/master/files/LICENSE) equivalente.
