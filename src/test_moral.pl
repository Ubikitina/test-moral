%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Prueba de evaluación a distancia - Prolog
%% Asignatura: Fundamentos de la Inteligencia Artificial
%% Tema: Test de moralidad
%% Curso: 2019-2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/* HECHOS SIN VARIABLE */
deficiente(asesino).
suspenso(narcotraficante).
suficiente(camarero).
notable(profesorEtica).
sobresaliente(filosofo).

/* HECHOS CON VARIABLES DINAMICAS */
/* Predicado dinámico donde se guarda el usuario */
:- dynamic(esUsuario/1).

/* Regla mediante la cual el programa aprende que Usuario es un nombre de usuario*/
incluye(Nombre) :- Hecho = esUsuario(Nombre), asserta(Hecho). %asserta, the final a means that retracts the first matching rule. On the other hand, retractz, retracts the last matching rule.

/* Predicado dinámico donde se guarda el total de puntos acumulados. Lo inicializamos a 0 */
:- dynamic(totalPuntos/2).
totalPuntos(usuario, 0).

/* Se suman los puntos obtenidos en cada pregunta */
sumaPuntos(Usuario, PtosPregunta):- retract(totalPuntos(Usuario, PtosAntes)), PtosNuevos is PtosAntes + PtosPregunta, assert(totalPuntos(Usuario, PtosNuevos)).

/* COMENTARIOS DE LA CORRECCION DEL TEST */
/* Predicado dinámico donde se guardan los comentarios que se añaden durante la corrección del test. Se inicializa. */
:- dynamic(comentariosCorreccion/1).
comentariosCorreccion([]).

/* Se incluye el comentario generado durante la corrección del test en la lista de comentarios */
incluirComentario(Comentario) :- comentariosCorreccion(X),
    incluirComentarioSoporte(Comentario,X,Y),
    retract(comentariosCorreccion(_)), assert(comentariosCorreccion(Y)).

/* Soporte en la inclusión de comentarios a la lista, genera una nueva lista. */
incluirComentarioSoporte(Comentario,ListaVieja,[Comentario|ListaVieja]).



