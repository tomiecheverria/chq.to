# chq.to

Esta aplicación web es un generador y gestor de enlaces cortos, inspirado en servicios como Bitly, T.ly o TinyURL. Su objetivo es proporcionar enlaces cortos para URLs de cualquier longitud, permitiendo a los usuarios compartir fácilmente páginas web en redes sociales y otras plataformas de comunicación online.

## Funcionalidades Principales

- **Generación de Enlaces Cortos:** Convierte URLs largas en enlaces cortos y fáciles de recordar.
- **Gestión de Enlaces:** Visualiza y administra los enlaces cortos generados.
- **Uso en Redes Sociales:** Facilita el uso de enlaces cortos en diversas plataformas online.


## Contenido

1. [Requisitos del Sistema](#requisitos-del-sistema)
2. [Instalación](#instalación)
3. [Configuración](#configuración)
4. [Uso](#uso)
5. [Características](#características)
6. [Estructura del Proyecto](#estructura-del-proyecto)
7. [Contribución](#contribución)
8. [Licencia](#licencia)


## Requisitos del Sistema

Asegúrate de tener instalados los siguientes requisitos del sistema antes de ejecutar la aplicación:

- **Ruby:** La aplicación requiere Ruby. Se ha desarrollado y probado con Ruby 3.2.2. Puedes instalar Ruby utilizando un administrador de versiones como RVM o rbenv.

  ```bash
  # Instalación con RVM
  \curl -sSL https://get.rvm.io | bash -s stable
  source ~/.rvm/scripts/rvm
  rvm install 3.2.2


- **Rails:**
La aplicación utiliza el framework Ruby on Rails. Se ha desarrollado y probado con Rails 7.1.2. Puedes instalar Rails utilizando el siguiente comando:
    ```bash
    # Instalación con RVM
    gem install rails -v 7.1.2

- **Sistema de gestion de base de datos :**
La aplicación utiliza SQLite como sistema de gestión de base de datos. No es necesario instalarlo por separado, ya que Rails utiliza SQLite por defecto para proyectos nuevos.

- **Bundler :**
Bundler es una herramienta para gestionar las dependencias de tu proyecto Ruby. Si aún no lo tienes instalado, puedes hacerlo ejecutando:
    ```bash
    # Instalación con RVM
    gem install bundler

- **Navegador :**
Se recomienda que se use la aplicaicon en google chrome 

## Gemas Adicionales

La aplicación utiliza las siguientes gemas adicionales para mejorar su funcionalidad:

- **Devise:** [Devise](https://github.com/heartcombo/devise) es una gema flexible y completa para la autenticación de usuarios en Rails. Facilita la implementación de funciones como el inicio de sesión, registro, restablecimiento de contraseña, entre otros.

  ```ruby
  gem 'devise'

- **ruby-lsp:** [ruby-lsp]Un servidor de lenguaje (Language Server Protocol) para Ruby que ofrece características como completado automático, linting y más para mejorar la experiencia de desarrollo.

    ```ruby
    gem "ruby-lsp"

- **RuboCop:** [RuboCop]Un linter y formateador de código Ruby que ayuda a mantener un estilo de código consistente y siguiendo las mejores prácticas.

    ```ruby
    gem "rubocop"

- **will_paginate:** [will_paginate]Una gema para paginación en Rails que facilita la implementación de la paginación para conjuntos de datos grandes. prácticas.

    ```ruby
    gem 'will_paginate'


- **Faker:** [Faker]Una biblioteca para la generación de datos falsos, útil para llenar tu base de datos con información de prueba durante el desarrollo y las pruebas.
    ```ruby
    gem 'faker'

Asegúrate de ajustar la información según las necesidades específicas de tu aplicación. También puedes agregar requisitos adicionales según las gemas o servicios externos que estés utilizando en tu proyecto.

Todas las gemas se pueden instalar usando bundle install.
Todas las gemas se pueden actualizar a la ultima version disponible con bundle update, en el caso que se necesite.

## Instalación

Sigue estos pasos para instalar y configurar la aplicación en tu entorno local:

1. **Clona el Repositorio:**
   ```bash
   git clone https://tu-repositorio.git
   cd nombre-de-tu-proyecto



Perfecto, aquí tienes una sección de instalación para tu README:

markdown
Copy code
## Instalación

Sigue estos pasos para instalar y configurar la aplicación en tu entorno local:

1. **Clona el Repositorio:**
   ```bash
   git clone https://tu-repositorio.git
   cd nombre-de-tu-proyecto

2. **Instala Ruby:**
Asegúrate de tener Ruby instalado en tu sistema. Puedes verificar la versión instalada ejecutando:

ruby -v


3. **Instala Rails:**
Instala Rails utilizando el siguiente comando:

gem install rails -v 7.1.2

4. **Instala Bundle:**
Si no tienes Bundler instalado, ejecuta:

gem install bundler

5. **Instala Dependencias:**
Ejecuta el siguiente comando para instalar las gemas necesarias:

bundle install

6. **Configura la base de datos :**
Ejecuta el siguiente comando para instalar las gemas necesarias:

rails db:setup

6. **Inicia el servidor :**
rails server
La aplicación estará disponible en http://localhost:3000. Puedes acceder a ella desde tu navegador web.
Se recomienda fuertemente que se use el navegador de Google chrome.


## Configuración

Antes de ejecutar la aplicación, revisa y configura los siguientes aspectos según tus necesidades específicas:

1. **Configuración de la Base de Datos:**
   Asegúrate de que la configuración de la base de datos en `config/database.yml` sea correcta para tu entorno de desarrollo, prueba y producción.

2. **Configuración de Gemas Adicionales:**
   Algunas gemas adicionales pueden requerir configuración adicional. Revisa la documentación de cada gema y ajusta sus configuraciones según sea necesario.

3. **Variables de Entorno:**
   Si tu aplicación utiliza variables de entorno para configuraciones sensibles, como las claves de API o configuraciones específicas del entorno, asegúrate de configurar estas variables.

   Puedes utilizar un archivo como `.env` para definir variables de entorno en desarrollo. No olvides agregar `.env` a tu archivo `.gitignore` para evitar que se incluyan en tu repositorio.

4. **Configuración del Servidor de Desarrollo:**
   Si deseas personalizar la configuración del servidor de desarrollo (por ejemplo, el puerto en el que se ejecuta), revisa el archivo `config/environments/development.rb`.

5. **Configuración de Rutas y Controladores:**
   Verifica las rutas en `config/routes.rb` y los controladores en `app/controllers` para asegurarte de que se ajusten a la lógica de tu aplicación.

6. **Personalización del README:**
   Personaliza este archivo README.md según las necesidades específicas de tu proyecto. Proporciona información adicional sobre cómo usar la aplicación, características clave y cualquier otra información relevante.

7. **Verificación de Configuraciones de Producción:**
   Antes de implementar la aplicación en un entorno de producción, asegúrate de revisar y ajustar las configuraciones específicas del entorno de producción en `config/environments/production.rb`.

Recuerda documentar cualquier configuración adicional que sea específica de tu aplicación para facilitar la colaboración y la comprensión del código por parte de otros desarrolladores.




* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
