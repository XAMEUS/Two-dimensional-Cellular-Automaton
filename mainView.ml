open Core;;
open Read;;
open Print;;
open Automaton;;
open Simulate;;
open Stable;;
open Formula;;
open InterfaceGeneration;;
open View_stable;;

let (size, aut, gen) = parse (open_in "test");;


read "gens" aut gen;;
show_inter readLine (readLine aut gen) aut;;
