type formula = true | false
	| Var of string
	| Not of formula
	| And of formula * formula
	| Or of formula * formula
;;