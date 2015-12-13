#-------------------------------------------------------------------------------
# System dependent variables
#-------------------------------------------------------------------------------

prog: core.cmo automaton.cmo print.cmo read.cmo simulate.cmo test.cmo
	ocamlc -o prog core.cmo automaton.cmo print.cmo read.cmo simulate.cmo test.cmo

core.cmo: core.ml
	ocamlc -c core.ml

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

test.cmo: test.ml core.cmo print.cmi read.cmi
	ocamlc -c test.ml

clean :
	rm -f *.cmi *.cmo *.cma *.cmx *.cmxa *.o *.a .depend