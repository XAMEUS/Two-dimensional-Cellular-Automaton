open Core;;
open Read;;
open Print;;
open Automaton;;
open Simulate;;
open Stable;;
open Formula;;
open Show_stable;;

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

(*show_generation gen;;*)

open Printf;;
(*printf "%B\n" (is_rule aut [D;D;A;A;A]);;
printf "%B\n" (is_rule aut [D;D;A;D;A]);;*)

let rec print_l l = match l with
	| [] -> printf "\n"
	| h::t -> printf "%d-%s \n" h (ix_to_rule h); print_l t
;;

(*let print_list_rules aut =
	for i=0 to 31 do
		printf "%d : %s -> %s\n" i (ix_to_rule i) (if aut.(i) = A then "A" else "D")
	done
;;

let get_all_dead_to_alive (aut:automaton) =
	let l = ref [] in
	for i = 0 to ((Array.length aut / 2) - 1) do
		if aut.(2 * i + 1) = A
		then l := ((2 * i + 1) :: !l)
	done;
	l
;;
let get_all_alive_to_dead (aut:automaton) =
	let l = ref [] in
	for i = 0 to ((Array.length aut / 2) - 1) do
		if aut.(2 * i) i n v= D
		then l := ((2 * i) :: !l)
	done;
	l
;;
let get_all_unstables (aut:automaton) =
	let rec aux aut i m l =
		if i = m then l
		else if aut.(i) = (if (i mod 2) = 0 then D else A) then
			aux aut (i+1) m (i :: l)
		else aux aut (i+1) m l
	in
	aux aut 0 (Array.length aut) []
;;

print_list_rules aut;;
print_l (get_all_unstables aut);;*)

let rec print_list_formulae l = match l with
	| [] -> printf "\n"
	| h::t -> printf "%s\n" h; print_list_formulae t
;;

let i = Sys.time ();;
let l = stables aut 3;;
printf "converting automaton time : %fs\n" (Sys.time() -. i);;
(*print_list_formulae (l);;*)

create_dimacs l (open_out "fnc.dimacs");;

if Sys.file_exists "gens" then Sys.remove "gens";;
let i = Sys.time ();;
show_stable ();;
printf "finding all stable generations time : %fs\n" (Sys.time() -. i);;

(*show_generation (next_generation aut gen);;*)