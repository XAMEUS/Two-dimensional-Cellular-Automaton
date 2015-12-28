#-------------------------------------------------------------------------------
# System dependent variables
#-------------------------------------------------------------------------------

prog: core.cmo formula.cmo automaton.cmo print.cmo read.cmo simulate.cmo stable.cmo show_stable.cmo test.cmo
	ocamlc str.cma -o prog core.cmo formula.cmo automaton.cmo print.cmo read.cmo simulate.cmo stable.cmo show_stable.cmo test.cmo

show : core.cmo automaton.cmo print.cmo read.cmo simulate.cmo interfaceGeneration.cmo mainShow.cmo
	ocamlc graphics.cma str.cma -o show core.cmo automaton.cmo print.cmo read.cmo simulate.cmo interfaceGeneration.cmo mainShow.cmo

view: core.cmo automaton.cmo print.cmo read.cmo interfaceGeneration.cmo stable.cmo view_stable.cmo mainView.cmo
	ocamlc graphics.cma str.cma -o view core.cmo automaton.cmo print.cmo read.cmo interfaceGeneration.cmo stable.cmo view_stable.cmo mainView.cmo

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

stable.cmo: stable.ml stable.cmi core.cmo formula.cmo
	ocamlc -c stable.ml

stable.cmi: stable.mli
	ocamlc stable.mli

show_stable.cmo: show_stable.ml show_stable.cmi stable.cmi core.cmo
	ocamlc str.cma -c show_stable.ml

show_stable.cmi: show_stable.mli
	ocamlc show_stable.mli

test.cmo: test.ml core.cmo print.cmi read.cmi automaton.cmi
	ocamlc -c test.ml

mainShow.cmo: mainShow.ml core.cmo print.cmi read.cmi automaton.cmi
	ocamlc -c mainShow.ml

view_stable.cmo: view_stable.ml view_stable.cmi core.cmo print.cmo
	ocamlc -c view_stable.ml

view_stable.cmi: view_stable.mli
	ocamlc view_stable.mli

mainView.cmo: mainView.ml core.cmo print.cmi read.cmi automaton.cmi
	ocamlc -c mainView.ml

interfaceGeneration.cmo: interfaceGeneration.ml interfaceGeneration.cmi core.cmo simulate.cmo view_stable.cmo
	ocamlc -c interfaceGeneration.ml

interfaceGeneration.cmi: interfaceGeneration.mli
	ocamlc interfaceGeneration.mli

clean :
	rm -f *.cmi *.cmo *.cma *.cmx *.cmxa *.o *.a .depend; rm -rf doc dot

doc : core.cmo formula.cmo automaton.cmo print.cmo read.cmo simulate.cmo stable.cmo show_stable.cmo
	mkdir -p doc; ocamldoc -d doc -html core.ml formula.ml automaton.mli print.mli read.mli simulate.mli stable.mli show_stable.mli

dot : core.ml formula.ml automaton.ml print.ml read.ml simulate.ml stable.ml show_stable.ml test.ml
	mkdir -p dot; ocamldoc -o dot/dependency.dot -dot *.ml; dot -Tpng dot/dependency.dot -o dot/dependency.png
