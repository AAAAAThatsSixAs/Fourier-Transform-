EXENAME = fourier

OBJS = png.o rgbapixel.o fourier.o

CXX = clang++
CXXFLAGS = -std=c++1y -stdlib=libc++ -c -g -O2 -Wall -Wextra -pedantic
LD = clang++
LDFLAGS = -std=c++1y -stdlib=libc++ -lpng -lc++abi -lpthread

all : $(EXENAME)

$(EXENAME) : $(OBJS)
	$(LD) $(OBJS) $(LDFLAGS) -o $(EXENAME)

#included as part of the EasyPNG library
png.o : png.cpp png.h rgbapixel.h 
	$(CXX) $(CXXFLAGS) png.cpp

rgbapixel.o : rgbapixel.cpp rgbapixel.h
	$(CXX) $(CXXFLAGS) rgbapixel.cpp

#main files
fourier.o : fourier.cpp fourier.h png.h
	$(CXX) $(CXXFLAGS) fourier.cpp 

main.o : main.cpp fourier.h
	$(CXX) $(CXXFLAGS) main.cpp 

#delete all object and png files
clean :
	-rm -f *.o $(EXENAME) 
	-rm -f *.png