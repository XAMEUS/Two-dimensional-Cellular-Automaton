open Core;;

let print_v s =
	if s = A then print_string " | A"
	else print_string " | D"
;;

let rec print_separator n =
	if n > 0 then
		begin
			print_string ("+---");
			print_separator (n - 1)
		end
	else print_string "+\n"
;;

let rec print_l a =
	Array.iter print_v a;
	print_string " |\n ";
	print_separator (Array.length a)
;;

let rec print_gen (gen:generation) =
	print_string " ";
	print_separator (Array.length gen);
	Array.iter print_l gen
;;

let show_generation (gen:generation) =
	print_gen gen
;;