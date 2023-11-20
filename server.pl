% Début du code Prolog d'origine

start :-
    hypothesize(Language),
    write('I recommend you to use: '), write(Language), nl,
    undo.

hypothesize(javascript) :- language(javascript).
hypothesize(python) :- language(python).
hypothesize(java) :- language(java).
hypothesize(csharp) :- language(csharp).
hypothesize(cplusplus) :- language(cplusplus).
hypothesize(ruby) :- language(ruby).
hypothesize(swift) :- language(swift).
hypothesize(go) :- language(go).
hypothesize(php) :- language(php).
hypothesize(typescript) :- language(typescript).
hypothesize(kotlin) :- language(kotlin).
hypothesize(scala) :- language(scala).
hypothesize(rust) :- language(rust).
hypothesize(elixir) :- language(elixir).
hypothesize(haskell) :- language(haskell).
hypothesize(lisp) :- language(lisp).
hypothesize(ocaml) :- language(ocaml).
hypothesize(assembly) :- language(assembly).
hypothesize(perl) :- language(perl).
hypothesize(sql) :- language(sql).
hypothesize(shell) :- language(shell).
% ... autres hypothesizes ...

language(Lang) :-
    attributes(Lang, Attrs), check_attributes(Attrs).

attributes(javascript, [scripting_language, widely_used, has_asynchronous_support, is_dynamic_typed]).
attributes(javascript, [scripting_language, widely_used, has_asynchronous_support, is_dynamic_typed, browser_compatibility, object_oriented]).
attributes(python, [interpreted_language, beginner_friendly, versatile, readable_syntax, extensive_library, data_analysis]).
attributes(java, [statically_typed, object_oriented, platform_independent, large_ecosystem, high_performance, enterprise_applications]).
attributes(csharp, [object_oriented, modern_language, strong_type_system, windows_integration, web_development, game_development]).
attributes(cplusplus, [high_performance, system_programming, object_oriented, low_level_control, large_codebase, game_development]).
attributes(ruby, [dynamic_typed, elegant_syntax, web_development, scripting_language, readable_code, metaprogramming]).
attributes(swift, [modern_language, safe_code, ios_development, object_oriented, functional_programming, easy_to_learn]).
attributes(go, [concurrent_programming, compiled_language, simplicity, high_performance, network_programming, cloud_native]).
attributes(php, [web_development, server_side_scripting, dynamic_typed, large_community, easy_to_learn, content_management_systems]).
attributes(typescript, [statically_typed, javascript_superset, scalable_applications, type_safety, tooling_support, large_codebase]).
attributes(kotlin, [modern_language, interoperability, android_development, concise_syntax, null_safety, functional_programming]).
attributes(scala, [functional_programming, object_oriented, jvm_language, type_inference, concurrency_support, big_data]).
attributes(rust, [system_programming, memory_safety, concurrency, modern_language, performance, low_level_control]).
attributes(elixir, [functional_programming, fault_tolerance, concurrency, scalable_applications, metaprogramming, web_development]).
attributes(haskell, [purely_functional, strong_static_typing, lazy_evaluation, type_inference, expressive_syntax, theorem_proving]).
attributes(lisp, [functional_programming, macro_system, symbolic_computing, artificial_intelligence, metaprogramming, extensible]).
attributes(ocaml, [functional_programming, strong_static_typing, type_inference, modularity, efficient_compilation, metaprogramming]).
attributes(assembly, [low_level_programming, hardware_interaction, performance_optimization, embedded_systems, reverse_engineering, operating_systems]).
attributes(perl, [text_processing, scripting_language, regular_expressions, system_administration, web_development, report_generation]).
attributes(sql, [database_query_language, data_manipulation, data_definition, data_retrieval, data_modification, data_reporting]).
attributes(shell, [command_line_interface, scripting_language, automation, system_administration, file_manipulation, process_management]).

check_attributes([]).
check_attributes([H|T]) :- verify(H), check_attributes(T).

% Fin du code Prolog d'origine

% Intégration de la nouvelle logique de vérification

verify(Question) :-
    ask(Question, Response),
    handle_response(Question, Response).

ask(Question, Response) :-
    format('Does the programming language have the following attribute: ~w? (yes/no/maybe) ', [Question]),
    read(ResponseRaw), nl,
    normalize_response(ResponseRaw, Response).

normalize_response(ResponseRaw, Response) :-
    downcase_atom(ResponseRaw, ResponseProcessed),
    (ResponseProcessed = 'yes' ; ResponseProcessed = 'y' -> Response = yes;
     ResponseProcessed = 'no'  ; ResponseProcessed = 'n' -> Response = no;
     ResponseProcessed = 'maybe' -> Response = maybe;
     Response = unknown).

handle_response(Question, yes) :-
    assertz(yes(Question)).
handle_response(Question, no) :-
    assertz(no(Question)).
handle_response(Question, maybe) :-
    assertz(maybe(Question)),
    follow_up_question(Question).
handle_response(Question, unknown) :-
    write('I did not understand your answer. Let us try again.'), nl,
    verify(Question).

follow_up_question(Question) :-
    format('Can you tell me more about ~w? ', [Question]),
    read(FollowUpResponse), nl,
    process_follow_up_response(Question, FollowUpResponse).

process_follow_up_response(Question, FollowUpResponse) :-
    assertz(follow_up(Question, FollowUpResponse)).

% Mise à jour du prédicat undo
undo :- retract(yes(_)), fail.
undo :- retract(no(_)), fail.
undo :- retract(maybe(_)), fail.
undo :- retract(follow_up(_,_)), fail.
undo.