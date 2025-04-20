MODE ?= release

SRC = RAINIER.C
OBJ = $(SRC:.C=.o)
TARGET = RAINIER

CXX = g++
CXXFLAGS_RELEASE = -Wall -O2 -g `root-config --cflags`
CXXFLAGS_DEBUG = -Wall -O0 -g `root-config --cflags`
LDFLAGS = `root-config --libs` -fopenmp

ifeq ($(MODE), debug)
    CXXFLAGS = $(CXXFLAGS_DEBUG)
else
    CXXFLAGS = $(CXXFLAGS_RELEASE)
endif

.PHONY: all clean

all: $(OBJ)
	$(CXX) -o $(TARGET) $(OBJ) $(LDFLAGS)

%.o: %.C
	$(CXX) -c $< -o $@ $(CXXFLAGS)

clean:
	rm -f $(OBJ) $(TARGET)

help:
	@echo "Makefile options:"
	@echo "  make MODE=debug    Build in debug mode"
	@echo "  make MODE=release  Build in release mode (default)"
