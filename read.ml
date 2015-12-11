open Core;;

(*warning*)
let lineToArray s t size =
	for i=0 to size-1 do
		t.(i) <- if s.[i] = 'A' then A else D
	done;t
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
			| _ -> rules file ((lineToArray s (Array.make 5 D) 5)::aut)
		)
	| None -> failwith "rules error"
;;

let makegen file i gen =
	for j=0 to i-1 do
		let line = 
			try Some (input_line file)
			with End_of_file -> None
		in
		match line with
			| Some s -> gen.(j) <- lineToArray s (Array.make i D) i
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
		let gen:generation = makegen file dimension (Array.make_matrix dimension dimension D) in 
		(dimension, aut, gen)
	| None ->
		failwith "error"
;;

(*parse (open_in "test");;*)