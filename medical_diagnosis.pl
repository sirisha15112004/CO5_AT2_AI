% ============================================
% Healthcare Expert System - medical_diagnosis.pl
% CO5 AT2 - Industry Problem-Based Assignment
% Domain: Healthcare (preliminary disease diagnosis)
% ============================================

% ---- FACTS: patient symptoms ----
has_symptom(patient1, fever).
has_symptom(patient1, cough).
has_symptom(patient1, body_ache).
has_symptom(patient1, fatigue).

has_symptom(patient2, fever).
has_symptom(patient2, chills).
has_symptom(patient2, sweating).
has_symptom(patient2, headache).

has_symptom(patient3, cough).
has_symptom(patient3, sneezing).
has_symptom(patient3, sore_throat).

has_symptom(patient4, headache).
has_symptom(patient4, nausea).
has_symptom(patient4, sensitivity_to_light).

has_symptom(patient5, fever).
has_symptom(patient5, stomach_pain).
has_symptom(patient5, weakness).
has_symptom(patient5, loss_of_appetite).

has_symptom(patient6, fever).

% ---- RULES: disease conditions (production rules) ----
has_disease(P, flu) :-
    has_symptom(P, fever), has_symptom(P, cough),
    has_symptom(P, body_ache), has_symptom(P, fatigue).

has_disease(P, common_cold) :-
    has_symptom(P, cough), has_symptom(P, sneezing),
    has_symptom(P, sore_throat), \+ has_symptom(P, fever).

has_disease(P, malaria) :-
    has_symptom(P, fever), has_symptom(P, chills),
    has_symptom(P, sweating), has_symptom(P, headache).

has_disease(P, typhoid) :-
    has_symptom(P, fever), has_symptom(P, stomach_pain),
    has_symptom(P, weakness), has_symptom(P, loss_of_appetite).

has_disease(P, migraine) :-
    has_symptom(P, headache), has_symptom(P, nausea),
    has_symptom(P, sensitivity_to_light).

has_disease(P, covid19) :-
    has_symptom(P, fever), has_symptom(P, cough),
    has_symptom(P, loss_of_taste), has_symptom(P, breathing_difficulty).

% ---- ADVICE (explanation module) ----
advice(flu, 'Take rest, drink fluids, consult a doctor if fever persists').
advice(common_cold, 'Rest, warm fluids, steam inhalation').
advice(malaria, 'See a doctor immediately, get a blood test').
advice(typhoid, 'See a doctor immediately, avoid outside food').
advice(migraine, 'Rest in a dark quiet room, stay hydrated').
advice(covid19, 'Isolate and consult a doctor immediately').

% ---- EXPLANATION HELPER ----
diagnose(P) :-
    has_disease(P, D),
    advice(D, A),
    format('Patient: ~w~nLikely condition: ~w~nAdvice: ~w~n~n', [P, D, A]).

% ---- Run all sample patients at once (handy for demo) ----
diagnose_all :-
    forall(has_disease(P, D), (advice(D, A), format('~w -> ~w (~w)~n', [P, D, A]))).
