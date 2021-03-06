# include and link HepMC, Catch-master, and LibXML
CXXFLAGS = -std=c++11 -std=gnu++11 -g
LDFLAGS  = 
LIBS     = -lHepMC -lxml2
INCLUDES = 
TESTINCLUDE = 

all: WZdecay test
	@tests/do_tests

WZdecay: main.cc lhefreader.cc hepmcreader269.cc hepmcwriter.cc lhefwriter.cc events.cc lorentzvector.cc threevector.cc LHEF.cc logger.cc
	@g++ $(CXXFLAGS) $(LDFLAGS) $(LIBS) $(INCLUDES) $^ -o $@

#WZdecaytest: maintest.cc lhefreader.cc hepmcreader269.cc hepmcwriter.cc events.cc lorentzvector.cc threevector.cc LHEF.cc
#	@g++ $(CXXFLAGS) $(LDFLAGS) $(LIBS) $(INCLUDES) $^ -o $@

test: tests/test.cpp threevector.cc
	@g++ $(CXXFLAGS) $(TESTINCLUDE) $^ -o tests/do_tests
