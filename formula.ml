(** Propositional formula
	@deprecated unused *)

(** Propositional logic formula *)
type formula = true | false
	| Var of string (** Variable *)
	| Not of formula (** Negation *)
	| And of formula * formula (** And *)
	| Or of formula * formula (** Or *)
;;

(** Convert a given formula into a string. *)
let rec string_of_formula f = match f with
  | true -> "True"
  | false -> "False"
  | Var v -> v
  | Not f -> "Not (" ^ (string_of_formula f) ^ ")"
  | And (p, q) -> "(" ^ (string_of_formula p) ^ " And " ^ (string_of_formula q) ^ ")"
  | Or (p, q) -> "(" ^ (string_of_formula p) ^ " Or " ^ (string_of_formula q) ^ ")"
;;

(** Convert a given formula into a string (latex format). *)
let rec latex_of_formula f = match f with
  | true -> "True"
  | false -> "False"
  | Var v -> v
  | Not f -> "\\neg " ^ (latex_of_formula f)
  | And (p, q) -> (latex_of_formula p) ^ " \\wedge " ^ (latex_of_formula q)
  | Or (p, q) -> (latex_of_formula p) ^ " \\vee " ^ (latex_of_formula q)
;;

(** Convert a given formula into a string (dimacs format) *)
let rec dimacs_of_formula f = match f with
  | true -> "True"
  | false -> "False"
  | Var v -> v
  | Not f -> "-" ^ (dimacs_of_formula f)
  | And (p, q) -> (dimacs_of_formula p) ^ " 0\n " ^ (dimacs_of_formula q)
  | Or (p, q) -> (dimacs_of_formula p) ^ " " ^ (dimacs_of_formula q)
;;