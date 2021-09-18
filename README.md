# Objetivo test-moral
Trabajo realizado en la asignatura Fundamentos de Inteligencia Artificial (FIA) en el Grado de Ingeniería Informática de la UNED. Consiste en la ejecución de un pequeño proyecto de desarrollo de un Sistema Basado en Reglas, desde la fase inicial de compilación del conocimiento experto necesario, hasta la fase final de pruebas. El sistema tiene que contener los hechos y reglas de un mundo virtual relacionado con un tema sugerido por el equipo docente de la asignatura.

El desarrollo se ha realizado en el lenguaje **Prolog (PROgrammation en LOGique)**. Prolog es un lenguaje de programación emblemático de la inteligencia artificial. Se basa en la lógica de predicados de primer orden restringida a cláusulas de Horn para representar datos y conocimiento, y utiliza encadenamiento hacia atrás y una estrategia de reversibilidad sin información heurística conocida como backtracking. 

El objetivo del trabajo es familiarizarse con los conceptos sobre **representación del conocimiento e inferencia** (Lógica y representación del conocimiento, Sistemas Basados en Reglas y Redes semánticas y marcos), así como para experimentar con el **diseño de Sistemas Basados en Reglas** sencillos e introducirse en el campo de las metodologías de desarrollo de la inteligencia artificial.

Para la realización de esta práctica se ha utilizado el intérprete **SWI-Prolog**. Por otra parte, tanto para orientar el diseño del programa y la metodología de desarrollo, como para la escritura de la memoria se ha utilizado como referencia el &quot;_Capítulo 19 Ingeniería del Conocimiento_&quot; del libro base de la asignatura (_Inteligencia Artificial: Técnicas, Métodos y Aplicaciones (2008), McGraw-Hill_).



# Tabla de Contenido

