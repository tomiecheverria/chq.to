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
La aplicación utiliza SQLite como sistema de gestión de base de datos. No es necesario instalarlo por separado, ya que Rails utiliza SQLite por defecto para 
- [SQLite](https://www.sqlite.org/) (Versions 3.8.0 y superiores son compatibles)proyectos nuevos.

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
rails db:drop
rails db:setup

Si en algun momento expiremanta algun error puede intetar ejecutar cada comando individualmente: 
        
    ```bash
# Instala las gemas necesarias
bundle install

# Crea la base de datos
rails db:create

# Ejecuta las migraciones
rails db:migrate


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

Para detalles adicionales sobre la instalacion o la configuracion puedo consultr los dos apartados anteriores

## Caracteristicas

### Acceso a la aplicacion 
Una vez inicializada la aplicacion , se mostrara el home con varios links , como usuario no logueado lo unico que puede hacer es ver los links del home y acceder a los links si es que cumple con los requsitos necesarios.
Todos los links se puede acceder publicamete, lo que sigfnifica que si se tiene la url publica o url generada por la pagina, cualquier persona puede acceder a ese link acortado sin necesidad de loguearse, y sera redireccionado al link privado o link largo si es que se cumple las condiciones. 

### Auntenticacion y checkeos de permisos 
Solo el dueño o creador el link puede ver las estadisticas y detalle del link publico , borrar el link o editarlo. 
En conclusion el usuario publico solo puede ver el home principal de las paginas y acceder al link publico.

En el caso en el que se intente acceder a alguna funcion del link privada del usuario dueño como es la edicion o borrar el link , sera redirigido a la pagina de login en el caso de no tener estar autenticado. En el caso de tener una esion abierta y no ser el duño del link sera redirigido al home.

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
**Link publicos:**
Una vez iniciada sesion se tiene disponible el acceso a las funcionalidades del menu donde se puede o cerrar sesion o ir al perfil para manejarlo.
La vista de perfil solo puede ser accedida si el usuario esta autenticado correctamente. 
Si se cumplen las condiciones para las redireccciones , se registra una visita con la direcccionj de ip y la fecha y hora.
En el caso en el que no se cumpla los criterios no se hara la redireccion y no se contara como visita
Si la redireccion es exitosa , ademas de redirigir se registra la visita acordemente y se responde con el codigo de respueta apropiado de 302.
En el caso de que se intente acceder a un link  publico cuyo slug sea invalido , se redirecciona a home con el metodo del link no existe.
Los links publicos o internos de la app se mostraran con la url base/l/slug que depende del ambiente donde se ejecute la aplicacion. En caso de ser production sera la url de chq.to , en case de que sea development sera "http://127.0.0.1:3000". El resto del patron es /l/slug , donde el slug es generado por el sistema al momento de la creacion, unico en el sistema y no puede ser modificado.

**Creacion de links**: 
si un usuario esta auntenticado puede crear un link, en donde se especifica la url pirvada o larga a la que el link publico redirecciona , un nombre del link que puede estar en blanco o tener entre 3 y 40 caracteres. En caso de dejar en blanco tendra el nombre de Unnamed link. 

Ademas se necesitara especificar el tipo con los atributos correspondiente al tipo.
**Tipos de links**
Existen 4 tipos distintos de links :

Los links regulares son links que se pueden acceder sin restriccion alguna  y no tienen ningun atributo en especial

los links temporales son los links que poseen un atributo de fecha de vencimiento. se puede acceder al link siempre que no este vencido , pasada la fecha de vencimiento el link sigue exisitiendo , por lo que se puede hacer todas las acciones de cualquier otro link como show o delete, pero la redireccion no funcionara y devolvera un error 404 por la request ademas de redigir a la vista con error de 404. La fecha de expiracion no puede ser pasada y tampoco puede ser mas de 1 año en adelante. La fehca no puede ser vacia.


los links privados son links que cuando se intenten acceder se solicitara una contraseña , en la que en caso de ser correcta se redireccionara al link , y en caso de fallar , se puede volver a intentar tantas veces como se necesite. Si no coincide no se redirecciona. La password tiene que ser entre 3 y 20 caracteres  y debe de matchear o ser igual a password confirmation. La contraseña del link se peude ver el show o reporte del link si es que se cuenta con los permisos necesarios.

los links efimeros son links que solo se puede acceder 1 sola vez y se tiene el atributo de accesssed indicando false si no se accedio y true en el caso contrario. si ya se accedio y se vuelve a intentar , redirige a la vista de error 403 con un codigo de respuesta 403 y  no se contavbiliza la visita. El dueño del link puede resetear el valor de accessed en el show del link si es que el link ya fue accedido , por lo que es posible tener mas de una visita asociada a este link. Por defualt el link efimero se crea sin accessos  , por lo que se puede acceder cuando es creado.


**Perfil de un usuario y Links**
Las operaciones sobre los links solo pueden ser hechas por el dueño o creador del link. En el caso de que se intente acceder a un lik sobre el que no se tenga permisos o no exista , sera redireccionado al home con el mensaje apropiado. 

Tanto los links del usurio como las visitas en el reporte estan listadas en pagians de 5 elementos ,  se cuenta con un paginador al fondo del listado para moverse entre las pagianas. 

En la vista de perfil se puede editar los datos del perfil o cancelar la cuenta.
en editar perfil puede cambiar todos sus atrbiutos incluyendo cambiar la contraseña.
en cancelar cuenta se puede borrar el perfil. 
* WARNING: borrar el perfil borrara tambien todos los links asociados a esa cuenta y tambien todas las visitas asociadas a  todos los links
En la vista de perfil es posible tambien crear nuevos links selecccionando el tipo de linlk 
Una vez creado el link se puede ver el link publico acortado , en el cual si se selecciona se hace la redireccion a la url privada o larga, si es que se cumple los criterios. La url publica es como se muestra el link dentro de la aplicaicion , y es generado con un slug hecho por el sistema


**Show link vista**
En el show se puede ver los detalles del link con todos sus atributos incluyendo el slug y los atributos propios del tipo del link como una password o para los efimeros si ya se accedio. 

Admeas se ve un listado de vistas, en donde cada vista posee la fecha y direccion de ip . Se puede filtrar por rango de fechas o por ip. Se muestra un resumen de visitas por dia y el total de visitas para el link.

La vista por defualt de show se carga sin parametros de busqueda por llo que se muestra todas las visitas, si se filtra por ip la busqueda es por es similitu y no estritca , por lo que si se filtra por "1" devolvera las vistas tanto de "127" como de "192"

Para el filtrado de las fechas , se incluye la fecha seleccionada para la busqueda.

Para ver el reporte entero de todas las vistas que tiene una pagina, puedes acceder desde el boton del show o no mandar ningun paramtero de busqueda ni en fechas ni en ip. Si no se seleccionan 2 fechas para un rango , con 1 sola fecha no se hara filtrado , por lo que se muestran todos los registros(en el caso de que tampoco haya nada en el parametro por ip)

Ademas del reporte de visitas , se tiene un reporte de visitas por dia en la que se muestra la cantidad de visitas por cada dia. 

Siempre se mostrara la cantidad de visitas totales del link , pero en el caso en que la busqueda no encontro visitas o que el link no tenga visitas , no se mostrara ni el listado de visitas ni el listado de dias. 

se puede volver a la vista de profile con el boton de back to links 


**Edit link**
Tambien se puede editar el link en donde se podran editar todos los atributos incluyendo el tipo y el atributo relacionado con el tipo. 
En el caso que se seleccione link temporal o privado , se pedira que se complete el atriubto especial para ese tipo de link , fecha de expiracion y passwords correspondientemente. En conclusion  los links pueden cambiar de tipo a lo largo de su vida. 

**Borrar link**

Se puede borrar el link , en donde se borrara el link junto con todas las visitas relacionadas a ese link.
Se pedira una confirmacion , en el caso de que se cancele , no se borrara, pero en el caso que se acepte se borrara el link junto con todas las visitas asociadas. 

Finalmete se puede cerrra sesion tanto por el menu como por el boton de cerrar sesion.


**Datos de preuba precargados**
Para los links temporales , un link temporal se creara con una fecha random de 1 mes en adelante. Otro link se creara con la fecha de expiracion 2 minutos mas tarde de la fecha y tiempo de cuando se ejecute el db:setup, por lo que el link expira 2 minutos despues de haber levantado los datos. 
Sin embargo siempre se puede ver la fecha de expiracion en el show , mostrando ademas si el link esta expirado o no. La fecha de expiracion se puede cambiar desde el edit propio del link

Para los links privados, 1 link se creara con una password random y el otro con una password '111', siempre se puede ver la password en el show y cambiarla en el edit. 

**Consideracion general**
La aplicacion corre con un time zone de buenos aires argentina.

## Estructura del Proyecto

La aplicación sigue una estructura típica de proyectos Ruby on Rails. A continuación, se presenta una descripción de los directorios y archivos clave:

- **app:** Contiene la lógica principal de la aplicación, incluyendo modelos, controladores y vistas.
    **assets:** Contiene activos como hojas de estilo (CSS), archivos JavaScript y archivos de im
  - **controllers:** Controladores de Rails para gestionar la lógica de las solicitudes HTTP.
   - **Helpers:** Contiene metodos que se encarga de procesar los datos para no sobercargar los controladores
  - **models:** Modelos de ActiveRecord que representan las entidades de la base de datos.
  - **views:** Vistas de Rails que definen la presentación y la interfaz de usuario.

- **storage:** Directorio utilizado para almacenar ciertos archivos generados o gestionados por la aplicación.


- **config:** Configuraciones específicas de la aplicación.
  - **initializers:** Archivos de inicialización de la aplicación.
  - **locales:** Archivos de traducción si se implementa internacionalización.
  - **enviroments:** Contiene los archivos de configuraciones para los distintos entornos
  

- **db:** Archivos relacionados con la base de datos.
  - **migrate:** Migraciones de base de datos para definir y modificar el esquema de la base de datos.

- **public:** Archivos estáticos accesibles directamente desde el navegador.

- **test:** Pruebas automatizadas.
  - **fixtures:** Datos de prueba para las pruebas.
  - **models:** Pruebas de modelos.
  - **controllers:** Pruebas de controladores.
  - **integration:** Pruebas de integración.

- **vendor:** Dependencias de terceros.

- **Gemfile y Gemfile.lock:** Archivos de definición de gemas y bloqueo de versiones.

- **config.ru:** Configuración del servidor Rack para ejecutar la aplicación.

- **Rakefile:** Tareas Rake para automatizar tareas comunes.

Además de estos directorios, hay otros archivos y directorios que pueden agregarse según las necesidades del proyecto.


## Contribución

¡Gracias por considerar contribuir a nuestro proyecto! Si tienes sugerencias, problemas o deseas aportar con código, aquí hay algunas pautas que debes seguir:

1. Abre un issue para discutir el cambio que te gustaría realizar o el problema que has encontrado.
2. Si deseas trabajar en una solución, realiza un fork del repositorio.
3. Crea una rama específica para tu contribución (`git checkout -b tu-rama`).
4. Realiza los cambios y asegúrate de probarlos.
5. Haz un pull request a la rama principal de nuestro repositorio.

Agradecemos tu contribución y trabajaremos juntos para revisar y fusionar tus cambios.

## Licencia

Este proyecto está licenciado bajo los términos de la [Licencia MIT](https://opensource.org/licenses/MIT).


* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
