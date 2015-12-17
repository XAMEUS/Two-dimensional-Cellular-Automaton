type formula = true | false
	| Var of string
	| Not of formula
	| And of formula * formula
	| Or of formula * formula
;;

let rec string_of_formula f = match f with
  | true -> "True"
  | false -> "False"
  | Var v -> v
  | Not f -> "Not (" ^ (string_of_formula f) ^ ")"
  | And (p, q) -> "(" ^ (string_of_formula p) ^ " And " ^ (string_of_formula q) ^ ")"
  | Or (p, q) -> "(" ^ (string_of_formula p) ^ " Or " ^ (string_of_formula q) ^ ")"
;;

let rec latex_of_formula f = match f with
  | true -> "True"
  | false -> "False"
  | Var v -> v
  | Not f -> "\\neg " ^ (latex_of_formula f)
  | And (p, q) -> (latex_of_formula p) ^ " \\wedge " ^ (latex_of_formula q)
  | Or (p, q) -> (latex_of_formula p) ^ " \\vee " ^ (latex_of_formula q)
;;

let rec int_of_formula f = match f with
  | true -> "True"
  | false -> "False"
  | Var v -> v
  | Not f -> "-" ^ (int_of_formula f)
  | And (p, q) -> (int_of_formula p) ^ " 0\n " ^ (int_of_formula q)
  | Or (p, q) -> (int_of_formula p) ^ " " ^ (int_of_formula q)
;;