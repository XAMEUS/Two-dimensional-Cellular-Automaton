# Two-dimensional-Cellular-Automaton
Game of life

## 1. How to use the Makefile

### Compile sources
Use:
```
make
make show
make view
```

### Generate the documentation
Use (after a `make`):
```
make doc  # html doc
make dot  # generate a dependency graph
```

### Clean
Use:
```
make clean
```

## 2. How to use the program

Put your automaton (rules) and GenerationZero into the file "test" :
```
3
Regles
DDADD
DADDD
DDDDD
AAAAD
AAADA
AAADD
AADDA
DDAAD
DDAAA
DADDA
DDADA
DADAA
DADDA
DDADA
DDDDA
AADDD
AAADD
DDAAA
GenerationZero
DDA
ADA
AAA
```

Then run : `./prog` to generate the "gens" file, containing all stable generations.

You can use `./view` to visualize all stable generations, or `./show` to run the game on the GenerationZero (step by step).

---

Documentation: http://xameus.github.io/Two-dimensional-Cellular-Automaton/doc/
