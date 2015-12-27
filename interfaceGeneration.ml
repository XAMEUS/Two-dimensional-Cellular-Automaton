open Graphics;;
open Core;;
open Simulate;;

let background = (rgb 01 49 72);;
let color_alive = (rgb 235 80 93);;
let color_dead = background;;
let color_button = (rgb 244 152 100);;
let color_button_text = (rgb 29 118 116);;
let size_button_h = 95
let h_windows = ref 0;;
let l_windows = ref 0;;
let h_windows_util = ref 0;;
let size_case = ref 0;;
let margin = ref 0;;
let margin_pourcent = 20;;
let margin_grid_min = 20;;
let margin_grid_l = ref margin_grid_min;;
let margin_grid_h = ref margin_grid_min;;

let board ()=
	open_graph(" 400x600");
	h_windows := size_y ();
	l_windows := size_x ();
	set_window_title "Game of Life";
	set_color background;
	fill_rect 0 0 (!l_windows-1) (!h_windows-1);
	h_windows_util := ((!h_windows/100)*size_button_h);
;;

let color_case p = 
  match p with
  | A -> set_color color_alive;
  | D -> set_color color_dead
;;

let print gen =
	let size = (Array.length gen) in
	size_case := !size_case/size;
	let tmp = ((!size_case)*(100-(margin_pourcent))/100) in
	margin := (if !size_case-tmp>0 then !size_case-tmp else 0);
	for i = 0 to size-1 do
		for j = 0 to size-1 do
			color_case gen.(i).(j);
			let yD = (!size_case*(size-1))-(j*(!size_case))+(!margin_grid_l) in
			let yA = (!size_case-(!margin)) in
			fill_rect (i*(!size_case)+(!margin_grid_h)+(!margin/2)) (yD+(!margin/2)) yA yA;
		done;
	done
;;

let def_position () = 
	if l_windows < h_windows_util 
	then 
		begin
			size_case := !l_windows-(2*margin_grid_min);
			margin_grid_l := (!h_windows_util - (!size_case))/2
		end
	else
		begin
			size_case := !h_windows_util-(2*margin_grid_min);
			margin_grid_h := (!l_windows - (!size_case))/2
		end
;;

let rec bouton fonction gen aut =
	let xDQ = (!l_windows/100*40) in
	let yDQ = ((!h_windows/100)*size_button_h) in
	let xAQ = (45) in
	let yAQ = (20) in
	set_color color_button;
	fill_rect xDQ yDQ xAQ yAQ;
 	moveto (xDQ+10) (yDQ+5);
  	set_color color_button_text;
  	draw_string "Exit";
	let xDN = (!l_windows/100*70) in
	let yDN = ((!h_windows/100)*size_button_h) in
	let xAN = (45) in
	let yAN = (20) in
	set_color color_button;
	fill_rect xDN yDN xAN yAN;
 	moveto (xDN+10) (yDN+5);
  	set_color color_button_text;
  	draw_string "Next";
	let rec aux () = 
		let etat = wait_next_event[Button_down] in
    	let x = etat.mouse_x and y = etat.mouse_y in
    	if (x>=xDQ)&&(x<=xDQ+xAQ)&&(y>=yDQ)&&(y<=yAQ+yDQ) then close_graph ()
		else 
			if (x>=xDN)&&(x<=xDN+xAN)&&(y>=yDN)&&(y<=yAN+yDN) then show_inter fonction (fonction aut gen) aut
			else aux ()
	in aux ()
and show_inter fonction (gen:generation) (aut:automaton) =
	board ();
	def_position ();
  	print gen;
	bouton fonction gen aut
;;
