(** Reading system *)

(** Read an automaton and a generation from the given file *)
val parse : in_channel -> int * Core.automaton * Core.generation