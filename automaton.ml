open Core;;

let pow x n =
	let rec aux x n v =
		if n = 0 then v
		else aux x (n-1) (v*x)
	in aux x n 1
;;

let rec aux s sl i ix =
	if i = sl then ix
	else
		if s.[i] = 'A' then aux s sl (i+1) ix
		else aux s sl (i+1) (ix + (pow 2 (sl - i - 1)))
;;

let add_rule (r:automaton) s =
	r.(aux s (String.length s) 0 0) <- A
;;

let is_rule (r:automaton) s =
	r.(aux s (String.length s) 0 0) = A
;;

let rec aux l i ix = match l with
	| [] -> ix
	| [a] -> ix
	| h::t -> if h = A then aux t (i+1) ix
		else aux t (i+1) (ix+(pow 2 i))

(* reverse the list *)
let is_rule (r:automaton) l =
	r.(aux l 0 0) = A
;;