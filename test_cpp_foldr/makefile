#Generated Basic Makefile

#Variables 
CXX = g++
FLAGS = -lm
EXE =  exe

#Rules
all: ${EXE}

${EXE}: foo.o bar.o main.o baz.o
	${CXX} ${FLAGS} -o ${EXE} foo.o bar.o main.o baz.o


foo.o: foo.h foo.cxx
	${CXX} ${FLAGS} -c foo.cxx -o foo.o

bar.o: bar.h bar.C
	${CXX} ${FLAGS} -c bar.C -o bar.o

main.o: foo.h bar.h baz.h main.cc
	${CXX} ${FLAGS} -c main.cc -o main.o

baz.o: baz.h foo.h bar.h baz.cpp
	${CXX} ${FLAGS} -c baz.cpp -o baz.o

clean:
	rm -rf *.o ${EXE}

#Make sure all and clean aren't generated as files
.PHONY: all clean
