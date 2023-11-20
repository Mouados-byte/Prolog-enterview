/* programming_language.pro
  programming language recommendation game.

    start with ?- start. */

start :- hypothesize(Language),
      write('I recommend you to use: '),
      write(Language),
      nl,
      undo.

/* hypotheses to be tested */
hypothesize(javascript)   :- javascript, !.
hypothesize(python)       :- python, !.
hypothesize(java)         :- java, !.
hypothesize(csharp)       :- csharp, !.
hypothesize(ruby)          :- ruby, !.
hypothesize(swift)         :- swift, !.
hypothesize(go)            :- go, !.
hypothesize(php)           :- php, !.
hypothesize(typescript)    :- typescript, !.
hypothesize(kotlin)        :- kotlin, !.
hypothesize(unknown).      /* no diagnosis */

/* programming language identification rules */
javascript :- scripting_language, 
              widely_used,
              verify(has_asynchronous_support),
              verify(is_dynamic_typed).
python :- scripting_language, 
           widely_used,
           object_oriented,
           verify(is_easy_to_learn),
           verify(has_clear_syntax).
java :- object_oriented, 
        widely_used,
        verify(is_platform_independent),
        verify(is_static_typed).
csharp :- object_oriented, 
          verify(is_used_for_windows),
          verify(has_strong_type_system).
ruby :- scripting_language,
        verify(has_elegant_syntax),
        verify(is_used_for_web_development),
        verify(supports_metaprogramming).
swift :- object_oriented, 
         verify(is_used_for_ios),
         verify(is_fast),
         verify(has_clear_syntax).
go :- compiled_language, 
      verify(is_used_for_system_programming),
      verify(is_concurrent),
      verify(is_static_typed).
php :- scripting_language, 
       widely_used,
       object_oriented, 
       verify(is_used_for_web_development),
       verify(is_dynamic_typed).
typescript :- scripting_language,
              widely_used,
              object_oriented,
              verify(has_elegant_syntax),
              verify(is_used_for_web_development),
              verify(has_asynchronous_support),
              verify(is_superset_of_javascript),
              verify(is_static_typed).
kotlin :- object_oriented, 
          verify(is_used_for_android),
          verify(is_interoperable_with_java),
          verify(is_concise).
          
/* classification rules */
widely_used   :- verify(is_popular), !.
widely_used   :- verify(is_new_and_fresh).
scripting_language  :- verify(is_interpreted), !.
scripting_language  :- verify(is_high_level).
object_oriented     :- verify(supports_objects), !.
object_oriented     :- verify(is_modular).
compiled_language   :- verify(is_compiled), !.
compiled_language   :- verify(is_efficient).

/* how to ask questions */
ask(Question) :-
    write('Does the programming language have the following attribute: '),
    write(Question),
    write('? '),
    read(Response),
    nl,
    ( 
        (Response == yes ; Response == y) -> assert(yes(Question)) ; 
        assert(no(Question)), 
        fail
     ).

:- dynamic yes/1,no/1.

/* How to verify something */
verify(S) :-
   (
        yes(S) -> true ;
        (no(S) -> fail ; ask(S))
   ).

/* undo all yes/no assertions */
undo :- retract(yes(_)),fail. 
undo :- retract(no(_)),fail.
undo.
