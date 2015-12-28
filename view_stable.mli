(** Graphics for stable generation *)

(** Exception if the file does not exist stable generations *)
exception File_Not_Find

(**Read line by line and creates the generation corresponding to the line*)
val readLine : 'a -> 'b -> Core.generation

(**Read file if exist *)
val read : string -> 'a -> 'b -> unit
