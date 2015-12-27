(** Automaton's functions *)

(** Add the given rule ([XXXXX -> A]) to the automaton.*)
val add_rule : Core.automaton -> string -> unit

(** Test if the automaton contains the given rule (as a list {b reversed}; for example ADDAD = [\[D; A; D; D; A\]]) *)
val is_rule : Core.automaton -> Core.state list -> bool

(** Transform the given int (index) to a rule; for example: [26 -> 11010 -> DDADA] *)
val ix_to_rule : int -> string