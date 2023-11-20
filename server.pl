/* programming_language.pro
   Programming language recommendation system.
   Start with ?- start. */

start :-
    hypothesize(Language),
    write('I recommend you to use: '), write(Language), nl,
    undo.

hypothesize(javascript) :- language(javascript).
hypothesize(python)     :- language(python).
hypothesize(java)       :- language(java).
hypothesize(csharp)     :- language(csharp).
hypothesize(ruby)       :- language(ruby).
hypothesize(swift)      :- language(swift).
hypothesize(go)         :- language(go).
hypothesize(php)        :- language(php).
hypothesize(typescript) :- language(typescript).
hypothesize(kotlin)     :- language(kotlin).
hypothesize(unknown).   /* no diagnosis */

language(Lang) :-
    attributes(Lang, Attrs), check_attributes(Attrs).

attributes(javascript, [scripting_language, widely_used, has_asynchronous_support, is_dynamic_typed]).
attributes(python,     [scripting_language, widely_used, object_oriented, is_easy_to_learn, has_clear_syntax]).
attributes(java,       [object_oriented, widely_used, is_platform_independent, is_static_typed]).
attributes(csharp,     [object_oriented, is_used_for_windows, has_strong_type_system]).
attributes(ruby,       [scripting_language, has_elegant_syntax, is_used_for_web_development, supports_metaprogramming]).
attributes(swift,      [object_oriented, is_used_for_ios, is_fast, has_clear_syntax]).
attributes(go,         [compiled_language, is_used_for_system_programming, is_concurrent, is_static_typed]).
attributes(php,        [scripting_language, widely_used, object_oriented, is_used_for_web_development, is_dynamic_typed]).
attributes(typescript, [scripting_language, widely_used, object_oriented, has_elegant_syntax, is_used_for_web_development, has_asynchronous_support, is_superset_of_javascript, is_static_typed]).
attributes(kotlin,     [object_oriented, is_used_for_android, is_interoperable_with_java, is_concise]).

check_attributes([]).
check_attributes([H|T]) :- verify(H), check_attributes(T).

classification(widely_used,       [is_popular, is_new_and_fresh]).
classification(scripting_language, [is_interpreted, is_high_level]).
classification(object_oriented,    [supports_objects, is_modular]).
classification(compiled_language,  [is_compiled, is_efficient]).

check_classification(Class) :-
    classification(Class, Attrs), member(Attr, Attrs), verify(Attr), !.

scripting_language :- check_classification(scripting_language).
object_oriented    :- check_classification(object_oriented).
compiled_language  :- check_classification(compiled_language).
widely_used        :- check_classification(widely_used).

/* asking questions */
ask(Question) :-
    format('Does the programming language have the following attribute: ~w? ', [Question]),
    read(Response), nl,
    ( (Response == yes ; Response == y) -> assertz(yes(Question)) ; assertz(no(Question)), fail ).

:- dynamic yes/1,no/1.

/* verifying predicates */
verify(S) :- yes(S) -> true ; (no(S) -> fail ; ask(S)).

/* undo all yes/no assertions */
undo :- retract(yes(_)), fail. 
undo :- retract(no(_)), fail.
undo.