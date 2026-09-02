# CO5 AT2 – Healthcare Expert System (Prolog)

**Course:** Artificial Intelligence and Expert Systems (MLA01)
**Course Outcome:** CO5 – Construct rule-based expert systems using production rules, forward and backward chaining, and by distinguishing procedural and non-procedural paradigms.
**Industry Domain:** Healthcare
**Author:** Sirisha

## Problem

A hospital wants a simple decision-support tool that looks at a patient's
reported symptoms and gives an early idea of the likely condition, along
with basic first-step advice. This is **not** a replacement for a doctor —
it is a small rule-based expert system built to demonstrate forward
chaining, backward chaining, unification, and backtracking in Prolog.

## Files in this repository

| File | What it is |
|---|---|
| `medical_diagnosis.pl` | The full SWI-Prolog knowledge base — facts, production rules, and the explanation helper |
| `test_log.md` | Real SWI-Prolog console output for every query used in the report |
| `Healthcare_Expert_System_Report.docx` | The full assignment report (all 10 required sections) |
| `README.md` | This file |

## How to run it

1. Install [SWI-Prolog](https://www.swi-prolog.org/) (free).
2. Open a terminal in this folder and start Prolog:
   ```
   swipl
   ```
3. Load the knowledge base:
   ```prolog
   ?- consult("medical_diagnosis.pl").
   ```
4. Try some queries:
   ```prolog
   ?- has_symptom(patient1, X).
   ?- has_disease(patient1, Disease).
   ?- has_disease(patient2, malaria).
   ?- diagnose(patient1).
   ?- diagnose_all.
   ```

## Knowledge base summary

**Facts** — `has_symptom(Patient, Symptom)` — what symptoms each sample
patient has.

**Rules** — `has_disease(Patient, Disease)` — six production rules that
match a group of symptoms to a disease: `flu`, `common_cold`, `malaria`,
`typhoid`, `migraine`, `covid19`.

**Explanation** — `advice(Disease, Text)` gives first-step advice, and
`diagnose(Patient)` prints the disease and advice together.

## Reasoning demonstrated

- **Forward chaining** — start from a patient's known symptoms and find
  which disease rule they satisfy: `has_disease(patient1, Disease)`.
- **Backward chaining** — start from one target disease and check whether
  the patient's symptoms support it: `has_disease(patient2, malaria)`.
- **Unification** — Prolog matches the query variable against each disease
  name defined in the rules.
- **Backtracking** — when a rule's symptom check fails, Prolog automatically
  retries the next rule (see `test_log.md`, patient6 case).

## Test cases

Six patients were tested. Five have a full symptom set that matches exactly
one disease; one (`patient6`) has an incomplete symptom set and correctly
returns `false`, showing backtracking through every rule with no match.
Full console output for every case is in [`test_log.md`](./test_log.md).

## Limitations

This is a small teaching knowledge base (six diseases, no severity or
probability scoring) built to demonstrate expert-system concepts for CO5.
It is not medical advice and must not be used for real diagnosis.
