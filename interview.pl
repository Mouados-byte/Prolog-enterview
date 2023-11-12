question(1, 'Avez-vous de l\'expérience en programmation?').
question(2, 'Êtes-vous à l\'aise de travailler en équipe?').
question(3, 'Avez-vous de bonnes compétences en communication?').
question(4, 'Êtes-vous à l\'aise de travailler sous pression?').
question(5, 'Avez-vous des connaissances en Prolog?').
question(6, 'Avez-vous des projets avec Prolog?').
question(7, 'Maîtrisez-vous les langages de programmation orientés objet?').
question(8, 'Avez-vous travaillé sur des projets de développement web?').
question(9, 'Connaissez-vous les principes des bases de données relationnelles?').
question(10, 'Êtes-vous familier avec les concepts de l\'intelligence artificielle?').
question(11, 'Avez-vous de l\'expérience dans le développement mobile?').
question(12, 'Êtes-vous à l\'aise avec les méthodes de gestion de versions comme Git?').
question(13, 'Avez-vous participé à des hackathons ou des compétitions de programmation?').
question(14, 'Connaissez-vous les frameworks JavaScript populaires comme React ou Angular?').
question(15, 'Avez-vous une compréhension approfondie des algorithmes et des structures de données?').

% Définir les règles pour réussir Entretien
reussir_entretien :- 
    reponse(1, oui),
    reponse(2, oui),
    (reponse(3, oui) ; reponse(3, non)),
    reponse(4, oui),
    reponse(5, oui),
    (reponse(6, oui) ; reponse(6, non)),
    reponse(7, oui),
    reponse(8, oui),
    (reponse(9, oui) ; reponse(9, non)),
    (reponse(10, oui) ; reponse(10, non)),
    reponse(11, oui),
    reponse(12, oui),
    (reponse(13, oui) ; reponse(13, non)),
    (reponse(14, oui) ; reponse(14, non)),
    reponse(15, oui).

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
