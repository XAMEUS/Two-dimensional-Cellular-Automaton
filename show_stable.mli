(** Stable calculus *)

(** Inverse the given formula (dimacs); positive values become negative, the negative ones, positive. *)
val inv : string list -> string

(** Interprete the minisat's result. *)
val is_stable : string -> string

(** Update .dimacs first line.
	@deprecated unused, minisat doesn't care about the size. *)
val update_fnc : string -> unit

(** Calculate all stable generations. *)
val show_stable : unit -> unit