1. [Descripción del conocimiento del dominio modelado](#1)
2. [Descripción breve de la metodología de desarrollo](#2)
    1. [Identificación del problema](#3)
    2. [Adquisición de conocimientos](#4)
    3. [Conceptualización](#5)
    4. [Formalización](#6)
    5. [Implementación del sistema](#7)
    6. [Evaluación](#8)
3. [Descripción de la estructura de base de reglas](#9)
    1. [Inicio](#10)
    2. [Preguntas del test](#11)
    3. [Resultado](#12)
    4. [Pantalla final](#13)
    5. [Eficiencia](#14)
4. [Requisitos mínimos del sistema](#17)
5. [Código comentado en Prolog](#15)
6. [Bibliografía](#16)



<a name="1"/>

# Descripción del conocimiento del dominio modelado


El tema que propongo se trata de una &quot;Distopía Tecnológica&quot;, y tiene relación directa con la &quot;Competividad&quot;, ambos temas propuestos en el enunciado de la práctica.

Basándome en el capítulo Nosedive de Black Mirror ([enlace](https://es.wikipedia.org/wiki/Nosedive)) y en el artículo publicado por Xataka &quot;_Así es el sistema con el que China puntúa a sus ciudadanos y les asigna castigos y recompensas_&quot; ([enlace](https://www.xataka.com/privacidad/asi-sistema-que-china-puntua-a-sus-ciudadanos-les-asigna-castigos-recompensas)), me gustaría representar una sociedad donde el los ciudadanos están sometidos a un sistema de puntos para evaluar su conducta.

A diferencia de Nosedive, donde los propios habitantes puntuaban a otros habitantes, en la realidad que he representado, es el propio gobierno quien rastrea todas las acciones y movimientos, realiza el seguimiento y obtiene la puntuación de sus ciudadanos. Existe un sistema de crédito social que utiliza el Big Data y la Inteligencia Artificial para calificar el civismo y establecer recompensas o castigos en base a la puntuación:

- Un ejemplo de una recompensa es, por ejemplo, que te permita vivir en un barrio de gente &quot;buena&quot;.
- Por otra parte, un castigo sería que el gobierno sospeche que vayas a cometer actos criminales (en base a tu puntuación), y te lleven a la cárcel antes de cometerlos.

Tal y como son las distopías, esta sociedad ficticia es indeseable en sí, y rebasa la ética del empleo de las tecnologías. Sin embargo, se me ha ocurrido esta temática debido a que en China están planteado un sistema parecido de puntuación, tal y como se recoge el artículo mencionado arriba.

En cuanto al escenario representado, el protagonista de mi historia es un ciudadano que está al límite de ser castigado por su baja puntuación como ciudadano, y acude a un programa de recuperación de puntos antes de que sea tarde.

Para superar el programa de recuperación de puntos, tiene que realizar un test donde se le muestran diferentes situaciones de la vida cotidiana, y el usuario deberá escoger la conducta más adecuada ética y moralmente, ante cada situación. Si lo hace bien, podrá recuperar la puntuación perdida, salir de su situación crítica y gozar de los privilegios de ser un ciudadano &quot;bueno&quot;. De lo contrario, será sometido a sanciones y le deparará un futuro incierto.



<a name="2"/>

# Descripción breve de la metodología de desarrollo

La metodología de desarrollo seguida ha sido la descrita en el capítulo _19.1 Introducción a la Ingeniería del Conocimiento_ del texto base. A continuación se detallan sus etapas:

<a name="3"/>

## Identificación del problema

Durante la definición del problema, hay que asegurar que el problema a resolver es adecuado para realizarlo mediante la Ingeniería del Conocimiento (IC), teniendo en cuenta que la IC es la disciplina de la Inteligencia Artificial (IA) que proporciona los métodos y técnicas para construir sistemas computacionales denominados Sistemas Basados en Conocimiento (SBCs).

En este sistema, se ha trabajado sobre un listado de preguntas test, mediante la cual el usuario ha ido optando las distintas opciones para cada cuestión planteada. En esta secuencia, se han ido comprobando predicados y reglas contenidas en la Base de Conocimiento (BC), y además, parte de esta BC ha sido modificada (p.ej. la puntuación del usuario) durante el trascurso del programa.

Por tanto, se concluye que la tarea que debe resolver el SBC es viable técnicamente y oportuno según las condiciones actuales del entorno.

<a name="4"/>

## Adquisición de conocimientos

La adquisición de conocimientos consiste en recopilar conocimientos desde expertos u otras fuentes de conocimientos. Para la realización de esta práctica, se ha intentado extraer el conocimiento de un artículo y un capítulo de una serie. Sin embargo, estas fuentes han sido mera inspiración. Debido a que la temática es una distopía, se ha ideado el conocimiento que se ha considerado adecuado para la representación de la escena.

El conocimiento que se ha incluido al programa ha sido, por ejemplo, las constantes filosofo, profesorEtica, camarero, etc. y también los hechos, como por ejemplo suspenso(narcotraficante), etc. Se ha definido el sistema de puntuación, y los rangos de puntuación que corresponden a nota. También se han establecido las profesiones recomendadas por rango.

<a name="5"/>

## Conceptualización

El modelo conceptual que va a componer el sistema se ha estructurado de la siguiente forma:

- Primero se han declarado los hechos con constantes (sin variables dinámicas).
- Luego se han declarado los hechos con variables dinámicas.
- A continuación, se han incluido los predicados que usan tanto las constantes como los hechos. El orden en que se han indicado los predicados corresponde al orden natural en el cual van figurando en el transcurso del programa, ya que así el código se presenta de una forma más entendible.

<a name="6"/>

## Formalización

La formalización es la representación semicomputable del modelo conceptual de forma que permita realizar las deducciones necesarias para poder interpretar los conocimientos almacenados.

En este punto, se establecen los predicados, y se deducen los conocimientos para que cumpla con una condición determinada en las reglas de los predicados. Por ejemplo, como parte de la formalización, se ha realizado el diseño de imprimir por pantalla el texto y las opciones a escoger por el usuario.

<a name="7"/>

## Implementación del sistema

Los pasos descritos hasta ahora corresponden a la parte del diseño del programa. La implementación consiste en codificar los modelos diseñados en un modelo computable, y preparar el sistema para que puedan incorporarse modificaciones, prestando especial atención a la actualización del conocimiento.

En esta práctica, el código desarrollado se puede visualizar en el _Anexo 1_. Ha sido implementado en un único fichero, siguiendo la estructura descrita en la sección _2.3. Conceptualización_. Durante su implementación, se ha tenido que realizar modificaciones e incorporar cambios de forma estática (añadiendo/quitando código), tanto para corregir anomalías, como para incorporar funcionalidades.

<a name="8"/>

## Evaluación

La evaluación es el conjunto de actividades que se llevan a cabo durante toda la fase de desarrollo del SBC para asegurar la fiabilidad y calidad del sistema. Como parte de la evaluación del código desarrollado, se han realizado pruebas, utilizando diferentes combinaciones de las respuestas introducidas por el usuario, para comprobar que cumple con los resultados esperados, y requisitos establecidos. Además, se ha comprobado que no se genera ningún tipo de error de ejecución o resultado inesperado.

<a name="9"/>

# Descripción de la estructura de base de reglas

En esta sección se indica la descripción del sistema y sus componentes de forma detallada. 

<a name="10"/>

## Inicio

Para comenzar la ejecución de la aplicación, hay que cargar el conocimiento en el intérprete SWI-Prolog, indicando [_test\_moral_]. Después, el programa se inicia escribiendo en el editor _start_. Aquí es donde el programa internamente salta al predicado _start_. Cabe decir que, para la ejecución de la aventura, solo es necesario utilizar un predicado (start) y este es el que se encarga de usar todos los demás.

Lo primero que este predicado hace es borrar toda la pantalla para empezarla en blanco, y de forma clara. Muestra en pantalla la introducción al programa de recuperación de puntos, pide el nombre de usuario, y cuando el usuario esté preparado, le da al intro para comenzar con las preguntas del test del programa (siguientes predicados).

Predicados utilizados:

- `start/0`: Introducción: Se trata de la pantalla principal. Es donde comienza la simulación.
- `borrarTerminal/0`: Predicado para borrar el terminal.
- `detener/0`: Detiene la aplicacion hasta pulsar Intro.
- `incluye/1`: Regla mediante la cual el programa aprende que el nombre de usuario pasado es un nombre de usuario.
- `secuenciaPreguntas/1`: predicado que inicia la secuencia de las preguntas.

<a name="11"/>

## Preguntas del test

Al inicio de cada pregunta de test lo primero que hacen los predicados es borrar toda la pantalla, para empezarla en blanco también y de forma clara. La aplicación consta de cuatro preguntas de test:

1. Pregunta 1: La Verdad
2. Pregunta 2: La Lealtad
3. Pregunta 3: La Honestidad
4. Pregunta 4: La Solidaridad

En cada pregunta, se muestran 3 opciones a elegir. El usuario elige introduciendo el número de la opción seleccionada en pantalla. Cada opción tiene una puntuación, puede tener unos comentarios y tiene una respuesta asociados:

- La puntuación se suma a la puntuación total acumulada hasta el momento.
- Los comentarios son comentarios sobre la opción elegida, es decir, puntos fuertes y débiles a resaltar sobre las respuestas del usuario, que se van acumulando en una lista para mostrarle al usuario al final del test. De las tres respuestas, solo dos (la mejor y la peor) contienen estos comentarios.
- La respuesta es un predicado, el cual salta en pantalla cada vez que se responde una pregunta, indicándole al usuario si ha respondido correctamente o no.

Predicados utilizados: se indican los predicados que se han utilizado en esta sección, diferentes a los ya mencionados (no se incluyen los ya mencionados, p.ej., borrarTerminal/0, debido a que han sido explicados arriba):

- `preguntaX/0`: predicados de las preguntas. X puede ser 1, 2, 3 y 4. Son 4 predicados en total.
- `respuestaPX/0`: predicados para redirigir a las respuestas de las preguntas. X puede ser 1, 2, 3 y 4. Son 4 predicados en total, una para cada pregunta. Este predicado lo que hace es, según la respuesta elegida (1, 2 o 3), redirige al predicado de respuesta correspondiente.
- `respXY/0`: predicados de las respuestas. X puede ser 1, 2, 3 o 4, e Y puede ser A, B, o C. Por tanto, un predicado resp1B/0 se refiere a la respuesta 2 (B = 2) de la pregunta 1. Estos predicados contienen la puntuación a sumar, los comentarios y la respuesta a mostrar en la pantalla.
- `sumaPuntos/2`: predicado para sumar unos determinados puntos a un determinado usuario.
- `incluirComentario/1`: predicado para incluir un comentario (puntos fuertes y débiles a destacar al final del test) en la lista de comentarios.

<a name="12"/>

## Resultado

Se trata de la penúltima pantalla, que también comienza borrando la pantalla y sobre un lienzo blanco. Esta pantalla muestra al usuario los puntos obtenidos, y en base a su puntuación, se le asigna una nota entre: deficiente, suspenso, suficiente, notable o sobresaliente.

Además, el sistema sugiere una profesión en base a la puntuación obtenida. Por ejemplo, con un notable, el sistema sugiere como profesión profesor de ética.

Finalmente, se muestran los comentarios (puntos fuertes y débiles) del usuario que se han ido acumulando durante la resolución de las preguntas.

Predicados utilizados: se indican los predicados que se han utilizado en esta sección, diferentes a los ya mencionados:

- `mostrarResultado/1`: predicado que muestra la puntuación de un determinado usuario. Extrae su puntuación y llama al predicado asigarResultado/1.
- `asignarResultado/1`: predicado que asigna el resultado final en base a la puntuación obtenida. Este predicado recibe la puntuación, y en base a la puntuación, muestra un mensaje del sistema u otro, y una profesión u otra.
- `deficiente/1`: predicado que muestra la profesión asignada para una nota deficiente.
- `suspenso/1`: predicado que muestra la profesión asignada para una nota suspenso.
- `suficiente/1`: predicado que muestra la profesión asignada para una nota suficiente.
- `notable/1`: predicado que muestra la profesión asignada para una nota notable.
- `sobresaliente/1`: predicado que muestra la profesión asignada para una nota sobresaliente.
- `comentariosAsignados/0`: predicado que muestra los comentarios generados durante la corrección del test.
- `imprimirComentarios/1`: predicado recursivo. Imprimie los comentarios guardados en la lista.

<a name="13"/>

## Pantalla final

La pantalla final es una pantalla de cierre del programa. Comienza borrando la pantalla y sobre un lienzo blanco, y lo que hace es agradecer al usuario por participar y despedirse.

Predicados utilizados: se indican los predicados que se han utilizado en esta sección, diferentes a los ya mencionados:

- `end/0`: Fin: Se trata de la pantalla final. Es donde termina la simulación.

<a name="14"/>
 
## Eficiencia

En cuanto a la eficiencia, tal y como se ha descrito en la metodología de desarrollo y en la estructura del programa, se ha procurado ordenar el código de forma en que primero figuran los hechos con constantes y variables dinámicas, y después, los predicados. Esto favorece la legibilidad del propio código. Además, Prolog es un leguaje que no utiliza tipos de datos en sus variables, y esto es otro punto a favor de cara a la eficiencia, ya facilita la visualización del funcionamiento del propio código, y simplifica su estructura.

Asimismo, se han utilizado los siguientes predicados para mejorar la eficiencia del programa:

- **Predicado de corte `!` en el predicado `imprimirComentarios/1`**: El predicado de corte &quot;!&quot;se trata de un predicado que devuelve _false_ en la vuelta de un recorrido _backtracking_. Esto hace que cuando se evalúa esta regla como verdadera, que no se evalúen las demás, debido a que corta la ejecución, y de este modo, hace el programa más eficiente.
- U**so de recursividad en `imprimirComentarios/1`**: se ha pensado oportuno utilizar la recursividad para la impresión de comentarios, debido a que la gestión de los comentarios se ha implementado mediante listas, y por definición, las listas son recursivas. En general definimos las listas como [Cabeza | Cola], donde Cola es una lista. Además, se ha tenido cuidado en el orden de colocar las reglas para hacer recursión, poniendo los casos base al principio (recordando que se recorre de arriba abajo). De este modo, se evita que siempre se meta al caso general y cause recursiones infinitas. Todo ello contribuye también a hacer el programa más eficiente.

<a name="17"/>

# Requisitos mínimos del sistema
A continuación se detallan los requisitos del sistema mínimos exigidos por el enunciado del problema.

En el sistema se habrán de definir:
- 2 o más constantes,
- 2 o más hechos con variables y 2 o más sin variables y
- 5 o más predicados;

y deberán verificarse las siguientes condiciones:
- al menos uno de los predicados habrá de definirse mediante 2 o más reglas,
- al menos uno de los predicados deberá tener 2 o más argumentos,
- 2 o más reglas deberán constar de 2 o más antecedentes y
- la satisfacción de 2 o más objetivos habrá de requerir el encadenamiento de 2 o más reglas.

El sistema deberá contener además:
- Al menos un ejemplo de uso de uno de los operadores aritméticos o relacionales predefinidos.
- Al menos un ejemplo de recursividad.
- Al menos un ejemplo de uso de los predicados de inserción y borrado de hechos de la Base de Hechos.


<a name="15"/>

# Código comentado en Prolog

Ver el código desarrollado en el archivo test_moral.pl.

<a name="16"/>

# Bibliografía
- Palma Méndez, J., & Marín Morales, R. (2011). _Inteligencia artificial_. Aravaca, Madrid: McGraw-Hill/Interamericana de España.
- Nosedive - Wikipedia, la enciclopedia libre. Consultado el 18 de abril del 2020, en https://es.wikipedia.org/wiki/Nosedive
- Rubio, I. Así es el sistema con el que China puntúa a sus ciudadanos y les asigna castigos y recompensas. Consultado el 18 de abril del 2020, en https://www.xataka.com/privacidad/asi-sistema-que-china-puntua-a-sus-ciudadanos-les-asigna-castigos-recompensas
