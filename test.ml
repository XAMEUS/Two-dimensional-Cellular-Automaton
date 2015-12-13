open Core;;
open Read;;
open Print;;
open Automaton;;
open Simulate;;

(* TEST:
7
Regles
AAAAA
AAAAD
AAADA
AAADD
GenerationZero
DAAAAAA
ADAAAAA
AADAAAA
AAADAAA
AAAADAA
AAAAADA
AAAAAAD
*)

(* RULES
-A- -A- -A- -A-
AAA ADA DAA DDA
-A- -A- -A- -A-
*)

let (size, aut, gen) = parse (open_in "test");;

show_generation gen;;

open Printf;;
printf "%B\n" (is_rule aut [D;D;A;A;A]);;
printf "%B\n" (is_rule aut [D;D;A;D;A]);;

printf "-------------\n\n";;
show_generation (next_generation aut gen);;