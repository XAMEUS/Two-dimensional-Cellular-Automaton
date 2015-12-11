#-------------------------------------------------------------------------------
# System dependent variables
#-------------------------------------------------------------------------------

prog: core.cmo print.cmo read.cmo test_print.cmo
	ocamlc -o prog core.cmo print.cmo read.cmo test_print.cmo

core.cmo: core.ml
	ocamlc -c core.ml

print.cmo: print.ml print.cmi core.cmo
	ocamlc -c print.ml

print.cmi: print.mli
	ocamlc print.mli

read.cmo: read.ml read.cmi core.cmo
	ocamlc -c read.ml

read.cmi: read.mli
	ocamlc read.mli

test_print.cmo: test_print.ml core.cmo print.cmi read.cmi
	ocamlc -c test_print.ml

clean :
	rm -f *.cmi *.cmo *.cma *.cmx *.cmxa *.o *.a .depend