/* Introducción: Se trata de la pantalla principal. Es donde comienza la simulación. */
start:- borrarTerminal,
    write('###### Introducción: ¡Bienvenido al programa de recuperación de puntos! ######'),nl,nl,
    write('Si estás aquí, es que no te ha ido bien durante la monitorización a la moral del ciudadano. Pero tranquilo, no pasa nada. España es el país de las segundas oportunidades. A nosotros no nos salen las cosas bien a la primera.\n\nAprovechemos esta magnífica segunda oportunidad para recuperar la reputación y optar por la vida deseada. ¿Has entrenado tu ética y moral? ¿Estás listo?\n\nEn esta prueba realizaremos un test moral mediante el cual se puntuarán los valores que has trabajado como ciudadano, y el potencial que tienes como individuo para aportar a una sociedad ideal. ¿Eres un ciudadano con principios? ¿Crees estar a la altura? ¡Demuéstranos esa actitud!\n\nPara comenzar con el test, identifiquese:\nNombre (en minúsculas): '), nl,
    read(Nombre),
    incluye(Nombre),
    write('\nBienvenido '), esUsuario(NombreUsuario), write(NombreUsuario), write('. Espero que hayas trabajado los valores éticos y morales, porque esto comienza...\n\n'),
    write('                  hhhhhhh                                                                     !!!
                  h:::::h                                                                    !!:!!
                  h:::::h                                                                    !:::!
                  h:::::h                                                                    !:::!
  aaaaaaaaaaaaa    h::::h hhhhh          ooooooooooo   rrrrr   rrrrrrrrr     aaaaaaaaaaaaa   !:::!
  a::::::::::::a   h::::hh:::::hhh     oo:::::::::::oo r::::rrr:::::::::r    a::::::::::::a  !:::!
  aaaaaaaaa:::::a  h::::::::::::::hh  o:::::::::::::::or:::::::::::::::::r   aaaaaaaaa:::::a !:::!
           a::::a  h:::::::hhh::::::h o:::::ooooo:::::orr::::::rrrrr::::::r           a::::a !:::!
    aaaaaaa:::::a  h::::::h   h::::::ho::::o     o::::o r:::::r     r:::::r    aaaaaaa:::::a !:::!
  aa::::::::::::a  h:::::h     h:::::ho::::o     o::::o r:::::r     rrrrrrr  aa::::::::::::a !:::!
 a::::aaaa::::::a  h:::::h     h:::::ho::::o     o::::o r:::::r             a::::aaaa::::::a !!:!!
a::::a    a:::::a  h:::::h     h:::::ho::::o     o::::o r:::::r            a::::a    a:::::a  !!!
a::::a    a:::::a  h:::::h     h:::::ho:::::ooooo:::::o r:::::r            a::::a    a:::::a
a:::::aaaa::::::a  h:::::h     h:::::ho:::::::::::::::o r:::::r            a:::::aaaa::::::a  !!!
 a::::::::::aa:::a h:::::h     h:::::h oo:::::::::::oo  r:::::r             a::::::::::aa:::a!!:!!
  aaaaaaaaaa  aaaa hhhhhhh     hhhhhhh   ooooooooooo    rrrrrrr              aaaaaaaaaa  aaaa !!! \n\n'),
    detener,
    secuenciaPreguntas.



/* Hacer las preguntas */
secuenciaPreguntas:- pregunta1, detener, pregunta2, detener, pregunta3, detener, pregunta4, detener, mostrarResultado(usuario), comentariosAsignados, detener, end.


/* PRIMERA PREGUNTA: La verdad */
pregunta1:- borrarTerminal,
	write('###### PREGUNTA 1: La Verdad ######'),nl,nl,
	write('En el curso específico para la recuperación de puntos, un tema del programa es sobre la moral de la verdad. Sabes que siempre la verdad predomina, pero… Te encuentras en una escena donde ves una persecución entre una víctima y su agresor. Sabes dónde se ha escondido la víctima. El agresor te pregunta si has visto pasar a alguien corriendo. ¿Qué le respondes?\n'),nl,
        write('1) La conciencia te grita: '), esUsuario(NombreUsuario), write(NombreUsuario), write(', hay que decir siempre la verdad. Le dices que la víctima se ha escondido detrás del coche, en el callejón. Acto seguido, llamas a la policía.'),nl,
	write('2) Decides mentirle al agresor para evitar que lo encuentre. Acto seguido, llamas a la policía.'),nl,
	write('3) Te tomas la justicia en tus manos, y le dices que está detrás de tu coche. Que se acerque al maletero contigo. Aprovechas para sacar tu bate de guerra y darle una buena leche para dejarlo aturdido hasta que venga la policía.'),nl,nl,
        write('RESPUESTA ELEGIDA (1, 2 o 3): '),
	read(RespuestaSeleccionada),
        respuestaP1(RespuestaSeleccionada).

/* Segun la opcion elegida, ejecutamos las acciones correspondientes */
respuestaP1(RespuestaSeleccionada):-
    RespuestaSeleccionada == 1, resp1A;
    RespuestaSeleccionada == 2, resp1B;
    RespuestaSeleccionada == 3, resp1C.

/* Respuesta 1A */
resp1A:- write('\n¡Incorrecto! A veces, hace falta sacrificar el principio de la verdad a favor del bien común. ¿Pero cómo has fallado esta? ¡Si es de primero de verdad!\n\n'), sumaPuntos(usuario, 5).

/* Respuesta 1B*/
resp1B:- write('\n¡Correcto! Sacrificas la verdad por el bien común. ¡Bien hecho!\n\n'), sumaPuntos(usuario, 10), incluirComentario('+ En la pregunta de la VERDAD, has asimilado muy bien el equilibrio entre la verdad y el bien común. ¡Enhorabuena!').

/* Respuesta 1C*/
resp1C:- write('\nEstaría bien hecho si la pregunta fuera ¡cual es la peor decisión de todas! Céntrate, que has venido a recuperar puntos, no a perderlos\n\n'), sumaPuntos(usuario, 0), incluirComentario('- En la pregunta de la VERDAD, has optado primero por mentir, y luego por la agresión física. ¡Eres un capullo!').


/* SEGUNDA PREGUNTA: La lealtad */
pregunta2:- borrarTerminal,
    write('###### PREGUNTA 2: La Lealtad ######'),nl,nl,
    write('Perteneces a un grupo que recauda fondos para donarlos a la investigación del cáncer. Estás muy feliz con el grupo. Además, la última semana, se ha unido un integrante nuevo que parece muy prometedor: es un empresario que cuenta con grandes fortunas y trae propuestas prometedoras para poder obtener más beneficios para la donación. Su propuesta es que cada socio de la asociación ponga 100€ por su inscripción, y busque otras 10 personas que se asocien y pongan otros 100€ cada uno. Después, cada socio nuevo, deberá realizar lo mismo. De este modo, aparte de donar, ¡incluso cobráis un dinero a fin de mes! ¿Qué te parece?'),nl,nl,
    write('1) Es una idea estupenda. Encima parece que va a tener mucho futuro, porque hay 6 millones de habitantes en el mundo, podríamos reclutar todos. ¿Qué puede salir mal?'),nl,
    write('2) Es una estafa piramidal, me piro. Estáis pirados.'),nl,
    write('3) Es una estafa, y lo voy a denunciar a la agencia de consumidores. Ni un afectado por esto.'),nl,nl,
    write('RESPUESTA ELEGIDA (1, 2 o 3): '),
    read(RespuestaSeleccionada),
    respuestaP2(RespuestaSeleccionada).

/* Segun la opcion elegida, ejecutamos las acciones correspondientes */
respuestaP2(RespuestaSeleccionada):-
    RespuestaSeleccionada == 1, resp2A;
    RespuestaSeleccionada == 2, resp2B;
    RespuestaSeleccionada == 3, resp2C.

/* Respuesta 2A*/
resp2A:- write('\nEstupendo en estafador. ¿Cómo que reclutar a todos los habitantes? Anda y tira a la última pregunta, muy bien la tienes que hacer para remontar esto.\n\n'), sumaPuntos(usuario, 0), incluirComentario('- En la pregunta de la LEALTAD, has optado por estafar a todo el público interesado en una buena causa. ¡Es espantoso!').

/* Respuesta 2B*/
resp2B:- write('\n¡Incorrecto! ¿Cómo que te piras? Conociendo sus intenciones, ¿vas a dejar a estafadores sueltos?\n\n'), sumaPuntos(usuario, 5).

/* Respuesta 2C*/
resp2C:- write('\n¡Correcto! Sacrificas la lealtad con el grupo por el bien común. ¡Bien hecho!\n\n'), sumaPuntos(usuario, 10), incluirComentario('+ En la pregunta de LEALTAD, has demostrado correctamente que no hay lealtad que valga cuando se trata de actividades ilegales. ¡Felicidades!').


/* TERCERA PREGUNTA: La Honestidad */
pregunta3:- borrarTerminal,
    write('###### PREGUNTA 3: La Honestidad ######'),nl,nl,
    write('Trabajas para una empresa tecnológica, para la cual estáis buscando un desarrollador de software, y tienes que elegir el candidato entre varios que se han presentado. El calzonazos de tu hermano está cansado de escuchar al padre que no vale para nada y te ha pedido ayuda. Aunque no tenga estudios, dice que él eso de la informática en dos tardes lo tiene dominado. El jefe te ha dicho que elijas un candidato. ¿Qué eliges?'),nl,nl,
    write('1) El hermano. A pesar de ser un calzonazos y de no cumplir con los requisitos del puesto, es tu hermano. Ya fingiréis que el trabajo se ha complicado para justificar los retrasos, y ese dinero que os lleváis para casa.'),nl,
    write('2) La amiga del jefe, que pese a no ser la mejor candidata, parece que está cualificada, y a fin de cuentas, es lo que quiere el jefe.'),nl,
    write('3) El candidato estrella, que es de una familia humilde, tiene 2 carreras, 3 másteres, y ha estado trabajando en proyectos de desarrollo de las mejores multinacionales. Además, dice que destinará parte del dinero a ayudar a su familia.'),nl,nl,
    write('RESPUESTA ELEGIDA (1, 2 o 3): '),
    read(RespuestaSeleccionada),
    respuestaP3(RespuestaSeleccionada).

/* Segun la opcion elegida, ejecutamos las acciones correspondientes */
respuestaP3(RespuestaSeleccionada):-
    RespuestaSeleccionada == 1, resp3A;
    RespuestaSeleccionada == 2, resp3B;
    RespuestaSeleccionada == 3, resp3C.

/* Respueta 3A*/
resp3A:- write('\nEso es, y una vez estéis los dos dentro, ya os montaréis la manera de sacar dinero en B sin que se entere el jefe.\n\n'), sumaPuntos(usuario, 0), incluirComentario('- En la pregunta de la HONESTIDAD, has elegido la opción más injusta de todas: meter al hermano no cualificado y encima intentar timar al jefe. ¡Una actitud penosa ante el trabajo!').

/* Respuesta 3B*/
resp3B:- write('\n¡Incorrecto! No era mala candidata, pero, siendo honestos, no es justo elegirla a ella teniendo otro cerebrito con necesidad de trabajo entre los candidatos.\n\n'), sumaPuntos(usuario, 5).

/* Respuesta 3C*/
resp3C:- write('\n¡Correcto! Tanto el candidato estrella como la empresa te lo van a agradecer infinitamente, una decisión honesta.\n\n'), sumaPuntos(usuario, 10), incluirComentario('+ En la pregunta de la HONESTIDAD, has sido justo con tus principios, y has sabido decir que no a compromisos (familia/jefe) inmorales. ¡Bien hecho!').

/* CUARTA PREGUNTA: La Solidaridad */
pregunta4:- borrarTerminal,
    write('###### PREGUNTA 4: La Solidaridad ######'),nl,nl,
    write('Vais a cenar cuatro amigos. Habéis pedido croquetas, a esto que os sacan una ración de 6 croquetas para 4. Cada uno ataca a una, lo cual quedan 2 croquetas restantes en el plato. Tienes hambre, y ¡están cojonudas! ¿Qué haces?'),nl,nl,
    write('1) Aquí quien no corre, ¡vuela! Me pillo otra, y si me da tiempo, la última también.'),nl,
    write('2) Las parto por la mitad, haciendo así 4 mitades, uno para cada.'),nl,
    write('3) Pregunto si alguien quiere, y como algunos me han respondido que no, cojo uno más. El no seguramente ha sido por cortesía, pero me da igual, yo ya he preguntado.'),nl,nl,
    write('RESPUESTA ELEGIDA (1, 2 o 3): '),
    read(RespuestaSeleccionada),
    respuestaP4(RespuestaSeleccionada).

/* Segun la opcion elegida, ejecutamos las acciones correspondientes */
respuestaP4(RespuestaSeleccionada):-
    RespuestaSeleccionada == 1, resp4A;
    RespuestaSeleccionada == 2, resp4B;
    RespuestaSeleccionada == 3, resp4C.

/* Respueta 4A*/
resp4A:- write('\nAsí me gusta, que no pase hambre esa tripa. (PD. Tus amigos te odian.)\n\n'), sumaPuntos(usuario, 0), incluirComentario('- En la pregunta de la SOLIDARIDAD, has demostrado que eres un ser individualista, y que no te preocupas ¡ni por tus propios amigos! ¡Increíble!').

/* Respuesta 4B*/
resp4B:- write('\n¡Correcto! Es un placer ir a cenar contigo.\n\n'), sumaPuntos(usuario, 10), incluirComentario('+ En la pregunta de la SOLIDARIDAD, has demostrado que sabes cuidar de los tuyos, compartiendo la comida. ¡Excelente!').

/* Respuesta 4C*/
resp4C:- write('\n¡Incorrecto! Lo has preguntado para sentirte bien contigo mismo y comértelo tú. ¡Admitelo!\n\n'), sumaPuntos(usuario, 5).



/* Mostrar la puntuacion del usuario */
mostrarResultado(Usuario):- totalPuntos(Usuario, Puntos), asignarResultado(Puntos).

/* Se asigna el resultado final en base a la puntuación obtenida */
asignarResultado(Puntos):- borrarTerminal,
    write('###### RESULTADO ######\n'),nl,
    write('Los puntos obtenidos son: '), write(Puntos),nl,nl,
    write('Ha llegado la hora de la verdad. ¿Estás listo para saber lo que te depara?\n\n'),detener,nl,
    ((Puntos = 0) -> write('¡MUY DEFICIENTE! Eres un verdadero canalla. El programa de recuperación de puntos no ha servido de nada. Acabamos de enviar a una furgoneta del centro penitenciaro para que te esperen a tu salida, eres un peligro para la sociedad.\n\nEl sistema te sugiere una profesión para tu nueva vida: '), deficiente(X), write(X),nl,nl);
    ((Puntos > 0, Puntos =< 15) -> write('¡SUSPENSO! Aunque lo intentes evitar, tu faceta canalla sale a relucir muchas veces. No podemos darte por rehabilitado. Sin embargo, te hemos reservado plaza en el mejor centro de rehabilitación, en el cual, en dos semanas te dan la oportunidad de repetir el test. No dejes perder esta oportunidad.\n\nEl sistema te sugiere una profesión para tu nueva vida: '), suspenso(X), write(X),nl,nl);
    ((Puntos > 15, Puntos =< 25) -> write('¡SUFICIENTE! Lo que se dice un aprobado raspado. Todavía no tienes del todo claro cual es el buen camino y cual es el malo, pero en la mayoría de las veces no vas mal encaminado. ¡Sigue así! Te hemos puesto monitorización mediante tu smartphone para seguir tus pasos de cerca. Esperamos que en un par de meses hayas progresado y te podamos liberar del seguimiento.\n\nEl sistema te sugiere una profesión para tu nueva vida: '), suficiente(X), write(X),nl,nl);
    ((Puntos > 25, Puntos < 40) -> write('¡NOTABLE! Felicidades. Has pasado de estar al borde de perder todos los puntos, a obtener un notable. Se nota que has progresado mucho y te has esforzado. Como premio, te regalamos la oportunidad de vivir en el barrio "Gente de bien" tan deseado por todos los ciudadanos.\n\nEl sistema te sugiere una profesión para tu nueva vida: '), notable(X), write(X),nl,nl);
    ((Puntos = 40) -> write('¡SOBRESALIENTE! Has tenido un progreso ¡increible! ¡Enhorabuena! Quédate un rato más que te vamos a regalar este chalet con piscina en el barrio "Gente de bien".\n\nEl sistema te sugiere una profesión para tu nueva vida: '),sobresaliente(X), write(X),nl,nl).



/* Mostrar los comentarios generados durante la corrección del test. */
comentariosAsignados :- write('Veamos si durante la corrección del test, se han generado comentarios para ti:\n'),
    comentariosCorreccion(Comentarios), imprimirComentarios(Comentarios), nl.

/* Imprimir los comentarios guardados en la lista */
imprimirComentarios([]):- write("No hay ningún comentario."), !.
imprimirComentarios([Cabeza|[]]):- write(Cabeza), nl, !.
imprimirComentarios([Cabeza|Cola]):- imprimirComentarios(Cola), write(Cabeza), nl.



end:- borrarTerminal,
    write('###### FIN: ¡Gracias por participar, y disfrute de su nueva vida! ######\n'),
    write('
                              dddddddd
                              d::::::d  iiii                                     !!!
                              d::::::d i::::i                                   !!:!!
                              d::::::d  iiii                                    !:::!
                              d:::::d                                           !:::!
  aaaaaaaaaaaaa       ddddddddd:::::d iiiiiii    ooooooooooo       ssssssssss   !:::!
  a::::::::::::a    dd::::::::::::::d i:::::i  oo:::::::::::oo   ss::::::::::s  !:::!
  aaaaaaaaa:::::a  d::::::::::::::::d  i::::i o:::::::::::::::oss:::::::::::::s !:::!
           a::::a d:::::::ddddd:::::d  i::::i o:::::ooooo:::::os::::::ssss:::::s!:::!
    aaaaaaa:::::a d::::::d    d:::::d  i::::i o::::o     o::::o s:::::s  ssssss !:::!
  aa::::::::::::a d:::::d     d:::::d  i::::i o::::o     o::::o   s::::::s      !:::!
 a::::aaaa::::::a d:::::d     d:::::d  i::::i o::::o     o::::o      s::::::s   !!:!!
a::::a    a:::::a d:::::d     d:::::d  i::::i o::::o     o::::ossssss   s:::::s  !!!
a::::a    a:::::a d::::::ddddd::::::ddi::::::io:::::ooooo:::::os:::::ssss::::::s
a:::::aaaa::::::a  d:::::::::::::::::di::::::io:::::::::::::::os::::::::::::::s  !!!
 a::::::::::aa:::a  d:::::::::ddd::::di::::::i oo:::::::::::oo  s:::::::::::ss  !!:!!
  aaaaaaaaaa  aaaa   ddddddddd   dddddiiiiiiii   ooooooooooo     sssssssssss     !!!
                                                                                     ').


/* Predicado para borrar el terminal */
borrarTerminal:- write('\033[2J').

/* Detiene la aplicacion hasta pulsar Intro */
detener:- write('### Presiona "Intro" para continuar ###'),
          skip(10), skip(10).
