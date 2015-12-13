open Core;;
open Read;;
open Print;;
open Automaton;;

let (size, aut, gen) = parse (open_in "test");;

show_generation gen;;

open Printf;;
printf "%B\n" (is_rule aut [D;D;A;A;A]);;
printf "%B\n" (is_rule aut [D;D;A;D;A]);;