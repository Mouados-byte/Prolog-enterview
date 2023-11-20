:- use_module(library(csv)).

:- dynamic question/2.
:- dynamic response/2.
:- dynamic get_all_responses/2.

% Prédicat pour charger les questions à partir d un fichier CSV
load_questions(CheminFichier) :-
    csv_read_file(CheminFichier, Lignes, [functor(question), arity(3)]),
    maplist(assert_question, Lignes),
    findall(Question, question(_, Question), Questions),

% Prédicat pour affirmer chaque question
assert_question(Ligne) :-
    assertz(question(Ligne)).

% Prédicat pour charger les questions à partir d un fichier CSV
load_responses(CheminFichier) :-
    csv_read_file(CheminFichier, Lignes, [functor(response), arity(5)]),
    maplist(assert_response, Lignes),
    findall(Response, response(_, Response), Responses),

% Prédicat pour affirmer chaque response
assert_response(Ligne) :-
    assertz(response(Ligne)).

get_question_string(QuestionID, QuestionString) :-
    question(QuestionID, QuestionString, _).

