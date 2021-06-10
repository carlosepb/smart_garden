# smart_garden
Jardín automático con arduino.
<!-- PROJECT LOGO -->
<br />
<p align="center">
  <h3 align="center">Jardín automático con arduino</h3>

  <p align="center">
    ¡Obtén ayuda para cuidar tu huerto!
    <br />
      <a href="https://github.com/carlosepb/smart_garden"><strong>Explorar repositorio»</strong></a>
    <br />
    <br />
      <a href="https://github.com/carlosepb/PeduleShape/blob/main/images/animation.gif">Ver Demo</a>
      ·
      <a href="https://github.com/carlosepb/smart_garden/issues">Reportar Error</a>
      ·
      <a href="https://github.com/carlosepb/smart_garden/issues">Solicitar Colaboración</a>
    </p>
  </p>



<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Tabla de Contenido</summary>
  <ol>
    <li>
      <a href="#sobre-el-proyecto">Sobre el Proyecto</a>
      <ul>
        <li><a href="#herramientas-de-desarrollo">Herramientas de Desarrollo</a></li>
      </ul>
    </li>
    <li><a href="#trabajo-realizado">Trabajo Realizado</a></li>
    <li>
      <a href="#empezando">Empezando</a>
      <ul>
        <li><a href="#prerrequisitos">Prerrequisitos</a></li>
        <li><a href="#instalación">Instalación</a></li>
        <li><a href="#ejecutar">Ejecutar</a></li>
      </ul>
    </li>
    <li><a href="#hoja-de-ruta">Hoja de Ruta</a></li>
    <li><a href="#licencia">Licencia</a></li>
    <li><a href="#contacto">Contacto</a></li>
    <li><a href="#agradecimientos">Agradecimientos</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## Sobre el Proyecto
<p align="justify">
En el ámbito que hemos querido centrar nuestro proyecto es en el hecho de que cada vez
es más habitual que las personas instalen huertos para consumo privado en sus hogares.
En algunos casos estos se instalan en lugares de acceso menos habitual como azoteas,
trasteros o sótanos los cuales no solemos ver de manera regular y este proyecto trata sobre
una solución que nos permita llevar un control del mismo desde nuestro terminal e incluso
que en caso de que sea necesario el sistema pueda realizar ajuste en el entorno mediante
soportes de riego, calefacción y luz de manera automática.
</p>
<p align="justify">
Las tecnologías empleadas son Processing y Tinkercad
(aunque esta es más bien un sustituto de toda la parte hardware no disponible,
mismamente podríamos decir que es un Arduino con una variedad de sensores conectados
a su alrededor), describiendo a continuación el trabajo realizado con ambas tecnologías.
</p>

## Trabajo Realizado
<p align="justify">
Como ya detallamos anteriormente las tecnologías empleadas son Processing y Tinkercad
(aunque esta es más bien un sustituto de toda la parte hardware no disponible,
mismamente podríamos decir que es un Arduino con una variedad de sensores conectados
a su alrededor), describiendo a continuación el trabajo realizado con ambas tecnologías.
</p>
<p align="justify">
Comenzando por el apartado de Tinkercad como ya hemos indicado la idea es simular un
huerto o invernadero automático a través de los datos obtenidos de esos sensores pudiendo
activar automáticamente la ventilación, riego automático o luz si es necesario. (imagen_1.0)
</p>
<p align="justify">
Además, se ha añadido un sistema antiincendios que activa automáticamente el sistema
de riego para minorizar los riesgos y se activa un sonido para que los usuarios tengan
conocimiento del incendio en caso de que no estén observando el huerto. (imagen_1.0)
</p>
<p align="justify">
Y se ha añadido una pantalla LCD donde se pueda observar los datos de temperatura y
humedad a tiempo real y en caso de que salte la alarma antiincendios salga un mensaje
con el número para llamar a los bomberos. (imagen_1.0)
</p>
<p align="center"><img src="images_README/circuito_arduino.PNG" alt="circuito_arduino" width="600" height="425"></p>
<p align="justify">
Elementos
  * Empezando de izquierda a derecha tenemos el círculo azul claro donde está
    conectado el led que conectará la luz o no según el sensor de fotorresistencia
    detecte cuan cantidad de luz haya.
  *
  *
  *
  *
  *
  .(imagen_5.0)
</p>
<p align="center"><img src="images/captura3.JPG" alt="shape" width="600" height="425"></br>imagen_4.0</p>
<p align="justify">
El efecto del shape podemos verlo en la imagen inferior.(imagen_5.0)
</p>
<p align="center"><img src="images/captura3.JPG" alt="shape" width="600" height="425"></br>imagen_4.0</p>

## Herramientas de Desarrollo

* [Processing3](https://processing.org/download/)

<!-- GETTING STARTED -->
## Empezando

<p align="justify">
Para modificar la aplicación y ejecutar necesitará instalar el entorno de desarrollo Processing3.
</p>

### Prerrequisitos

* Descargar y descomprimir Processing3, lo puedes encontrar [aquí](https://processing.org/download/).

### Instalación
1. Para exportar a un archivo con formato gif animado es necesario instalar GifAnimation, lo puede encontrar [aquí](https://github.com/extrapixel/gif-animation).
   
### Ejecutar

2. Proyecto.
    * Descomprimir rar.
    * Ejecutar Processin3.
    * Deberemos poner Processin3 en modo SHAPE
    * Archivo->Abrir...
   

<!-- ROADMAP -->
## Hoja de Ruta

En este momento no hay planes de mejorar la aplicación.

<!-- LICENSE -->
## Licencia

Software completamente libre para copiar o distribuir.

<!-- CONTACT -->
## Contacto

Autor: Carlos Eduardo Pacichana Bastidas

Email: carlos.eduardo.pacichana@gmail.com  carlos.pacichana101@alu.ulpgc.es

Enlace al proyecto: [https://github.com/carlosepb/PeduleShape](https://github.com/carlosepb/PeduleShape)

<!-- ACKNOWLEDGEMENTS -->
## Agradecimientos
* [Processing](https://processing.org/)
* [Gif-animation](https://github.com/extrapixel/gif-animation)
* [Funprogramming](https://funprogramming.org/)
* [Text](https://processing.org/reference/text_.html)
* [Texturas](https://www.pexels.com/es-es/)
* [Shape](https://github.com/otsedom/CIU/blob/master/P9/p9_shader_dibuja/Dibuja7.glsl)
