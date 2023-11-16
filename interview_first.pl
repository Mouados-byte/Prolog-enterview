% Exemples de prédicats factices pour simuler les réponses
est_tanguy(non).
est_riche(oui).
peur_solitude(oui).
conjoint_attentif(non).
maniaque_todo_list(oui).
pret_a_manger_des_pates(non).
est_patient(oui).

est_fait_pour_freelance :-
    (   est_tanguy(Réponse) ,
        Réponse = oui ->
        (   est_riche(Réponse1),
            (   Réponse1 = oui ->
                (   peur_solitude(Réponse2),
                    (   Réponse2 = oui ->
                        (   conjoint_attentif(Réponse3),
                            (   Réponse3 = oui ->
                                (   maniaque_todo_list(Réponse4),
                                    (   Réponse4 = oui ->
                                        write('Bravo, on dirait bien que vous avez réussi le test !')
                                    ;   write('Alors optez pour un agenda, ça devrait vous servir')
                                    )
                                ;   write('L\'image du couteau-suisse, ça vous parle ?')
                                )
                            ;   write('L\'image du couteau-suisse, ça vous parle ?')
                            )
                        ;   write('Désolé, ça s\'arrête là pour vous')
                        )
                    ;   write('Désolé, ça s\'arrête là pour vous')
                    )
                ;   write('Désolé, ça s\'arrête là pour vous')
                )
            ;   write('Et si vous lisiez cet article : freelance, c\'est quoi le big deal, suivi d\'un coup d\'oeil sur blog.du-www.daily-sprint.com ?')
            )
        )
    ;   (   est_riche(Réponse5),
          (   Réponse5 = oui ->
              (   pret_a_manger_des_pates(Réponse6),
                  (   Réponse6 = oui ->
                      write('Motivé(e) pour respecter vos deadlines, même quand vous aurez 40 de fièvre ?')
                  ;   (   est_patient(Réponse7),
                          (   Réponse7 = oui ->
                              write('Penser (très fort) au salariat')
                          ;   write('Retourner vivre chez vos parents pour vous faire entretenir')
                          )
                      )
                  )
              ;   write('Allez... Entre nous... Vous avez déjà goûté à la vie de Tanguy, ce n\'est pas si mal, non ? Même un peu ?')
              )
          ;   write('Allez... Entre nous... Vous avez déjà goûté à la vie de Tanguy, ce n\'est pas si mal, non ? Même un peu ?')
          )
      )
    ).

demarrer_test :- 
    est_fait_pour_freelance, nl.
