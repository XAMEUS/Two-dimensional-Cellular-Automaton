open Core;;
open Print;;

let fichier = "view_stable.ml";;
let file = ref (open_in fichier) ;;
let fileopen = ref false;;
exception File_Not_Find;;

let copyList zero =
	let size = List.length zero in
	let rec removeLast listf n = 
		if n==size-1 && List.nth zero n = "0"
		then listf
		else removeLast (List.nth zero n ::listf)  (n+1)
	in List.rev (removeLast [] 0)
;;

let aLine s = 	
	let splitwith0 = Str.split (Str.regexp_string " ") s in
	let split = copyList splitwith0 in 
	let sizeFull = List.length split in
	let size = int_of_float (sqrt (float_of_int sizeFull)) in 
	let board =Array.make_matrix size size D in
	let rec lifOrDead listd n =
		match listd with
			|[] -> (board:generation)
			|h::t ->
		if String.get h 0 = '-'
		then lifOrDead t (n+1)
		else 
			begin
				board.(n mod size).(n/size) <-A;
				lifOrDead t (n+1)
			end
	in lifOrDead split 0
;;

let rec readLine aut gen =
	if !fileopen = false 
	then exit 0
	else
		let line =
			try Some (input_line (!file))
			with End_of_file -> None
		in 
		match line with
		| None -> close_in (!file);
			fileopen := false; 
			Array.make_matrix 1 1 D
		|Some l ->
			aLine l
;;

let read filename aut gen =
	if Sys.file_exists filename 
	then 
		begin 
			file := open_in filename;
			fileopen := true
		end
	else raise File_Not_Find
		
;;

