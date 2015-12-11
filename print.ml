open Core;;

(* utiliser Array.iter *)
let rec print_l tab n =
	if n < Array.length tab
	then
		begin
		if tab.(n) = A then print_string (" | A")
		else print_string (" | D");
		print_l tab (n+1)
		end
	else
		print_string " |\n"
;;

let rec print_separator n f =
	if n < f
	then
		begin
		print_string ("+---");
		print_separator (n + 1) f
    end
  else
    print_string ("+\n")
;;

let rec print_gen (gen:generation) n =
	print_string " ";
	print_separator 0 (Array.length gen);
	if n < Array.length gen
	then
		begin
		print_l gen.(n) 0 ;
		print_gen gen (n+1)
		end
;;

let show_generation (gen:generation) =
	print_gen gen 0
;;