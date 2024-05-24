# Sistema de Registro - Backend

Este es el repositorio del backend para el Sistema de Registro. Proporciona una API RESTful para la gestión de clientes y otras funcionalidades.

## Requisitos

Asegúrate de tener las siguientes versiones instaladas:

- Ruby: 3.3.1
- Rails: 7.1.3.3
- PostgreSQL: 14.11

## Configuración de la Base de Datos

El archivo `config/database.yml` contiene la configuración de la base de datos. Asegúrate de que esté configurado correctamente, especialmente para el entorno de desarrollo.

- Crea la base de datos usando PostgreSQL, a la mia la llame "System_app".
- Crea un usuario con su contraseña y dale todos los privilegios
- agrega la base de dato en el archivo `config/database.yml,
- 

```yaml
default: &default
  adapter: postgresql <---- cambia siempre este elemento exactamente como esta aqui
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  timeout: 5000
  host: localhost
  username: tu_usuario
  password: tu_contraseña

development:
  <<: *default
  database: Nombre_de_tu_base_de_datos

test:
  <<: *default
  database:  Nombre_de_tu_base_de_datos_test

production:
  <<: *default
  database:  Nombre_de_tu_base_de_datos_production
  username: <%= ENV['DB_USERNAME'] %>
  password: <%= ENV['DB_PASSWORD'] %>

## Instalación

Para instalar las dependencias del proyecto, ejecuta:

- bundle install

## Creación y Migración de la Base de Datos

Una vez ya este todo configurado en el archivo `config/database.yml` crea y migra la base de datos, ejecuta los siguientes comandos:

- rails db:create
- rails db:migrate

## Ejecución
Una vez que la base de datos esté configurada y migrada correctamente, puedes ejecutar el servidor Rails con el siguiente comando:
-rails s
Recuerda: El servidor estará disponible en http://localhost:3000.!
