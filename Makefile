HC = ghc
#OPT = -O3 -keep-s-files -dynamic -fno-warn-tabs
OPT = -O3 -dynamic -Wall

all: converttobase 

converttobase: converttobase.hs
	$(HC) $(OPT) $< -o $@

clean: 
	rm -f *.o *.hi *.s converttobase
