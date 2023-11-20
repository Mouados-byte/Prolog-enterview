% Titre: Système Expert d'Aide à la Décision pour le Choix de Langage de Programmation : Approche Interactive et Dynamique en Prolog
% Description du prolog: 
%   Ce système Prolog interroge les utilisateurs sur leurs préférences et évalue les langages de programmation correspondants.
%   Il calcule un score pour chaque langage basé sur les attributs confirmés par les réponses de l'utilisateur.
%   Le langage avec le score le plus élevé est recommandé, offrant une suggestion personnalisée et précise.
% Auteurs :
%   - Mouad Imam
%   - Mohamed Amine SAYAGH
%   - Nouhaila ELHAOU
%   - Hajar MIRA
% Début du code Prolog d'origine
# Ce fichier contient un programme Prolog qui recommande un langage de programmation en fonction des attributs spécifiés par l'utilisateur.

% Lancement du système expert
debut :-
    hypothese(Langage),
    % Affichage de la recommandation
    write('Je vous recommande d'utiliser : '), write(Langage), nl,
    % Réinitialisation des faits pour une nouvelle session
    annuler.

hypothese(javascript) :- langage(javascript).
hypothese(python) :- langage(python).
hypothese(java) :- langage(java).
hypothese(csharp) :- langage(csharp).
hypothese(cplusplus) :- langage(cplusplus).
hypothese(ruby) :- langage(ruby).
hypothese(swift) :- langage(swift).
hypothese(go) :- langage(go).
hypothese(php) :- langage(php).
hypothese(typescript) :- langage(typescript).
hypothese(kotlin) :- langage(kotlin).
hypothese(scala) :- langage(scala).
hypothese(rust) :- langage(rust).
hypothese(elixir) :- langage(elixir).
hypothese(haskell) :- langage(haskell).
hypothese(lisp) :- langage(lisp).
hypothese(ocaml) :- langage(ocaml).
hypothese(assembly) :- langage(assembly).
hypothese(perl) :- langage(perl).
hypothese(sql) :- langage(sql).
hypothese(shell) :- langage(shell).
% ... autres hypotheses ...

langage(Lang) :-
    attributs(Lang, Attributs), verifier_attributs(Attributs).

attributs(javascript, [langage_script, largement_utilise, support_asynchrone, typage_dynamique, compatibilite_navigateur, oriente_objet]).
attributs(python, [langage_interprete, convivial_pour_les_debutants, polyvalent, syntaxe_lisible, bibliotheque_etendue, analyse_de_donnees]).
attributs(java, [typage_statique, oriente_objet, independant_de_la_plateforme, ecosysteme_important, haute_performance, applications_d_entreprise]).
attributs(csharp, [oriente_objet, langage_moderne, systeme_de_typage_fort, integration_windows, developpement_web, developpement_de_jeux]).
attributs(cplusplus, [haute_performance, programmation_systeme, oriente_objet, controle_de_bas_niveau, codebase_important, developpement_de_jeux]).
attributs(ruby, [typage_dynamique, syntaxe_elegante, developpement_web, langage_script, code_lisible, meta_programmation]).
attributs(swift, [langage_moderne, code_sur, developpement_ios, oriente_objet, programmation_fonctionnelle, facile_a_apprendre]).
attributs(go, [programmation_concurrente, langage_compile, simplicite, haute_performance, programmation_reseau, natif_du_cloud]).
attributs(php, [developpement_web, scripting_cote_serveur, typage_dynamique, grande_communaute, facile_a_apprendre, systemes_de_gestion_de_contenu]).
attributs(typescript, [typage_statique, sur_ensemble_de_javascript, applications_scalables, securite_de_typage, support_d_outils, codebase_important]).
attributs(kotlin, [langage_moderne, interoperabilite, developpement_android, syntaxe_concise, securite_null, programmation_fonctionnelle]).
attributs(scala, [programmation_fonctionnelle, oriente_objet, langage_jvm, inference_de_type, support_de_concurrence, big_data]).
attributs(rust, [programmation_systeme, securite_memoire, concurrence, langage_moderne, performance, controle_de_bas_niveau]).
attributs(elixir, [programmation_fonctionnelle, tolerance_aux_pannes, concurrence, applications_scalables, meta_programmation, developpement_web]).
attributs(haskell, [purement_fonctionnel, typage_statique_fort, evaluation_paresseuse, inference_de_type, syntaxe_expressive, demonstration_de_theoremes]).
attributs(lisp, [programmation_fonctionnelle, systeme_de_macro, calcul_symbolique, intelligence_artificielle, meta_programmation, extensible]).
attributs(ocaml, [programmation_fonctionnelle, typage_statique_fort, inference_de_type, modularite, compilation_efficace, meta_programmation]).
attributs(assembly, [programmation_de_bas_niveau, interaction_materielle, optimisation_de_performance, systemes_embarques, retro_ingenierie, systemes_d_exploitation]).
attributs(perl, [traitement_de_texte, langage_script, expressions_regulieres, administration_systeme, developpement_web, generation_de_rapports]).
attributs(sql, [langage_de_requete_de_base_de_donnees, manipulation_de_donnees, definition_de_donnees, recuperation_de_donnees, modification_de_donnees, generation_de_rapports]).
attributs(shell, [interface_en_ligne_de_commande, langage_script, automatisation, administration_systeme, manipulation_de_fichiers, gestion_de_processus]).

verifier_attributs([]).
verifier_attributs([H|T]) :- verifier(H), verifier_attributs(T).

% Fin du code Prolog d'origine

% Integration de la nouvelle logique de verification

% Vérification des attributs basée sur les réponses de l'utilisateur
verifier(Question) :-
    demander(Question, Reponse),
    gerer_reponse(Question, Reponse).

% Poser une question à l'utilisateur et obtenir une réponse
demander(Question, Reponse) :-
    format('Le langage de programmation a-t-il l attribut suivant : ~w ? (oui/non/peut-etre) ', [Question]),
    read(ReponseBrut), nl,
    normaliser_reponse(ReponseBrut, Reponse).

% Normalisation de la réponse pour gérer différents types d'entrées
normaliser_reponse(ReponseBrut, Reponse) :-
    downcase_atom(ReponseBrut, ReponseTraitee),
    (ReponseTraitee = 'oui' ; ReponseTraitee = 'o' -> Reponse = oui;
     ReponseTraitee = 'non'  ; ReponseTraitee = 'n' -> Reponse = non;
     ReponseTraitee = 'peut-etre' -> Reponse = peut_etre;
     Reponse = inconnu).

% Gestion des réponses et action en fonction du type de réponse
gerer_reponse(Question, oui) :-
    assertz(oui(Question)).
gerer_reponse(Question, non) :-
    assertz(non(Question)).
gerer_reponse(Question, peut_etre) :-
    assertz(peut_etre(Question)),
    question_complementaire(Question).
gerer_reponse(Question, inconnu) :-
    write('Je n ai pas compris votre reponse. Essayons a nouveau.'), nl,
    verifier(Question).

% Poser des questions complémentaires si nécessaire
question_complementaire(Question) :-
    format('Pouvez-vous m en dire plus sur ~w ? ', [Question]),
    read(ReponseComplementaire), nl,
    traiter_reponse_complementaire(Question, ReponseComplementaire).

% Traitement des réponses complémentaires
traiter_reponse_complementaire(Question, ReponseComplementaire) :-
    assertz(suivi(Question, ReponseComplementaire)).

%  Réinitialisation des faits (oui, non, peut-être, suivi) pour permettre une nouvelle session
annuler :- retract(oui(_)), fail.
annuler :- retract(non(_)), fail.
annuler :- retract(peut_etre(_)), fail.
annuler :- retract(suivi(_,_)), fail.
annuler.

:- dynamic oui/1, non/1, peut_etre/1, suivi/2.

% Lancement du programme avec ?- debut.