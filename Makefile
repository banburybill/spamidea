CXXFLAGS:=-std=gnu++17 -Wall -O2 -MMD -MP -ggdb -Iext/simplesocket -Iext/catch -pthread

PROGRAMS = getsender

all: $(PROGRAMS)

clean:
	rm -f *~ *.o *.d test $(PROGRAMS)

check: testrunner tdns tdig
	./testrunner
	cd tests ; ./basic

-include *.d

getsender: getsender.o
	g++ -std=gnu++14 $^ -o $@ -pthread


testrunner: tests.o record-types.o dns-storage.o dnsmessages.o 
	g++ -std=gnu++14 $^ -o $@ 