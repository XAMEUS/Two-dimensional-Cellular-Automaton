open Core;;
open Stable;;

let inv l =
	let rec aux l ll = match l with
		| [] -> ll ^ "0"
		| h::t -> if h = "0" then ll ^ "0"
			else aux t ((if h.[0] = '-' then (String.sub h 1 (String.length h - 1)) else ("-" ^ h)) ^ " " ^ ll)
	in aux l ""
;;

let get_line ic =
	try Some (input_line ic)
	with End_of_file -> None
;;

let is_stable f =
	let tmp_gen = open_in f in
	let result = match get_line tmp_gen with
		| Some line -> line
		| None -> ""
	in
	if result = "SAT" then
		begin
			match get_line tmp_gen with
				| Some line -> close_in tmp_gen; line
				| None -> close_in tmp_gen;""
		end
	else
		begin
			close_in tmp_gen;
			""
		end
;;

let add_line l f =
	let oc = open_out_gen [Open_creat; Open_text; Open_append] 0o640 f in
	output_string oc (l ^ "\n");
	close_out oc
;;

let rec new_first_line l s = match l with
	| [] -> s
	| h::t -> if t = [] then s ^ (string_of_int(int_of_string h + 1)) else new_first_line t (s ^ h  ^ " ")
;;

let update_fnc f =
	let tmp_fnc = f ^ ".tmp" in
	let ic = open_in f
	and oc = open_out tmp_fnc in
	let first_line = match get_line ic with
		| Some line -> line
		| None -> ""
	in
	let l = (Str.split (Str.regexp " +") first_line) in
	let new_first_line = new_first_line l "" in
	output_string oc new_first_line; output_char oc '\n';
	let rec aux ic =
		match get_line ic with
		| Some line -> output_string oc line; output_char oc '\n'; aux ic;
		| None -> close_in ic; close_out oc; Sys.remove f; Sys.rename tmp_fnc f
	in
	aux ic
;;

let rec show_stable () =
	let _ = Sys.command "./minisat fnc.dimacs tmp_gen >> log" in
	let gen = is_stable "tmp_gen" in
	if gen = "SAT" then
		begin
			add_line (inv (Str.split (Str.regexp " +") gen)) "fnc.dimacs";
			add_line gen "gens";
			(*update_fnc "fnc.dimacs";*)
			show_stable ()
		end
;;