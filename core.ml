(** Types defition *)

(** State of a cell *)
type state = 
	| A (** Alive *)
	| D (** Dead *)
;;

(** Grid of cells (2D state array) *)
type generation = state array array;;

(** Automaton, array of state (32), all by default D; each index corresponds to a specifix rule, AAAAA -> 0, AAAAD -> 1, AAADA -> 2, ... , DDDDD -> 31 *)
type automaton = state array;;