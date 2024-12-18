.PHONY: all clean

all: RAINIER.C
	g++ -o RAINIER RAINIER.C `root-config --cflags --libs` -fopenmp

clean:
	rm -f RAINIER
