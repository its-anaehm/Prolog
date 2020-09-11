:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).

% Declare a handler, binding an HTTP path to a predicate.
% Here our path is / (the root) and the goal well query will be
% index_html. The third argument is for options
:- http_handler('/', index_html, []).

% The predicate server(+Port) starts the server. It simply creates a
% number of Prolog threads and then returns to the toplevel, so you can
% (re-)load code, debug, etc.
server(Port) :-
    http_server(http_dispatch, [port(Port)]).

index_html(_Request) :-
	phrase(
	    html([
			head(title('SWI-Prolog para la Web')),
		    body(style="font-family: Arial; background-color:#B7FBF6", [
				h1(style="color:blue; text-align: center",'Aplicaciones Web utilizando Prolog y SWI-Prolog'),
                p(style="color:gray; text-align: center", '---------------------------------------------------------------------------------------------------------------'),
				h4(style="text-align: center; font-weight: bold", 'UNIVERSIDAD NACIONAL AUTÓNOMA DE HONDURAS'),
                center(img(src="https://fotos.subefotos.com/5fc71eea560e891e5955c978841605a8o.png")),
                p(style="text-align: center; font-weight: bold", 'FACULTAD DE INGENIERÍA'),
                p(style="text-align: center; font-weight: bold", 'Depto. de INGENIERÍA EN SISTEMAS'),
                p(style="text-align: center; font-weight: bold", 'Ana Evelin Hernández Martínez'),
                p(style="text-align: center", 'aehernandezm@unah.hn'),
                p(style="text-align: center", '20171001620'),
                p(style="text-align: center; font-weight: bold", ' Lenguajes de Programación IS-513'),
                p(style="text-align: center; font-weight: bold", 'Catedrático: José Manuel Inestroza Murillo'),
                p(style="text-align: center", 'II PAC 2020'),
                p(style="text-align: center", '---------------------------------------------------------------------------------------------------------------'),
                h4(style="color:green; font-weight: bold; text-align: center", 'INTRODUCCIÓN A PROLOG'),
                p('Prolog (o PROLOG), proviene del francés PROgrammation en LOGique es un lenguaje de Programación lógico e interpretado usando habitualmente en el campo de la Inteligencia Artificial (IA).'),
                p('Se trata de un lenguaje de programación ideado a principios de los años 70 en la Universidad de Marsella, Francia por Alain Colmerauer y Philippe Roussel. Nació de un proyecto que no tenía como objetivo la traducción de un lenguaje de programación, sino el tratamiento algorítmico de lenguajes naturales.'),
                p('Los programas en Prolog se componen de cláusulas de Horn que constituyen reglas de tipo "modus ponendo ponens", es decir, "Si es verdad el antecedente, entonces es verdad el consecuente".'),

                p(style="text-align: center", '---------------------------------------------------------------------------------------------------------------'),
                h4(style="color:green; font-weight: bold; text-align: center", 'PROGRAMACIÓN EN PROLOG'),

                p('Para entender un poco la programación de Prolog antes de comenzar a detallar programas, debemos tener en consideración que se deben explicar varios conceptos a través de los cuales nos movemos a lo largo de toda la sintaxis de los programas en Prolog.'),

                h4(style="color:orange; text-decoration:underline", '1. Objetos y Relaciones'),
                p('Los objetos y las relaciones son similares a los que se manejan en la base de datos en los cuales existen objetos, entidades y relaciones, como por ejemplo "Zeus es un perro." Para lo cual estamos hablando de objetos el cual sería "Zeus", la relación sería "es un".'),

                h4(style="color:orange; text-decoration:underline", '2. Hechos'),
                p('Los hechos se refieren a las afirmaciones de los respectivos objetos con su relación; retomando el ejemplo de "Zeus es un perro." el hecho sería "perro".'),
                p('En sintaxis de Prolog esto se vería de la siguiente manera:'),
                p(b('perro(Zeus).')),

                h4(style="color:orange; text-decoration:underline", '3. Reglas'),
                p('Las reglas se forman básicamente a través de las cláusulas de Horn donde existe una cabeza y un cuerpo (esto es lo que conforma una regla). Por ejemplo la sentencia:'),
                p(b('es_par(X):- 0 is X mod 2.')),
                p('En la cual "es_par(X)" es el cuerpo y "0 is X mod 2." es el cuerpo, con este ejemplo lo que se quiere validar es que un número es considerado par si cero es el resultado de ese número módulo dos. Eso sería determinar una regla para cualquier número X.'),

                h4(style="color:orange; text-decoration:underline", '4. Preguntas'),
                p('Al ser Prolog un lenguaje lógico lo que nos puede dar como resultado son respuestas verdaderas y falsas. Sin embargo también nos puede proveer de información a través de variables. Dando un ejemplo siempre utilizando el ejemplo de "Zeus es un perro." en sintaxis de Prolog una pregunta sería de la siguiente forma:'),
                p(b('?- perro(Zeus)')),
                p('De lo cual tendríamos una respuesta verdadera dado que anteriormente declaramos el hecho de que Zeus como un perro.'),

                p(style="text-align: center", '---------------------------------------------------------------------------------------------------------------'),
                h4(style="color:green; font-weight: bold; text-align: center", 'PROLOG PARA LA WEB'),
                p('Es conveniente utilizar Prolog en la creación de aplicaciones web debido a que los programas realizados a través de este lenguaje son más pequeños por el hecho de que Prolog elimina el uso de algunas estructuras de control de flujo que funcionan como iteradores. Esto resulta ser muy bueno porque fomenta el código bien escrito y esto es más fácil de mantener y refactorizar.'),
                p('Prolog muchas veces funciona como un lenguaje puente porque puede recurrir a otros lenguajes para resolver algunos problemas. Así pues de esta manera se programan partes de los programas en algún lenguaje que sea más común dentro del conocimiento del programador, (como en este caso podría ser HTML, PHP, etc.) y se utiliza el programa lógico para reconocer algunas tareas.'),
                p('Como por ejemplo, con un lenguaje como Prolog se pueden construir sistemas expertos o basados en conocimiento; listando algunos podríamos tener:'),
                ul('- Problemas técnicos de vehículos'),
                ul('- Algoritmos de procesamiento de filtros de correo electrónico'),
                ul('- Procesamiento de lenguaje Natural'),
                ul('- Crear Sudokus'),
                p(style="font-style: italic", 'Entre algunos sitios que utilizan Prolog en la web estarían:'),
                ol('- Huge Stock Trading System'), 
                ol('- Map Based Site'), 
                ol('- Online Control Panel For SPARQL Server'), 
                ol('- Econommerce Site'),
                ol('- Similarity Analytics For Big Data'),
                ol('- UI For Installer'),
                ol('- Dynamicly Generated Web Site With Wiki'),
                ol('- Blogging Software'),
                ol('- Virtual World Support Website'),
                center(img(src="https://fotos.subefotos.com/c506a5df76204059a2f2ee43abf8cb25o.png")),
                
                center(p('Imagen de la página principal de Simularity')),

                p(style="text-align: center", '---------------------------------------------------------------------------------------------------------------'),
                h4(style="color:green; font-weight: bold; text-align: center", 'FLUJO GENERAL DE IMPLEMENTACIÓN DE WEB CON PROLOG'),
                p('Lo principal que hay que tener en cuenta para comprender el flujo de Prolog en estos programas es el flujo de las solicitudes.'),
                p('Las solicitudes llegan a un socket (un método para la comunicación entre un programa del cliente y un programa del servidor en una red) http_dispatch y este se encarga de establecer un punto final de conección a través de sub procesos que decodifican el camino hasta encontrar una ruta coincidente. Luego con la información solicitada lo que hace es tomarla y formar un objeto (este objeto suele ser elementos como los encabezados, una lista de opciones, la dirección IP, etc.).'),
                p('Posteriormente, pasa el objeto de solicitud a través del filtro http_request_expansion instalado, que puede mutar o generar una excepción.'),
                p('Luego, llama al predicado del controlador proporcionado por el programador de la aplicación con Solicitud como parámetro adicional. Se espera que el predicado se escriba en la página que incluye el encabezado current_output. Esto se interpretará como un documento CGI.'),
                p('Lo importante es que es un documento CGI, no sólo los bytes sin procesar del socket, porque hay algunas instrucciones CGI, especialmente una instrucción que puede establecer el estado de esta manera.'),
                p('En el caso de HTML, la manera de generar una página web es a través de "reply_html_page"'),
                p('Al momento en que el programador desee generar el contenido de la página web debe agregar un DCG que define lo que irá dentro de lo que normalmente estaría dentro de las etiquetas <head></head> y otro DCG que define el contenido que iría dentro de las etiquetas <body></body> en un archivo HTML tradicional. Esto es reconocido como un HTML Tokenizado.'),
                p('Como lo es en el caso de este archivo, la programadora no se limitó a generar el material HTML directamente, sino que se encargó de hacer un llamado a DCG, el cual provee un término Prolog que define HTML en base a una estructura anidada. Una vez que se emite por completo el HTML tokenizado este debe pasar por una serie de etapas de salida "print_html" que como resultado final genera un documento CGI interpretado por el sistema (Véase el código de este archivo).'),

                p(style="text-align: center", '---------------------------------------------------------------------------------------------------------------'),
                h4(style="color:green; font-weight: bold; text-align: center", 'MANEJADORES(HANDLERS) EN PROLOG'),
                p('Los controladores para ejecutar las aplicaciones web creadas en SWI-Prolog pueden ser ejecutadas de distintas maneras. Una de esas maneras es a través de la ejecución en nuestro propio servidor web.'),
                p('Los módulos necesarios para nuestro servidor web serían:'),
                p(b(':- use_module(library(http/thread_httpd)).')),
                p(b(':- use_module(library(http/http_dispatch)).')),
                p('Y el bucle principal para que se pueda ejecutar el servidor sería:'),
                pre(
                    code('server(Port) :-
    http_server(http_dispatch, [port(Port)]).')
                ),
                p('Una vez que ya tenemos estos elementos listos podemos llamar a nuestro servidor "server(8000)." para iniciar el servidor en el puerto 8000.'),
                p('Las aplicaciones que se crean a través de SWI-Prolog son una colección de controladores.'),
                p('El único controlador que se encarga de manejar la ruta de la raíz es:'),
                pre(
                    code(':- http_handler (/, index_html, []).')
                ),
                p('Lo que hace esta declaración es manejar la raíz consultando al elemento "index_html", el primer argumento que toma es "/" que se reconoce como el átomo que simboliza la raíz del URL.'),
                h4(style="color:orange", 'Regla del Controlador Real'),
                p('Cuando se llama a la regla del controlador real, el flujo de ingreso actual es dirigido para poder leer el HTTPRequest, y la salida que brinda este flujo es redirigida al socket; lo que prosigue a esto es imprimir la el resultado.'),
                p('Para programar esto debemos escribir el contenido requerido: '),
                pre(
                    code('index_html(_Request) :-
    format(''Content-type: text/plain~n~n'')
    format(''Hello World!'')''.    %Por poner un ejemplo ya que no es la forma de introducir contenido.')),

                p(style="text-align: center", '---------------------------------------------------------------------------------------------------------------'),
                h4(style="color:green; font-weight: bold; text-align: center", 'PRIMEROS PASOS PARA CREAR UN PROGRAMA WEB CON PROLOG'),
                p('Lo primero que debemos considerar a la hora de comenzar a crear nuestras aplicaciones web utilizando SWI-Prolog es colocar los controladores para que se encargan de la ejecución del código (que ya fueron detallados anteriormente en la sección de "Manejadores").'),
                p('También se debe hacer uso de el bucle que permite ejecutar el servidor.'),
                p('Y posteriormente del controlador encargado de manejar la ruta de la raíz.'),
                p('Para generar el flujo de ingreso a través de un HTML termerizado se puede realizar de la siguiente manera:'),
                pre(
                    code('index_html(Request):-
    phrase(
        ''html([
        ''head(title(''Encabezado web'')''
        ''body([''Contenido de la página web''])')
                ),
                p('Dentro de una terminal debemos ingresar el comando:'),
                p(b('swipl <nombre_del_archivo>.pl')),
                p('Esta acción nos permite acceder al entorno completo de Prolog y en específico a su intérprete.'),
                p('Lugo escribir en la línea de comando:'),
                p(b('?- server(8000).')),
                p('Para poder iniciar el servidor en el puerto 8000, esto nos brindara una ruta de acceso la cual al ingresar al navegar nos permitirá visualizar el contenido de nuestro programa con extensión ".pl".'),
                p('Así es como podremos visualizar en la web el programa que se ha realizado. Y si realizamos cambios a través de un editor de texto con la instrucción:'),
                p(b('?- make.')),
                p('Y refrescando la página web podremos visualizar los mismos.'),
                p('Una vez que ya hayamos culminado de visualizar y editar nuestro programa debemos cerrar nuestro intérprete,  para eso ingresamos la instrucción:'),
                p(b('?- halt.')),
                p('Que nos permitirá salir del intérprete de SWI-Prolog.'),

                p(style="text-align: center", '---------------------------------------------------------------------------------------------------------------'),
                h4(style="color:green; font-weight: bold; text-align: center", 'FORMAS DE PROLOG PARA CREAR HTML COMO PROGRAMA PARA LA WEB'),
                h4(style="color:orange; text-decoration:underline", '1. Impresión directa de HTML'),
                p('Se puede servir HTML imprimiendo:'),
                pre(
                    code(style="font-style: italic", 'index_html(_Request):-
    format(''Content-type: text/html~n~n''),
    format(''<html><head><title>Encabezado</title></head><body><h2>Encabezado</h2><p>Algo de texto.</p></body></html>~n'').')
                ),
                p('No es la mejor alternativa, pero es posible imprimir utilizando las etiquetas nativas de HTML a través de  Prolog.'), 
                h4(style="color:orange; text-decoration:underline", '2. Usando print_html'),
                p('Esta no es la mejor forma tampoco para imprimir el contenido de nuestro programa pero se aproxima un poco más a la idea de un HTML tokenizado y en un proceso de aprendizaje es bueno poder tantear otras alternativas posibles para poder cumplir con el objetivo primordial de nuestro programa que en la mayoría de los casos es que sea funcional.'),
                p('Lo que hace "print_html" es que convierte una lista de elementos HTML en una cadena que contiene HTML (también pude concatenarlo).'),
                pre(
                    code(style="font-style: italic", 'index_html(_Request):-
    format(''Content-type: text/html''),
    print_html(
    [''<html>'',
    ''<head>'',
    ''<title>'',
    ''Encabezado'',
    ''</title>'',
    ''</head>'',
    ''<body>'',
    ''<h2>'',
    ''Encabezado para la página'',
    ''</h2>'',
    ''<p>'',
    ''Algo de contenido.'',
    ''</p>'',
    ''</body>'',
    ''</html>'']).')
                ),
                h4(style="color:orange; text-decoration:underline", '3. Representando HTML'),
                p('SWI-Prolog posee 3 representaciones para HTML:'),
                ul('Átomo HTML: un átomo o una cadena con HTML.'),
                ul('HTML Tokenizado: Lo que se ha visto en la mayoría de este archivo.'),
                ul('HTML Termerizado: Genera algo que se podría decir que es HTML razonable.'),
                h4(style="color:orange", '4. HTML Termerizado'),
                p('En esta forma se anidan las estructuras dentro de cuadros definidos por las áreas de la página. Contiene elementos HTML pero no es idéntico.'),
                p('Prolog nos provee de las listas DCG (Definite  Clause  Grammar) para incorporar el código como si fuese HTML.'),
                pre(
                    code(style="font-style: italic", 'phrase(
    html(
        [head(title(''Aquí va un título'')),
        body([h1(''Encabezado''),
            p(''Algo de texto.'')])
            ]),
        TokenizedHtml,
        []),')
                ),
                h4(style="color:orange; text-decoration:underline", '5. Demostrando que es un verdadero DSL'),
                p('Un HTML termerizado se refiere a un DSL (Domain  Specific  Language) que contiene código HTML reconocible.'),
                pre(
                    code(style="font-style: italic", 'index_html(_Request): -
    phrase(
        my_nonterm,
        TokenizedHtml,
        []),
        format (''content type: texto/html ''),
    print_html (TokenizedHtml).

my_nonterm ->
    html ([html ([head ([title (''Aquí va un título'')]),
        body ([h1 (''Encabezado''),
        p (''Algo de Texto.'')])])]).')
                ),
                h4(style="color:orange; text-decoration:underline", '6. reply_html_page'),
                p('Para esta forma el generar división entre las áreas de cabeza y cuerpo es más de lo que se necesita. Por eso es que SWI-Prolog nos proporciona una forma de crear aplicaciones web en la que contamos con un entorno más agradable que como objetivo principal tiene el de procesar entre otros varios.'),
                p('Esta forma también hace uso de un HTML termerizado para incluir las etiquetas necesarias dentro del código.'),
                pre(
                    code(style="font-style: italic", 'index_html(_Request): -
    reply_html_page (
        [title (''Aquí va un título'')],
        [h1 (''Encabezado''),
        p (''Algo de Texto.'')]).')
                ),
                h4(style="color:orange; text-decoration:underline", '7. Sintaxis HTML Termerizada'),
                p(style="font-style: italic", 'NOTA: HTML termerizado utiliza un término arity 1 o 2 para cada etiqueta HTML.'),
                p('Los argumentos de los arity son innerHTML y atributos o solamente innerHTML.'),
                pre(
                    code(style="font-style: italic", 'say_hi (_Request): -
    reply_html_page (
        [title (''Aquí va un título'')],
        [ h1 (''Encabezado''),% arity 1
        p (class = bodytext, ''With some text''),% arity 2
        p ([class = bodytext, style = ''font-size: 120%''], [''Hola'', b (''Mundo.'')]'')
        ]).')
                ),
                
                p(style="text-align: center", '---------------------------------------------------------------------------------------------------------------'),
                h4(style="color:green; font-weight: bold; text-align: center", 'IMPLEMENTANDO UN "¡Hola Mundo!" UTILIZANDO FORMAS DE PROLOG PARA CREAR HTML '),
                p('Los pasos para implementar un "¡Hola Mundo!." utilizando las formas antes vistas con las que podemos generar  HTML a través de Prolog serían: '),
                ul('1.- Abrir nuestro editor de texto y crear un archivo con extensión ".pl".'),
                ul('2.- Inicializar el intérprete de SWI-Prolog.'),
                ul('3.- Acceder al servidor.'),
                ul('4.- Crear nuestro Programa realizando los llamados a los controladores necesarios para la ejecución y la raíz del programa.'),
                ul('5.- Implementar cualquiera de los códigos que se presentan a continuación:'),
                h4(style="color:gray; text-decoration:underline", '1. Impresión directa de HTML'),
                pre(
                    code(style="color:red", 'index_html(_Request):-
    format(''Content-type: text/html~n~n''),
    format(''<html><head><title>Saludo</title></head><body><h2>Saludo Inicial</h2><p>¡Hola Mundo!.</p></body></html>~n'').')),
                h4(style="color:gray; text-decoration:underline", '2. Usando print_html'),
                pre(
                    code(style="color:red", 'index_html(_Request):-
    format(''Content-type: text/html''),
    print_html(
    [''<html>'',
    ''<head>'',
    ''<title>'',
    ''Saludo'',
    ''</title>'',
    ''</head>'',
    ''<body>'',
    ''<h2>'',
    ''Saludo Inicial'',
    ''</h2>'',
    ''<p>'',
    ''¡Hola Mundo!.'',
    ''</p>'',
    ''</body>'',
    ''</html>'']).')
                ),
                h4(style="color:gray; text-decoration:underline", '4. HTML Termerizado'),
                pre(
                    code(style="color:red", 'phrase(
    html(
        [head(title(''Saludo'')),
        body([h1(''Saludo Inicial''),
            p(''¡Hola Mundo!.'')])
            ]),
        TokenizedHtml,
        []),')
                ),
                h4(style="color:gray; text-decoration:underline", '5. Demostrando que es un verdadero DSL'),
                pre(
                    code(style="color:red", 'index_html(_Request): -
    phrase(
        my_nonterm,
        TokenizedHtml,
        []),
        format (''content type: texto/html ''),
    print_html (TokenizedHtml).

my_nonterm ->
    html ([html ([head ([title (''Saludo'')]),
        body ([h1 (''Saludo Inicial''),
        p (''¡Hola Mundo!.'')])])]).')
                ),
                h4(style="color:gray; text-decoration:underline", '6. reply_html_page'),
                pre(
                    code(style="color:red", 'index_html(_Request): -
    reply_html_page (
        [title (''Saludo'')],
        [h1 (''Saludo Inicial''),
        p (''¡Hola Mundo!.'')]).')
                ),
                h4(style="color:gray; text-decoration:underline", '7. Sintaxis HTML Termerizada'),
                pre(
                    code(style="color:red", 'index_html (_Request): -
    reply_html_page (
        [title (''Saludo'')],
        [ h1 (''Una página web simple''),% arity 1
        p (class = bodytext, ''With some text''),% arity 2
        p ([class = bodytext, style = ''font-size: 120%''], [''Saludo Inicial '', b (''¡Hola Mundo!.'')]'')
        ]).')
                ),
                ul('6.- Actualizar nuestro código con el servidor.'),
                ul('7.- acceder a la página del navegador donde se está ejecutando nuestro programa y visualizar los resultados.'),
                p('Un ejemplo de como debe ser el resultado final lo podemos contemplar a continuación donde claramente mostramos un mensaje de saludo implementando la forma número 4 (HTML Termerizado) para poder crear nuestro código e ingresando los comandos requeridos en consola.'),
                center(img(src="https://fotos.subefotos.com/679c95e66645d2e438a30b3ed7194793o.png")),
                p(style="text-align: center", '---------------------------------------------------------------------------------------------------------------'),
                h4(style="color:green; font-weight: bold; text-align: center", 'GENERACIÓN DE FORMULARIOS "POST"'),
                p('POST es necesario cuando se necesitan enviar grandes cantidades de información a través de formularios.'),
                p('En el ejemplo que podemos visualizar a continuación nos damos cuenta cómo es posible realizar la lectura de datos a través de un formulario con el método POST. Para este caso en específico lo que se está solicitando es generar los espacios específicos para recibir datos numéricos y de texto:'),
                pre(
                    code(':- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).

:- use_module(library(http/http_client)).
:- http_handler(''/'', index_html, []).

server(Port) :-
        http_server(http_dispatch, [port(Port)]).

index_html(_Request) :-
	reply_html_page(
        title(''POST demo''),
        [
            form([action=''/landing'', method=''POST''], [
                p([], [
                    label([for=text],''text:''),
                    input([text=text, type=textarea])
                ]),
                p([], [
                    label([number],''number:''),
                    input([text=number, type=textarea])
                ]),
		    p([], input([text=submit, type=submit, value=''Submit''], []))
        ])]).')
                ),
                p(style="text-align: center", '---------------------------------------------------------------------------------------------------------------'),
                h4(style="color:green; font-weight: bold; text-align: center", 'RECIBIR PETICIONES "POST"'),
                p(style="font-style: italic", 'NOTA: Si se está manejando una solicitud POST, se deberá agregar "form_data".'),
                p('A continuación lo que podemos apreciar es el código que procesa y a su vez imprime el código del formulario que se creó arriba sobre los campos numéricos y de texto.'),
                pre(
                    code('landing_pad(Request) :-
        member(method(post), Request), !,
        http_read_data(Request, Data, []),
        format(''Content-type: text/html~n~n'', []),
	format(''<p>'', []),
        portray_clause(Data),
	format(''</p><p>========~n'', []),
        portray_clause(Request),
	format(''</p>'').')
                ),
                p(style="text-align: center", '---------------------------------------------------------------------------------------------------------------'),
                h4(style="color:green; font-weight: bold; text-align: center", 'CONCLUSIONES'),
                p('1.- Prolog como lenguaje de programación que nos permite crear contenido para la web nos brinda muchas formas para poder desarrollar esta acción, unas más eficientes que otras pero que le brindan al programador una gama de selección en la que él mismo posiblemente tienda a seleccionar una con la que se sienta más cómodo a la hora de generar su código.'),
                p('2.- Prolog al ser un lenguaje de programación lógico influye en el programador para poder desarrollar un código más declarativos y sobre todo teniendo en cuenta que gracias a este lenguaje poseemos una gran facilidad de programar creando códigos con pocos errores.'),
                p('3.- Dentro de los primeros pasos para comenzar a generar código en Prolog orientado al desarrollo de aplicaciones, es mejor comenzar trabajando con la inserción de HTML puro dentro de los componentes de Prolog ya que así no sentirá el cambio tan significativo que normalmente sentiría si se comenzase a trabajar con HTML tokenizado desde el comienzo.'),
                p('4.- SWI-Prolog gracias a su intérprete nos brinda un entorno confortable para realizar las validaciones de nuestro código en forma de solicitudes que se encargan de establecer conexiones entre los puntos de inicio y fin a través de procesos de decodificación.'),
                p('5.- Podemos observar que las aplicaciones web que se crean en Prolog tienden a ser dinámicas gracias a la implementación del HTML tokenizado que es más formal ya que se realiza de forma en que se definan átomos para los elementos de la cabeza y el cuerpo de la página web.'),
                p(style="text-align: center", '---------------------------------------------------------------------------------------------------------------'),
                h4(style="color:green; font-weight: bold; text-align: center", 'REFERENCIAS BIBLIOGRÁFICAS'),
                p('[1]A. Ogborn, "Tutorial — Creating Web Applications in SWI-Prolog", Pathwayslms.com, 2020. [Online]. Available: http://www.pathwayslms.com/swipltuts/html/index.html#_handling_post_requests. [Accessed: 07- Aug- 2020].'),
                p('[2]"Anniepoo/swiplwebtut", GitHub, 2020. [Online]. Available: https://github.com/Anniepoo/swiplwebtut. [Accessed: 07- Aug- 2020].'),
                p('[3]"SWI-Prolog", Swi-prolog.org, 2020. [Online]. Available:https://www.swi-prolog.org/ [Accessed: 08- Aug- 2020].'),
                p(style="text-align: center", '---------------------------------------------------------------------------------------------------------------'),
                p('')
            ])
		]),
	TokenizedHtml,
	[]),
	format('Content-type: text/html~n~n'),
	print_html(TokenizedHtml).