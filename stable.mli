(** Stable calculus *)

(** Get all unstable rules (index) from the given automaton, for example: AAAAD -> A or AAAAA -> D. *)
val get_all_unstables : Core.automaton -> int list

(** Transform the given automaton into a formula to calculate all stable generations. *)
val stables : Core.automaton -> int -> string list
