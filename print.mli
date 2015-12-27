(** Printing system *)

(** Print a string representation of the given generation *)
val show_generation : Core.generation -> unit

(** Print the given forumla (dimacs, string list ~ conjunction (the list) of disjunctions (string)) into a file *)
val create_dimacs : string list -> out_channel -> unit
