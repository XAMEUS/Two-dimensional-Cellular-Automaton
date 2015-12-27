(** Simulation calculus *)

(** Calculate the next generation of the given generation (according to the given automaton). *)
val next_generation : Core.automaton -> Core.generation -> Core.generation
