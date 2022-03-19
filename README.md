# MovieFlix

[![N|Solid](https://cldup.com/dTxpPi9lDf.thumb.png)](https://nodesource.com/products/nsolid)

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

El presente proyecto muestra un listado de pelicula con su respectivo detalle. Ademas, de su respectivo trailer. Se lista algunas de las características del proyecto.

  - Xcode 13.3
  - Lenguaje Swift
  - Arquitectura MVVM
  - Swift Package Manager
  - Kingfisher
  - Youtube Player
  
# Capas

  - App: Contiene los archivos relacionados al ciclo de vida del App
  - Model: Contiene las entidades que forman parte del negocio.
  - View: Contiene las storyboards, vistas customizadas, celdas que se utilizan en el proyecto.
  - ViewModel: Representa la abstracción de la vista que expone métodos y propiedades públicas. Lo más característico es que dispone de un binder que se encarga de comunicar la vista con las propiedades enlazadas en el view model. Para nuestro caso particular solo hemos utilizado para la comunicacion a los clousures.
  - Controllers: Contiene los distintos controladores que hacen referencia a las pantallas del app.
  - Network: Representa la capa de red donde se declara los metodos para consumir los servicios web. En nuestro caso estamos utilizando UrlSession para la conexion a los servicios.
  - Resources: Contiene el assets del proyecto
  - Util: En esta parte estan las extensiones y un archivo para almacenar constantes.
  - Support: Contiene archivo info.plist
  
### Responsabilidad

A continuacion se describen algunos elementos del proyecto

* PlayerView - Es la vista que se encarga de mostrar el reproductor de videos
* MovieTableViewCell - Contiene datos que se muestran en la celda del listado de peliculas
* MovieViewModel - Contiene el viewmodel asociado a las peliculas
* TopRatedViewController: Contiene el listado de peliculas de tipo Top Rated
* PopularViewController: Contiene el listado de peliculas de tipo Popular
* UpcomingViewController: Contiene el listado de peliculas de tipo Upcoming
* DetailViewController: Contiene el detalle de la pelicula seleccionada, muestra un preview image, resumen y una pequeña lista de peliculas relacionadas si aplicara.
* PlayerViewController: Contiene las vistas y propiedades del reproductor de videos 
* RelatedMovieViewController: Contiene la vista de peliculas relacionadas a la que hemos seleccionado
* APIManager: Contiene los metodos que consumen los servicios web para las peliculas, listado, detalle, busqueda
* Networkable: Define el protocolo base solicitar y obtener la data de los servicios web
* Constants: Contiene los valores definidos a utilizar dentro del app desde este archivo centralizado.

### SOLID y  Código Limpio

* Principio de simple responsabilidad : Una clase debe tener una razón, y sólo una, para cambiar. Es decir, una clase solo debe tener una responsabilidad. Este principio nos ayuda a indentificar ciertos casos como los siguientes: La cantidad de metodos publicos es demasiada. La clase en cuestion es muy complicada de testear. La cantidad de imports y/o la cantidad de lineas de codigo que tiene la clase esta desbordando. Este principio nos ayudara a corregir esta parte de nuestro codigo y mientras tengamos un proyecto vivo (que este sometido a cambios) siempre es posible en algun momento incurrir en alguna practica que genere un caso que pueda alterar el buen funcionamiento de nuestro proyecto.
* Codigo Limpio : En mi opinion deberia reflejarse lo siguiente. Al momento de diseñar los casos de prueba permite salvaguardar la calidad de codigo implementado. Tambien, permite refinar la cantidad de codigo escrito. Es facil de leer y entender lo que permite un desarrollo más rápido y escalable de forma segura. Finalmente, para que todo esto sea exitoso se debe contar con el tiempo necesario para poder ejecutar todo este proceso que proviene de una buena practica. La parte o area tecnica debe ser responsable de velar por este cumplimiento de manera natural y estando plenamente convencido de sus beneficios a corto y largo plazo.
