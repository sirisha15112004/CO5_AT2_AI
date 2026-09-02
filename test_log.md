# Test Log — SWI-Prolog Console Session

This is the real, unedited output of loading `medical_diagnosis.pl` in
SWI-Prolog 9.0.4 and running every query used in the report, in one
continuous session (query numbers 70–80).

```prolog
70 ?- consult("medical_diagnosis.pl").
true.

71 ?- has_symptom(patient1, X).
X = fever ;
X = cough ;
X = body_ache ;
X = fatigue.

72 ?- has_disease(patient1, Disease).
Disease = flu.

73 ?- has_disease(patient2, malaria).
true.

74 ?- diagnose(patient1).
Patient: patient1
Likely condition: flu
Advice: Take rest, drink fluids, consult a doctor if fever persists
true.

75 ?- has_disease(patient1, D).
D = flu.

76 ?- has_disease(patient2, D).
D = malaria.

77 ?- has_disease(patient3, D).
D = common_cold.

78 ?- has_disease(patient4, D).
D = migraine.

79 ?- has_disease(patient5, D).
D = typhoid.

80 ?- has_disease(patient6, D).
false.
```

## Result summary

| Patient | Symptoms | Expected disease | Actual result |
|---|---|---|---|
| patient1 | fever, cough, body_ache, fatigue | flu | flu — matched |
| patient2 | fever, chills, sweating, headache | malaria | malaria — matched |
| patient3 | cough, sneezing, sore_throat (no fever) | common_cold | common_cold — matched |
| patient4 | headache, nausea, sensitivity_to_light | migraine | migraine — matched |
| patient5 | fever, stomach_pain, weakness, loss_of_appetite | typhoid | typhoid — matched |
| patient6 | fever only (incomplete case) | no match | `false` — correctly reported, after backtracking through every rule |

All 6/6 test cases match the expected result.
