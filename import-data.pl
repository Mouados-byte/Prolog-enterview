:- use_module(library(csv)).

% Prédicat pour charger les questions à partir d'un fichier CSV
load_questions(CheminFichier) :-
    csv_read_file(CheminFichier, Lignes, []),
    maplist(assert_question, Lignes).

% Prédicat pour affirmer chaque question

% Ce prédicat "assert_question" permet d'ajouter une question à la base de connaissances.
% Il prend en entrée une ligne de données et l'insère dans la base de connaissances sous la forme d'un prédicat "question".
assert_question(Ligne) :-
    Ligne =.. [ligne|Donnees],
    assertz(question(Donnees)).

% Prédicat pour charger les réponses à partir d'un fichier CSV
load_responses(CheminFichier) :-
    csv_read_file(CheminFichier, Lignes, []),
    maplist(assert_response, Lignes).

% Prédicat pour affirmer chaque réponse
assert_response(Ligne) :-
    Ligne =.. [ligne|Donnees],
    assertz(response(Donnees)).

% Exemple de requête pour récupérer les questions et leurs réponses
fetch_question_responses(IDQuestion, TexteReponse, Score) :-
    question([IDQuestion, TexteQuestion, IDParent]),
    response([_, IDQuestion, TexteReponse, Score]).

% Pour exécuter l'importation, appelez les prédicats avec les chemins des fichiers CSV :
% ?- load_questions('./questions.csv').
% ?- load_responses('./responses.csv').