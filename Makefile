# Compiler to use
CC=gcc

# file to compile
TARGET=$(SOURCE:.c=)

CFLAGS=-Wall
LDFLAGS=-lm

OPTCFLAGS=-O2
# debug flag
DEBUGCFLAGS=-g

OBJ=$(TARGET).o


# Default Target, dependency on $(TARGET)
all: $(TARGET)

# Optimised target, add OPTCFLAGS
opt: CFLAGS+=$(OPTCFLAGS)
opt: $(TARGET)

# Debug target, add DEBUG Flags
debug: CFLAGS+=$(DEBUGCFLAGS)
debug: $(TARGET)


$(TARGET): $(OBJ)
	$(CC) $(LDFLAGS) -o $@ $^


%.o:%.c
	$(CC) $(CFLAGS) -c $<


.PHONY: clean 
clean:
	rm *.o




