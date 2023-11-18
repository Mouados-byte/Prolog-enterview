web_tester :- (valider -> felicitation ; desole).

% Questions about web development
html_css_js :- verifier('Avez-vous des connaissances en HTML, CSS, et JavaScript?').
mvc          :- verifier('Connaissez-vous le modèle MVC (Model-View-Controller)?').
design          :- verifier('Avez-vous de l\'expérience avec UI/UX?').
responsive   :- verifier('Avez-vous de l\'expérience dans le design responsive?').
ajax         :- verifier('Avez-vous utilisé AJAX dans vos projets?').
framework    :- verifier('Avez-vous travaillé avec des frameworks web?').
api          :- verifier('Avez-vous implémenté des API dans vos projets?').
database     :- verifier('Avez-vous travaillé avec des bases de données dans le contexte web?').
versioning   :- verifier('Utilisez-vous des systèmes de gestion de versions comme Git?').
security     :- verifier('Avez-vous des connaissances en sécurité web?').
testing      :- verifier('Pratiquez-vous des tests unitaires dans vos projets web?').
deployment   :- verifier('Avez-vous de l\'expérience dans le déploiement de sites web?').

valider :- html_css_js,
           responsive,
           ajax,
           framework,
           mvc,
           api,
           database,
           versioning,
           security,
           testing,
           deployment.

valider :- html_css_js,
           responsive,
           framework,
           mvc,
           api,
           database,
           versioning,
           security,
           testing.

valider :- html_css_js,
           responsive,
           mvc,
           api,
           database,
           versioning,
           security.

valider :- html_css_js,
           responsive,
           framework,
           mvc,
           api,
           database,
           versioning,
           security,
           testing,
           deployment.

valider :- html_css_js,
           responsive,
           mvc,
           api,
           versioning,
           security.

valider :- html_css_js,
           framework,
           mvc,
           api,
           versioning.

valider :- html_css_js,
           responsive,
           framework,
           testing,
           deployment.

valider :- html_css_js,
           api,
           database,
           versioning,
           security.

valider :- html_css_js,
           api,
           versioning,
           framework.

felicitation :- write("Félicitations, tu as réussi le web tester"),
                annuler.

desole :- write("Désolé, vous avez échoué le web tester"),
            annuler,
            fail.

verifier(Symptome) :- ( yes(Symptome) -> true ; (no(Symptome) -> fail ; demander(Symptome)) ).

demander(Symptome) :- write(Symptome),
                     nl,
                     read(Reponse),
                     ( (Reponse == oui) -> assert(yes(Symptome)) ; assert(no(Symptome)), fail ).

:- dynamic yes/1, no/1.

annuler :- retract(yes(_)), fail.
annuler :- retract(no(_)), fail.
annuler.
