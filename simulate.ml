open Core;;	
open Automaton

let rec print_list = function 
	[] -> ()
	| e::l -> if e = A then print_char 'A' else print_char 'D'; print_list l;
;;
open Printf;;
let next i j (gen:generation) (aut:automaton) =
	let l = [
		gen.(i).(j); (*CEL*)
		gen.(i).(if j > 0 then j - 1 else Array.length gen - 1); (*WEST*)
		gen.((i+1) mod (Array.length gen)).(j); (*SOUTH*)
		gen.(i).((j+1) mod (Array.length gen)); (*EAST*)
		gen.(if i > 0 then i - 1 else (Array.length gen - 1)).(j) (*NORTH*)
	] in print_list (List.rev l); printf "->%B" (is_rule aut l);
	if is_rule aut [
		gen.(i).(j); (*CEL*)
		gen.(i).(if j > 0 then j - 1 else Array.length gen - 1); (*WEST*)
		gen.((i+1) mod (Array.length gen)).(j); (*SOUTH*)
		gen.(i).((j+1) mod (Array.length gen)); (*EAST*)
		gen.(if i > 0 then i - 1 else (Array.length gen - 1)).(j) (*NORTH*)
	] then A else D
;;

(* signature *)
let next_generation (aut:automaton) (gen:generation) =
	let size = Array.length gen in
	let next_gen = Array.make_matrix size size D in
	for i = 0 to size - 1 do
		for j = 0 to size - 1 do
			print_int i; print_char ':'; print_int j; print_string "->";
			next_gen.(i).(j) <- next i j gen aut;
			print_char '\n'
		done;
	done; next_gen
;;