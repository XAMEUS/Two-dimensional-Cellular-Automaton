open Core;;
open Formula;;
open Automaton;;

let get_all_unstables (aut:automaton) =
	let rec aux aut i m l =
		if i = m then l
		else if aut.(i) = (if (i mod 2) = 0 then D else A) then
			aux aut (i+1) m (i :: l)
		else aux aut (i+1) m l
	in
	aux aut 0 (Array.length aut) []
;;

let stables (aut:automaton) (dim:int) =
	let do_rule i j m r =
		let s = ix_to_rule r in
		string_of_int (if s.[0] = 'D' then (if i > 0 then (i - 1) * m + j else (m - 1) * m + j)
				else - (if i > 0 then (i - 1) * m + j else (m - 1) * m + j))
		^ " " ^
		(string_of_int (if s.[1] = 'D' then (if j = m then i * m + 1 else i * m + j + 1)
							else - (if j = m then i * m + 1 else i * m + j + 1)))
		^ " " ^
		(string_of_int (if s.[2] = 'D' then (if i = (m - 1) then j else (i + 1) * m + j)
							else - (if i = (m - 1) then j else (i + 1) * m + j)))
		^ " " ^
		(string_of_int (if s.[3] = 'D' then (if j = 1 then i * m + m else i * m + j - 1)
							else - (if j = 1 then i * m + m else i * m + j - 1)))
		^ " " ^
		(string_of_int (if s.[4] = 'D' then (i * m + j) 
							else - (i * m + j)))
		^ " 0\n"
	in
	let rec do_rules i j m r f = match r with
		| [] -> f
		| h::t -> do_rules i j m t (f ^ (do_rule i (j + 1) m h))
	in
	let rec aux i j m aut r l =
		if i = m then l
		else if j = m then aux (i + 1) 0 m aut r l
		else aux i (j + 1) m aut r (((do_rules i j m r "")) :: l)
	in
	aux 0 0 dim aut (get_all_unstables aut) []
;;