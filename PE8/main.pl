:- module(main, [sum_age/2, max_age_of_hobby/3, person_in_range/4]).
:- [kb].
    
    
    maxx(X, Y, Z) :-
        X>Y,
        Z is X.
     maxx(X, Y, Z) :-
        Y>=X,
        Z is Y.
        
    sum_age([],Ageee):- Ageee is 0.
    sum_age([H|T],Agee):- 
        kb:person(H, X, _),
        sum_age(T,Age2), Agee is (X+Age2).
    
    max_age_of_hobby([], _, 0).
    
    max_age_of_hobby([H|T], Hobby, Max):-
        kb:person(H, A, Hobi),
        max_age_of_hobby(T,Hobby,Max2),
        Hobby = Hobi,
        maxx(A, Max2, Z),
        Max is Z.
        
    max_age_of_hobby([H|T], Hobby, Max):-
        kb:person(H, A, Hobi),
        max_age_of_hobby(T,Hobby,Max2),
        Hobby \= Hobi,
        Max is Max2.
        
        
    person_in_range([], _, _, []).
    
    person_in_range([H|T], Alt, Ust, Res):-
        kb:person(H, A, _),
        A>Ust,
        person_in_range(T, Alt, Ust, Res).
    
    person_in_range([H|T], Alt, Ust, Res):-
        kb:person(H, A, _),
        A<Alt,
        person_in_range(T, Alt, Ust, Res).
    
    person_in_range([H|T], Alt, Ust, Res):-
        kb:person(H, A, _),
        Ust>=A,
        A>=Alt,
        person_in_range(T, Alt, Ust, Result), 
        append([H],Result, Res).
    
    
        