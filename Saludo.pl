:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).

% Declare a handler, binding an HTTP path to a predicate.
% Here our path is / (the root) and the goal well query will be
% say_hi. The third argument is for options
:- http_handler('/', index_html, []).

% The predicate server(+Port) starts the server. It simply creates a
% number of Prolog threads and then returns to the toplevel, so you can
% (re-)load code, debug, etc.

server(Port) :-
    http_server(http_dispatch, [port(Port)]).

index_html(_Request) :-
	phrase(
	    html([
			head(title('Saludo')),
		    body([
				h1(style="color:blue; text-align: center",'Saludo Inicial'),
                p('¡Hola Mundo!.')
            ])
		]),
	TokenizedHtml,
	[]),
	format('Content-type: text/html~n~n'),
	print_html(TokenizedHtml).