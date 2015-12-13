open Core;;

(*warning*)
let lineToArray s size =
	let a = Array.make size D in
	for i=0 to size-1 do
		a.(i) <- if s.[i] = 'A' then A else D
	done; a
;;

let rec rules file aut:automaton =
	let line = 
		try Some (input_line file)
		with End_of_file -> None
	in
	match line with
	| Some s ->
		(match s with
			| "Regles" -> rules file aut
			| "GenerationZero" -> aut
			| _ -> rules file ((lineToArray s 5)::aut)
		)
	| None -> failwith "rules error"
;;

let makegen file dim =
	let gen = Array.make_matrix dim dim D in
	for j=0 to dim-1 do
		let line = 
			try Some (input_line file)
			with End_of_file -> None
		in
		match line with
			| Some s -> gen.(j) <- lineToArray s dim
			| None -> failwith "makegen error"
	done; gen
;;

let parse (file:in_channel) =
	let first_line =
		try Some (input_line file)
		with End_of_file -> None
	in
	match first_line with
	| Some s ->
		let dimension = int_of_string s in
		let aut:automaton = rules file [] in
		let gen:generation = makegen file dimension in 
		(dimension, aut, gen)
	| None ->
		failwith "error"
;;

(*parse (open_in "test");;*)