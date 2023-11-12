% Définir les questions et les réponses
question(1, 'Avez-vous de l\'expérience en programmation?').
question(2, 'Êtes-vous un joueur d\'équipe?').
question(3, 'Avez-vous de bonnes compétences en communication?').
question(4, 'Êtes-vous à l\'aise de travailler sous pression?').
question(5, 'Avez-vous des connaissances en Prolog?').
question(6, 'Avez-vous des projets avec Prolog?').

% Définir les règles pour réussir Entretien
reussir_entretien :- 
    reponse(1, oui),
    reponse(2, oui),
    (reponse(3, oui) ; reponse(3, non)),
    reponse(4, oui),
    reponse(5, oui),
    (reponse(6, oui) ; reponse(6, non)).

% Prédicat pour poser des questions et recueillir des réponses
poser_questions :- 
    retractall(reponse(_, _)),  % Effacer les réponses précédentes
    poser_question(1).

poser_question(NumeroQuestion) :-
    question(NumeroQuestion, Question),
    write(Question), nl,
    read(Reponse),
    assertz(reponse(NumeroQuestion, Reponse)),
    QuestionSuivante is NumeroQuestion + 1,
    (QuestionSuivante =< 6 -> poser_question(QuestionSuivante); evaluer_entretien). % Ajuster la limite en fonction du nombre de questions

% Prédicat pour évaluer Entretien en fonction des réponses
evaluer_entretien :-
    (reussir_entretien -> 
        write('Félicitations! Vous avez réussi l\'entretien.');
        write('Désolé, vous n\'avez pas réussi l\'entretien.')
    ).

% Exemple D Utilisation
demarrer_entretien :- poser_questions.
