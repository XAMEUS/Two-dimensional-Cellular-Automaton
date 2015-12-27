val background : Graphics.color
val color_alive : Graphics.color
val color_dead : Graphics.color
val color_button : Graphics.color
val color_button_text : Graphics.color
val size_button_h : int
val h_windows : int ref
val l_windows : int ref
val h_windows_util : int ref
val size_case : int ref
val margin : int ref
val margin_pourcent : int
val margin_grid_min : int
val margin_grid_l : int ref
val margin_grid_h : int ref
val board : unit -> unit
val color_case : Core.state -> unit
val print : Core.state array array -> unit
val def_position : unit -> unit
val bouton :
  (Core.automaton -> Core.generation -> Core.generation) ->
  Core.generation -> Core.automaton -> unit
val show_inter :
  (Core.automaton -> Core.generation -> Core.generation) ->
  Core.generation -> Core.automaton -> unit
