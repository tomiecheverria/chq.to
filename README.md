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

  \curl -sSL https://get.rvm.io | bash -s stable
  source ~/.rvm/scripts/rvm
  rvm install 3.2.2


- **Rails:**
La aplicación utiliza el framework Ruby on Rails. Se ha desarrollado y probado con Rails 7.1.2. Puedes instalar Rails utilizando el siguiente comando:
    ```bash
    gem install rails -v 7.1.2

- **Sistema de gestion de base de datos :**
La aplicación utiliza SQLite como sistema de gestión de base de datos. No es necesario instalarlo por separado, ya que Rails utiliza SQLite por defecto para proyectos nuevos.

- **Bundler :**
Bundler es una herramienta para gestionar las dependencias de tu proyecto Ruby. Si aún no lo tienes instalado, puedes hacerlo ejecutando:
    ```bash
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

## Instalación

Sigue estos pasos para instalar y configurar la aplicación en tu entorno local:

1. **Clona el Repositorio:**
   ```bash
   git clone https://github.com/tomiecheverria/chq.to.git
    cd chq.to/

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
   ## SQLite

    La aplicación utiliza SQLite como sistema de gestión de base de datos en entornos de desarrollo y prueba. Asegúrate de tener SQLite instalado en tu sistema.

    ```bash
    # Instalar SQLite
    # Consulta la documentación de SQLite para instrucciones específicas para tu sistema operativo.

    Desarrollo (Development):

    Nombre de la base de datos: storage/development.sqlite3

2. **Configuración de Gemas Adicionales:**
    La unica gema que necesita ser configurada o seteada mas alla de ejecutar el bundle install fue Devise.
    Se puede ver toda su documentacion y seteo en : https://github.com/heartcombo/devise
    La gema fue seteada con los mismos valores que explicita la documentacion oficial: 
    
    ```ruby
    config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
    ```

    Para el resto de gemas adicionales , si bien no se establecio ninguna configuraion adicional , se explicita la documentacion oficial : 
    [ruby-lsp](https://github.com/rubyide/vscode-ruby)
    [RuboCop](https://github.com/rubocop/rubocop)
    [will_paginate](https://github.com/mislav/will_paginate)
    [Faker](https://github.com/faker-ruby/faker)

4. **Configuración del Servidor de Desarrollo:**
   Si deseas personalizar la configuración del servidor de desarrollo (por ejemplo, el puerto en el que se ejecuta), revisa el archivo `config/environments/development.rb`.

5. **Configuración de Rutas y Controladores:**
   Verifica las rutas en `config/routes.rb` y los controladores en `app/controllers` para asegurarte de que se ajusten a la lógica de tu aplicación.
   No se realizo ninguna configuracion especifica para este entorno , viene con la configuracion pre cargada de un proeyecto nuevo de rails.
   Para ver mas detalle visite la docuementacion oficial de rails.

## Uso

### Configuración del Entorno

Antes de comenzar a usar la aplicacion, asegurarse de seguir los requisitos del sistema y de seguir la guia de instalacion.

### Ejecucion de la aplicacion

Una vez ya instalada la aplicaicon puede iniciarla con rail server o rails s. Estara disponible en http://127.0.0.1:3000/.
Ademas posee de una consola de ruby con rails c en donde tiene todos los datos y funciones de la aplicacion actual.
puede manipular los datos de la base de datos con rails dbconsole 


### Acceso a la aplicacion 
Una vez inicializada la aplicacion , se mostrara el home con varios links , como usuario no logueado lo unico que puede hacer es ver los links del home y acceder a los links si es que cumple con los requsitos necesarios.

Las caracteristicas de cada link estaran especificadas en el apartado de caracteristicas. 

Se puede iniciar sesion desde el menu con la opcion de sigin in.

Puede iniciar seesion con algunos de los usuarios ya provistos o crear un usuario nuevo con un mail contraseña y nombre de usuario. 

1. **Usuarios disponibles:**
Ambos usuarios tienen la misma cantidad de links creados con la misma cantidad de visitas en cada link 
* usuario1 : 
email: user1@example.com
password: password123

* usuario 2:
email: user2@example.com
password: password456

Cada usuario tiene cargado 2 links de cada tipo, teninedo un total de 8 links para cada usuario con 20 visitas para cada link. 

Una vez iniciada sesion se tiene disponible el acceso a las funcionalidades del menu donde se puede o cerrar sesion o ir al perfil para manejarlo.
La vista de perfil solo puede ser accedida si el usuario esta autenticado correctamente. 

En la vista de perfil se puede editar los datos del perfil o cancelar la cuenta.
en editar perfil puede cambiar todos sus atrbiutos incluyendo cambiar la contraseña.
en cancelar cuenta se puede borrar el perfil. 
* WARNING: borrar el perfil borrara tambien todos los links asociados a esa cuenta y tambien todas las visitas asociadas a  todos los links
En la vista de perfil es posible tambien crear nuevos links selecccionando el tipo de linlk , mas detalles en el apartado de caracteristicas. 
Una vez creado el link se puede ver el link publico acortado , en el cual si se selecciona se hace la redireccion a la url privada o larga, si es que se cumple los criterios. La url publica es como se muestra el link dentro de la aplicaicion , y es generado con un slug hecho por el sistema


**Show link vista**
En el show se puede ver los detalles del link con todos sus atributos incluyendo el slug y los atributos propios del tipo del link como una password o para los efimeros si ya se accedio. 

Admeas se ve un listado de vistas, en donde cada vista posee la fecha y direccion de ip . Se puede filtrar por rango de fechas o por ip. Se muestra un resumen de visitas por dia y el total de visitas para el link.

Tambien se puede editar el link en donde se podran editar todos los atributos incluyendo el tipo y el atributo relacionado con el tipo. 

Se puede borrar el link , en donde se borrara el link junto con todas las visitas relacionadas a ese link.

Finalmete se puede cerrra sesion tanto por el menu como por el boton de cerrar sesion.



Para los links temporales , un link temporal se creara con una fecha random de 1 mes en adelante. Otro link se creara con la fecha de expiracion 2 minutos mas tarde de la fecha y tiempo de cuando se ejecute el db:setup, por lo que el link expira 2 minutos despues de haber levantado los datos. 
Sin embargo siempre se puede ver la fecha de expiracion en el show , mostrando ademas si el link esta expirado o no. La fecha de expiracion se puede cambiar desde el edit propio del link

Para los links privados, 1 link se creara con una password random y el otro con una password '111', siempre se puede ver la password en el show y cambiarla en el edit. 


* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
