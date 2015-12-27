#-------------------------------------------------------------------------------
# System dependent variables
#-------------------------------------------------------------------------------

prog: core.cmo formula.cmo automaton.cmo print.cmo read.cmo simulate.cmo stable.cmo show_stable.cmo test.cmo
	ocamlc str.cma -o prog core.cmo formula.cmo automaton.cmo print.cmo read.cmo simulate.cmo stable.cmo show_stable.cmo test.cmo

core.cmo: core.ml
	ocamlc -c core.ml

formula.cmo: formula.ml
	ocamlc -c formula.ml

automaton.cmo: automaton.ml automaton.cmi core.cmo
	ocamlc -c automaton.ml

automaton.cmi: automaton.mli
	ocamlc automaton.mli

print.cmo: print.ml print.cmi core.cmo
	ocamlc -c print.ml

print.cmi: print.mli
	ocamlc print.mli

read.cmo: read.ml read.cmi core.cmo
	ocamlc -c read.ml

read.cmi: read.mli
	ocamlc read.mli

simulate.cmo: simulate.ml simulate.cmi core.cmo
	ocamlc -c simulate.ml

simulate.cmi: simulate.mli
	ocamlc simulate.mli

stable.cmo: stable.ml stable.cmi core.cmo
	ocamlc -c stable.ml

stable.cmi: stable.mli
	ocamlc stable.mli

show_stable.cmo: show_stable.ml show_stable.cmi stable.cmi core.cmo
	ocamlc str.cma -c show_stable.ml

show_stable.cmi: show_stable.mli
	ocamlc show_stable.mli

test.cmo: test.ml core.cmo print.cmi read.cmi automaton.cmi
	ocamlc -c test.ml

clean :
	rm -f *.cmi *.cmo *.cma *.cmx *.cmxa *.o *.a .depend

doc : core.cmo formula.cmo automaton.cmo print.cmo read.cmo simulate.cmo stable.cmo show_stable.cmo
	mkdir -p doc; ocamldoc -d doc -html core.ml formula.ml automaton.mli print.mli read.mli simulate.mli stable.mli show_stable.mli
