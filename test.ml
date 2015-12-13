open Core;;
open Read;;
open Print;;

let (size, aut, gen) = parse (open_in "test");;

show_generation gen;;
