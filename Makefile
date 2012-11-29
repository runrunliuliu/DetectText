
CC =g++
CFLAGS =-c -Wall -fPIC
LDFLAGS =-lopencv_core -lopencv_highgui -lopencv_imgproc
CPPFLAGS= -I./

SHARED = -shared 

SOURCES=TextDetection.cpp 

OBJECTS=$(SOURCES:.cpp=.o)

OUT=libtextdetect.so

all: $(SOURCES) $(OUT)
	
$(OUT): $(OBJECTS) 
	$(CC) $(SHARED)-o $(OUT) $(OBJECTS)

.cpp.o:
	$(CC) $(CFLAGS) $(CPPFLAGS) $< -o $@

install:
	cp $(OUT) ../
clean:
	rm $(OBJECTS) $(OUT)
