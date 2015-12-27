open Core;;
open Read;;
open Print;;
open Automaton;;
open Simulate;;
open InterfaceGeneration;;


let (size, aut, gen) = parse (open_in "test");;

show_inter next_generation gen aut;;
